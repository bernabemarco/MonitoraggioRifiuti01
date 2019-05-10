CREATE PROCEDURE [dbo].[GEM_RAPPORTI_FATTURAZIONE_CONFERMA]  ( @IDRAPPORTO AS VARCHAR(14), @IDSESSIONE AS INT) AS
  /*
    TEST
    DECLARE @IDRAPPORTO AS VARCHAR(14)
    DECLARE @IDSESSIONE AS INT
    SET @IDRAPPORTO = '2010ST000007SI'
  */

  DECLARE @FLG_RIC_SCA_AUTO   AS VARCHAR(1)
  DECLARE @IDCONTRATTO        AS VARCHAR(13)
  DECLARE @IDCONTRATTOAgg     AS VARCHAR(13)
  DECLARE @SEZIONECONTRATTO   AS DECIMAL (5,0)
  DECLARE @SEZIONECONTRATTOAgg AS DECIMAL (5,0)
  DECLARE @TIPOLOGIARAPPORTO  AS VARCHAR(2)
  DECLARE @MESIRITARDO        AS INT
  DECLARE @RC                 AS INT
  --DECLARE @NOTE_TECNICO     AS NTEXT
  DECLARE @DATA_PREV          AS DATETIME
  DECLARE @DATA_EFF           AS DATETIME
  DECLARE @MESSAGGIO          AS VARCHAR(255)
  -- 18.05.2011 Moreno Feletto - TV1074052 - Sviluppo Pacchetto 6 N.13
  DECLARE @Referente          AS VARCHAR(50)
  DECLARE @Tel_Ref            AS VARCHAR(50)
  DECLARE @Email_Responsabile AS VARCHAR(100)
  DECLARE @IdTipoMezzo        AS INT
  DECLARE @PosAttivita        AS INT
  DECLARE @TipAttEseguita     AS CHAR(1)
  DECLARE @Sql                                                     AS VARCHAR(3000)
  DECLARE @AGGIORNA           AS VARCHAR(13)
  DECLARE @SEZIONESEC         AS DECIMAL (5,0)
  DECLARE @Apice              as VARCHAR(1)
  DECLARE @cDATA_EFF                    AS DATETIME
  DECLARE @IDRIGAMEZZO                  AS DECIMAL (5,0)
  DECLARE @IDTIPOLOGMEZZO         AS DECIMAL (5,0)
  DECLARE @FLAGAT1                      AS VARCHAR(1)

  --RECUPERO DATI DEL CONTRATTO E DEL RAPPORTO
  SELECT  @IDCONTRATTO=IDCONTRATTO,
          @SEZIONECONTRATTO=SEZIONECONTRATTO,
          @DATA_PREV=DATA_PREV,
          @DATA_EFF=DATA_EFF,
          @TIPOLOGIARAPPORTO=TIPOLOGIARAPPORTO,
          -- 18.05.2011 Moreno Feletto - TV1074052 - Sviluppo Pacchetto 6 N.13
          @Referente =  ISNULL(Referente,''),
          @Tel_Ref =  ISNULL(Tel_Ref,''),
          @Email_Responsabile = ISNULL(Email_Responsabile,'')          
  FROM dbo.GEM_SEZIONECONTRATTORAPPORTI
  WHERE IDRAPPORTO = @IDRAPPORTO

  SELECT  @FLG_RIC_SCA_AUTO = ISNULL(vc.SEZ_FLG_RIC_SCA_AUTO,
                           ISNULL(vc.FLG_RIC_SCA_AUTO ,'S')),
                           -- 26.05.2011 Moreno Feletto - TV1074052 del 10.01.2011 - Sviluppo Pacchetto 6 - N.13 bis
                           @IdTipoMezzo = idTipologMezzo
  FROM GEM_Vistacontratti vc
  WHERE vc.IDCONTRATTO = @IDCONTRATTO
    AND vc.SEZIONECONTRATTO = @SEZIONECONTRATTO

  -- Procedura di riallineamento Mezzi da Rapporto a Contratto
  EXECUTE @RC  = [dbo].[GEM_RAPPORTI_FATTURAZIONE_ALLINEA_MEZZI]  @IDRAPPORTO ,@IDSESSIONE
  IF @RC <> 0 BEGIN
    RETURN 1
  END

  -- Aggiornamento Date Rapporti Futuri-------------------------
  -- VERIFICA eventuale eccezione del rapporto
  IF (SELECT ISNULL(FLG_DerogaRicScadenze,'N') from dbo.GEM_SEZIONECONTRATTORAPPORTI WHERE idRapporto = @IDRAPPORTO) <> 'S' BEGIN

    --calcolo mesi ritardo
    SELECT  @MESIRITARDO= DATEDIFF(month, @DATA_PREV, @DATA_EFF)

    --controllo mesi ritardo e clausole contrattuali
    IF @MESIRITARDO <> 0 AND @FLG_RIC_SCA_AUTO  = 'S'
    BEGIN
      -- chiamo stored ricalcolo
      EXEC @RC= GEM_RICALCOLA_SCAD_RAPPORTI  @IDCONTRATTO , @SEZIONECONTRATTO , @MESIRITARDO , @IDSESSIONE
      IF @RC <> 0 BEGIN
        RETURN 1
      END
    END
  END

  --AGGIORNAMENTO NOTE
  UPDATE dbo.GEM_SEZIONICONTRATTO
    SET NOTE_TECNICO = R.NOTE_TECNICO,
		--MM tv1800400 PUNTO 86 87.3
		FLG_AmbientiConf=R.FLG_AmbientiConf,
		FLG_LavoriInQuota=R.FLG_LavoriInQuota
		--MM tv1800400 PUNTO 86 87.3
  FROM dbo.GEM_SEZIONECONTRATTORAPPORTI R
       INNER JOIN  dbo.GEM_SEZIONICONTRATTO S ON R.IDCONTRATTO = S.IDCONTRATTO 
                                                                                                                                                    AND R.SEZIONECONTRATTO = S.SEZIONECONTRATTO
  WHERE R.IDRAPPORTO = @IDRAPPORTO
  IF @@ERROR <> 0 BEGIN
    SET @MESSAGGIO  = 'RAPPORTI: ' + @IDRAPPORTO + ' - ERRORE IN AGGIORNAMENTO NOTE TECNICO SU SEZIONE RAPPORTO'
    EXEC GEM_REG_ERRORLOG @IDSESSIONE,@MESSAGGIO
    RETURN 1
  END

  -- AGGIORNAMENTO RAPPORTO
  UPDATE dbo.GEM_SEZIONECONTRATTORAPPORTI
    SET STATO = 'V',
        flag_GeneraListeSMS =   'X',
        idsessioneProcessiRap = @IDSESSIONE,
        DATAMODIFICA=           GETDATE(),
        UTENTEMODIFICA=         USER_NAME()
  WHERE IDRAPPORTO = @IDRAPPORTO

  IF @@ERROR <> 0 BEGIN
    SET @MESSAGGIO  = 'RAPPORTI: ' + @IDRAPPORTO + ' - ERRORE IN AGGIORNAMENTO STATO SU RAPPORTO '
    EXEC GEM_REG_ERRORLOG @IDSESSIONE,@MESSAGGIO
    RETURN 1
  END

  -- --------- 24.05.2011 Moreno Feletto - TV1074052 - Sviluppo Pacchetto 6 N.13
  -- AGGIORNAMENTO SEZIONICONTRATTO
  UPDATE dbo.GEM_SEZIONICONTRATTO
  SET  
             Referente =             @Referente,
             Tel_Ref =               @Tel_Ref,
             Email_Responsabile =    @Email_Responsabile  
  WHERE IDCONTRATTO = @IDCONTRATTO
    AND SEZIONECONTRATTO = @SEZIONECONTRATTO
  IF @@ERROR <> 0 BEGIN
    SET @MESSAGGIO  = 'RAPPORTI: ' + @IDRAPPORTO + ' - ERRORE IN AGGIORNAMENTO SEZIONE CONTRATTO DA RAPPORTO'
    EXEC GEM_REG_ERRORLOG @IDSESSIONE,@MESSAGGIO
    RETURN 1
  END
       -- ---------
       
       -- --------- 26.05.2011 Moreno Feletto - TV1074052 del 10.01.2011 - Sviluppo Pacchetto 6 - N.13 bis
       DECLARE AttMezzi CURSOR LOCAL FAST_FORWARD FOR
             SELECT Posizione, TipologiaAttivitaEseguita 
             FROM dbo.GEM_VistaAttivitaMezzi
             WHERE PRIMARIA=1 
                    AND idTipologMezzo = @IdTipoMezzo
             ORDER BY Posizione
    print @IdTipoMezzo
       OPEN AttMezzi
             FETCH AttMezzi INTO @PosAttivita, @TipAttEseguita

       WHILE @@FETCH_STATUS = 0
             BEGIN
                    set @Apice= char(39) 
                    SET @Sql = 'UPDATE [dbo].[GEM_SEZIONECONTRATTORAPPORTIMEZZI] '
                    SET @Sql = @Sql + 'SET UltimaAttivitaEseg =' + @Apice + @TipAttEseguita + @Apice
                    SET @Sql = @Sql + ' WHERE IdRapporto=' + @Apice + @IDRAPPORTO + @Apice + ' AND FlagAT' + RTRIM(LTRIM(STR(@PosAttivita))) + '=1;'
                    print @Sql
                    EXEC(@Sql);  
                    IF @@ERROR <> 0 BEGIN
                           SET @MESSAGGIO  = 'RAPPORTI: ' + @IDRAPPORTO + ' - ERRORE IN ULTIMAATTIVITAESEG GEM_SEZIONECONTRATTORAPPORTIMEZZI'
                           EXEC GEM_REG_ERRORLOG @IDSESSIONE,@MESSAGGIO
                           RETURN 1
                    END      

                    FETCH AttMezzi INTO @PosAttivita, @TipAttEseguita
             END;
       CLOSE AttMezzi
       DEALLOCATE AttMezzi    

       -- Aggiorno UltimaAttivitaEseg di GEM_SEZIONICONTRATTODETTMEZZI con quella di GEM_SEZIONECONTRATTORAPPORTIMEZZI
       UPDATE DM
       SET UltimaAttivitaEseg = RM.UltimaAttivitaEseg
       FROM GEM_SEZIONICONTRATTODETTMEZZI DM
       INNER JOIN GEM_SEZIONECONTRATTORAPPORTIMEZZI RM ON RM.IdContratto=DM.IdContratto AND RM.SezioneContratto=DM.SezioneContratto AND RM.IdRigamezzo=DM.IdRigamezzo
       WHERE RM.IdRapporto=@IDRAPPORTO
       -- --------- Fine 20.05.2011 Moreno Feletto
       
       ---- 01/07/2016 CASTELLO AGGIORNAMENTO CAMPI IDRAPPORTOULTIMAVISITA E DATA ULTIMA VISITA - PD1600099 PUNTO A
       --UPDATE DM
       --SET idRapportoUltimVista = @IDRAPPORTO, DataUltimaVisita = RM.DataUltimaVisita
       --FROM GEM_SEZIONICONTRATTODETTMEZZI AS DM INNER JOIN GEM_SEZIONECONTRATTORAPPORTIMEZZI AS RM ON RM.IDCONTRATTO = DM.IDCONTRATTO AND RM.SEZIONECONTRATTO = DM.SEZIONECONTRATTO AND RM.IdRigaMezzo = DM.IdRigaMezzo
       --WHERE (RM.FLAGAT1 = '1') AND (RM.IDRAPPORTO = @IDRAPPORTO)
       ---- FINE 01/07/2016 CASTELLO


  -- --------- 07.02.2013 Moreno Feletto - TV1272869 del 01.01.2013 - Revisione Impianti e CheckList
  -- AGGIORNAMENTO COMPONENTI


       DECLARE CURR_TESTE CURSOR  LOCAL  FAST_FORWARD FOR

	   --Sabrina corretto il puntamento della visita da flagAt1 a StatoAttivita=1 sempre del dettaglio mezzi, dt 2016.11.09
       --SELECT scr.IDCONTRATTO,scr.SEZIONECONTRATTO,scrm.IDRIGAMEZZO,sc.IdTipologMezzo,scr.DATA_EFF,isnull(scrm.FLAGAT1,0)
	   SELECT scr.IDCONTRATTO,scr.SEZIONECONTRATTO,scrm.IDRIGAMEZZO,sc.IdTipologMezzo,scr.DATA_EFF,isnull(scrm.statoAttivita,0) as FLAGAT1
    FROM dbo.GEM_SEZIONECONTRATTORAPPORTI scr inner join  dbo.GEM_SEZIONECONTRATTORAPPORTIMEZZI scrm  on scr.IDRAPPORTO = scrm.IDRAPPORTO
                    inner join GEM_SEZIONICONTRATTO sc on scr.IDCONTRATTO = sc.IDCONTRATTO and sc.SEZIONECONTRATTO = scr.SEZIONECONTRATTO
   -- WHERE scr.IDRAPPORTO = @IDRAPPORTO AND scrm.FLAGAT1=1
    WHERE scr.IDRAPPORTO = @IDRAPPORTO AND scrm.statoAttivita=1

       OPEN CURR_TESTE
       FETCH NEXT FROM CURR_TESTE INTO  @IDCONTRATTOAgg, @SEZIONECONTRATTOAgg, @IDRIGAMEZZO, @IdTipologMezzo, @cDATA_EFF, @FLAGAT1

       WHILE @@FETCH_STATUS = 0
       BEGIN
           print @IDRAPPORTO
             print @cDATA_EFF
             UPDATE GEM_SEZIONICONTRATTODETTMEZZI SET IdRapportoUltimVista=@IDRAPPORTO, DataUltimaVisita=@cDATA_EFF 
               WHERE IDCONTRATTO=@IDCONTRATTOAgg AND SEZIONECONTRATTO=@SEZIONECONTRATTOAgg AND IDRIGAMEZZO=@IDRIGAMEZZO
             FETCH NEXT FROM CURR_TESTE INTO  @IDCONTRATTO, @SEZIONECONTRATTO, @IDRIGAMEZZO, @IdTipologMezzo, @cDATA_EFF, @FLAGAT1
       END

       CLOSE CURR_TESTE
       DEALLOCATE CURR_TESTE


       
       SELECT @AGGIORNA=IDCONTRATTO
    FROM GEM_SEZIONICONTRATTO SC
        left join GEMMADBG.dbo.GEM_T_TabCodiciMezziAssegnati GTCA on SC.idTipologMezzo = GTCA.idTipologMezzo and SC.CodiceMezzo = GTCA.CodiceMezzo COLLATE Latin1_General_CI_AS and TipoCeckList='I'
    WHERE ((SezioneAggrPrimaria<>0 ) or (SezioneAggrPrimaria=0 and CodSezioniAggregate=0)) and IDCONTRATTO=@IDCONTRATTO and SEZIONECONTRATTO=@SEZIONECONTRATTO

    IF @AGGIORNA<>'' BEGIN
             
             DELETE [GEM_SEZIONI_Componenti]
             WHERE IDCONTRATTO = @IDCONTRATTO 
                    AND SEZIONECONTRATTO = @SEZIONECONTRATTO

             INSERT INTO [dbo].[GEM_SEZIONI_Componenti]
                           (
                           [IDCONTRATTO]
                           ,[SEZIONECONTRATTO]
                           ,[IdRigaMezzo]
                           ,[POSIZIONE]
                           ,[IdApparato]
                           ,[IdSottoTipoApparato]
                           ,[MARCA]
                           ,[MODELLO]
                           ,[QUANTITA]
                           ,[IMPORTO_UNITARIO]
                           ,[ELIMINATO]
                           ,[PROVVIGIONE1]
                           ,[PROVVIGIONE2]
                           ,[PROVVIGIONE3]
                           ,[NOTE]
                           ,[UTENTEMODIFICA]
                           ,[DATAMODIFICA]            
                           ,[SEGNALATO]
                           )
                    SELECT
                           [IDCONTRATTO]
                           ,[SEZIONECONTRATTO]
                           ,[IdRigaMezzo]
                           ,[POSIZIONE]
                           ,[IdApparato]
                           ,[IdSottoTipoApparato]
                           ,[MARCA]
                           ,[MODELLO]
                           ,[QUANTITA]
                           ,[IMPORTO_UNITARIO]
                           ,[ELIMINATO]
                           ,[PROVVIGIONE1]
                           ,[PROVVIGIONE2]
                           ,[PROVVIGIONE3]
                           ,[NOTE]
                           ,USER_NAME()
                           ,GETDATE()
                           ,[SEGNALATO]
                    FROM [dbo].[GEM_SEZIONERAPPORTI_Componenti]    
                    WHERE IDCONTRATTO = @IDCONTRATTO
                           AND SEZIONECONTRATTO = @SEZIONECONTRATTO AND IDRAPPORTO = @IDRAPPORTO

                    SELECT @AGGIORNA=IDCONTRATTO
                    FROM GEM_SEZIONICONTRATTO SC
                           left join GEMMADBG.dbo.GEM_T_TabCodiciMezziAssegnati GTCA on SC.idTipologMezzo = GTCA.idTipologMezzo and SC.CodiceMezzo = GTCA.CodiceMezzo COLLATE Latin1_General_CI_AS and TipoCeckList='I'
                    WHERE (SezioneAggrPrimaria<>0 ) and IDCONTRATTO=@IDCONTRATTO and SEZIONECONTRATTO=@SEZIONECONTRATTO
                 
                    -- AGGIORNO SEZIONI AGGR SECONDARIE
                    IF @AGGIORNA<>'' BEGIN
             
                           Declare curContratto Cursor For
                           SELECT SEZIONECONTRATTO
                           FROM GEM_SEZIONICONTRATTO SC
                                  left join GEMMADBG.dbo.GEM_T_TabCodiciMezziAssegnati GTCA on SC.idTipologMezzo = GTCA.idTipologMezzo and SC.CodiceMezzo = GTCA.CodiceMezzo COLLATE Latin1_General_CI_AS and TipoCeckList='I'
                           WHERE (SezioneAggrPrimaria=0 ) and IDCONTRATTO=@IDCONTRATTO and CodSezioniAggregate=@SEZIONECONTRATTO


                           Open curContratto
                           Fetch Next From curContratto  Into @SEZIONESEC
                           While @@Fetch_Status = 0
                           Begin
                                  DELETE [GEM_SEZIONI_Componenti]
                            WHERE IDCONTRATTO = @IDCONTRATTO 
                                  AND SEZIONECONTRATTO = @SEZIONESEC
                                  
                                  INSERT INTO [dbo].[GEM_SEZIONI_Componenti]
                                  (
                                  [IDCONTRATTO]
                                  ,[SEZIONECONTRATTO]
                                  ,[IdRigaMezzo]
                                  ,[POSIZIONE]
                                  ,[IdApparato]
                                  ,[IdSottoTipoApparato]
                                  ,[MARCA]
                                  ,[MODELLO]
                                  ,[QUANTITA]
                                  ,[IMPORTO_UNITARIO]
                                  ,[ELIMINATO]
                                  ,[PROVVIGIONE1]
                                  ,[PROVVIGIONE2]
                                  ,[PROVVIGIONE3]
                                  ,[NOTE]
                                  ,[UTENTEMODIFICA]
                                  ,[DATAMODIFICA]            
                                  ,[SEGNALATO]
                                  )
                                  SELECT
                                  [IDCONTRATTO]
                                  ,@SEZIONESEC
                                  ,[IdRigaMezzo]
                                  ,[POSIZIONE]
                                  ,[IdApparato]
                                  ,[IdSottoTipoApparato]
                                  ,[MARCA]
                                  ,[MODELLO]
                                  ,[QUANTITA]
                                  ,[IMPORTO_UNITARIO]
                                  ,[ELIMINATO]
                                  ,[PROVVIGIONE1]
                                  ,[PROVVIGIONE2]
                                  ,[PROVVIGIONE3]
                                  ,[NOTE]
                                  ,USER_NAME()
                                  ,GETDATE()
                                  ,[SEGNALATO]
                                  FROM [dbo].[GEM_SEZIONERAPPORTI_Componenti]    
                                  WHERE IDCONTRATTO = @IDCONTRATTO
                                  AND SEZIONECONTRATTO = @SEZIONECONTRATTO AND IDRAPPORTO = @IDRAPPORTO

                                  Fetch Next From curContratto Into @SEZIONESEC
                           End
                           Close curContratto
                           Deallocate curContratto
                  END
       END
  IF @@ERROR <> 0 BEGIN
    SET @MESSAGGIO  = 'RAPPORTI: ' + @IDRAPPORTO + ' - ERRORE IN AGGIORNAMENTO COMPONENTI DA RAPPORTO'
    EXEC GEM_REG_ERRORLOG @IDSESSIONE,@MESSAGGIO
    RETURN 1
  END
       -- --------- Fine 07.02.2013 Moreno Feletto
  RETURN 0
  

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_RAPPORTI_FATTURAZIONE_CONFERMA] TO [Metodo98]
    AS [dbo];

