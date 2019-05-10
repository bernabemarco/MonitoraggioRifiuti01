
CREATE PROCEDURE [dbo].[GEM_RAPPORTI_RILASCIO] ( @IDRAPPORTO varchar(14) ) AS
begin
	DECLARE @IDRAPPORTOAGGREGATO		AS VARCHAR(14)
	DECLARE @IDCONTRATTO						AS VARCHAR(13)
	DECLARE @SEZIONECONTRATTO				AS DECIMAL(5,0)
	DECLARE @CODICEMEZZO						AS VARCHAR(50)
	DECLARE @VERCHECKLIST						AS DECIMAL(5,0)
	DECLARE @TITOLOCHECKLIST				AS VARCHAR(80)
	DECLARE @nErrNum								AS INT
	-- 18.05.2011 Moreno Feletto - TV1074052 - Sviluppo Pacchetto 6 N.13
	DECLARE @Referente							AS VARCHAR(50)
	DECLARE @Tel_Ref								AS VARCHAR(50)
	DECLARE @Email_Responsabile			AS VARCHAR(100)
	-- Rif. Ns. SF TV1272869 del 01.01.2013 - Revisione Impianti e CheckList		
	DECLARE @FlgOblLetturaNote 			AS SMALLINT
	DECLARE @cCodMezzo							AS VARCHAR(50)
	-- PD1300332 - Commesse su contr 1.2
	DECLARE @RIFCOMMCLI							AS VARCHAR(50)
	-- fine PD1300332 - Commesse su contr 1.2
	BEGIN TRANSACTION 

		-- CANCELLO EVENTUALI MEZZI GIA ESISTENTI
		DELETE [GEM_SEZIONECONTRATTORAPPORTIMEZZI]
		WHERE [IDRAPPORTO] = @IDRAPPORTO
		SET @nErrNum=@@ERROR
		IF @nErrNum<>0 GOTO ERRORE
		
		-- Rif. Ns. SF TV1272869 del 01.01.2013 - Revisione Impianti e CheckList
		DELETE [GEM_SEZIONERAPPORTI_Componenti]
		WHERE [IDRAPPORTO] = @IDRAPPORTO
		SET @nErrNum=@@ERROR
		IF @nErrNum<>0 GOTO ERRORE		

		DELETE [GEM_SEZIONECONTRATTORAPPORTIMEZZI_Allegati]
		WHERE [IDRAPPORTO] = @IDRAPPORTO
		print @@ERROR
		SET @nErrNum=@@ERROR
		IF @nErrNum<>0 GOTO ERRORE		


		-- LETTURA RIFERIMENTO CONTRATTO E SEZIONE
		SELECT	@IDCONTRATTO=IDCONTRATTO,
						@SEZIONECONTRATTO=SEZIONECONTRATTO,
						@IDRAPPORTOAGGREGATO=ISNULL(IDRAPPORTOAGGREGATO,0)
		FROM dbo.GEM_SEZIONECONTRATTORAPPORTI
		WHERE IDRAPPORTO = @IDRAPPORTO

		-- Leggo Codice Mezzo e versione check list
		SELECT  @CODICEMEZZO = 			ISNULL(SC.CodiceMezzo,''), 
						@VERCHECKLIST = 		ISNULL(VersioneCheKList,0), 
						@TITOLOCHECKLIST =	ISNULL(TITOLOCHEKLIST,''),
						-- 18.05.2011 Moreno Feletto - TV1074052 - Sviluppo Pacchetto 6 N.13
						@Referente =	ISNULL(SC.Referente,''),
						@Tel_Ref =	ISNULL(SC.Tel_Ref,''),
						@Email_Responsabile =	ISNULL(SC.Email_Responsabile,''),
						-- Rif. Ns. SF TV1272869 del 01.01.2013 - Revisione Impianti e CheckList
						@FlgOblLetturaNote = 	ISNULL(SC.FlgOblLetturaNote,0)
		FROM GEM_SEZIONICONTRATTO SC 
		LEFT OUTER JOIN dbo.GEM_Vista_TesteCheckList TC on sc.CODICEMEZZO collate Latin1_General_CI_AS = TC.CODICEMEZZO 
			AND TC.FlagVerStd=1
		WHERE SC.IDCONTRATTO = @IDCONTRATTO 
			AND SC.SEZIONECONTRATTO = @SEZIONECONTRATTO
		
		-- subordinare alla lettura dei solo mezzi attivi ovvero 
		-- select * from GEM_SEZIONICONTRATTODETTMEZZI DalaEliminazione è nulla sul Mezzo legato al contratto, sezione

		-- INSERIMENTO RAPPORTI MEZZI
		INSERT INTO [dbo].[GEM_SEZIONECONTRATTORAPPORTIMEZZI]
				(
				[IDCONTRATTO]
				,[SEZIONECONTRATTO]
				,[IDRAPPORTO]
				,[IdRigaMezzo]
				,[IDRAPPORTOAGGREGATO]
				,[CodMezzo]
				,[DataInserimento]
				,[DataEliminazione]
				,[ELIMINATO]
				,[POSIZIONE]
				,[SUBPOSIZIONE]
				,[UBICAZIONE]
				,[POSCLIENTE]
				,[NOTE]
				,[ORDINE]
				,[CarTesto1]
				,[CarTesto2]
				,[CarTesto3]
				,[CarTesto4]
				,[CarTesto5]
				,[CarTesto6]
				,[CarTesto7]
				,[CarTesto8]
				,[CarTesto9]
				,[CodiceBarre]
				,[OMOLOGATO]
				,[ANNO]
				,[FLAG_INST]
				,[STATO]
				,[POSQLIK]
				,[QUANTITA]
				,[TEMPO_MAN]
				,[IMPORTOAT1]
				,[IMPORTOAT2]
				,[IMPORTOAT3]
				,[IMPORTOAT4]
				,[IMPORTOAT5]
				,[SCONTOAT1]
				,[SCONTOAT2]
				,[SCONTOAT3]
				,[SCONTOAT4]
				,[SCONTOAT5]
				,[PROV1AT1]
				,[PROV1AT2]
				,[PROV1AT3]
				,[PROV1AT4]
				,[PROV1AT5]
				,[PROV2AT1]
				,[PROV2AT2]
				,[PROV2AT3]
				,[PROV2AT4]
				,[PROV2AT5]
				,[PROV3AT1]
				,[PROV3AT2]
				,[PROV3AT3]
				,[PROV3AT4]
				,[PROV3AT5]
				,[StatoFuoriSede]
				,[StatoAttivita]
				,[DATA_REV]
				,[DATA_PREV]
				,[DATA_COLL]
				,[DATA_PCOLL]
				,[SEGNALATO]
				,[NUOVARIGA]
				,[UTENTEMODIFICA]
				,[DATAMODIFICA]		           
				-- Rif. Ns. SF TV1074052 del 10.01.2011 - Sviluppo Pacchetto 6 - N.13 bis   
				,[UltimaAttivitaEseg]
				-- Rif. Ns. SF TV1272869 del 01.01.2013 - Revisione Impianti e CheckList
				,CodiceMezzoChekList
				,VersioneChekList
				,TitoloChekList
				-- Rif. Ns. SF PD1500231 PUNTO 5.1.4
				,AnnotazioniTecnica  
				-- Rif. Ns. SF PD1600099 PUNTO A
				,idRapportoUltimVista
				,DataUltimaVisita
				,RifLinkImmagine
                ,CodiceEdificio
				,CodiceLivello 
				,CodiceVano
				,PosizioneMappa
				,CodBarCoord
				,TipologiaBarre
				)
			SELECT 							
				[IDCONTRATTO]					
				,[SEZIONECONTRATTO]	
				,@IDRAPPORTO
				,[IdRigaMezzo]					
				,@IDRAPPORTOAGGREGATO
				,[CodMezzo]
				,[DataInserimento]				
				,[DataEliminazione]				
				,[ELIMINATO]					
				,[POSIZIONE]					
				,[SUBPOSIZIONE]					
				,[UBICAZIONE]					
				,[POSCLIENTE]					
				,[NOTE]						
				,[ORDINE]						
				,[CarTesto1]					
				,[CarTesto2]					
				,[CarTesto3]					
				,[CarTesto4]					
				,[CarTesto5]					
				,[CarTesto6]					
				,[CarTesto7]					
				,[CarTesto8]					
				,[CarTesto9]					
				,[CodiceBarre]					
				,[OMOLOGATO]					
				,[ANNO]						
				,[FLAG_INST]					
				,[STATO]						
				,[POSQLIK]					
				,[QUANTITA]					
				,[TEMPO_MAN]					
				,[IMPORTOAT1]					
				,[IMPORTOAT2]					
				,[IMPORTOAT3]					
				,[IMPORTOAT4]					
				,[IMPORTOAT5]					
				,[SCONTOAT1]					
				,[SCONTOAT2]					
				,[SCONTOAT3]					
				,[SCONTOAT4]					
				,[SCONTOAT5]					
				,[PROV1AT1]					
				,[PROV1AT2]					
				,[PROV1AT3]					
				,[PROV1AT4]					
				,[PROV1AT5]					
				,[PROV2AT1]					
				,[PROV2AT2]					
				,[PROV2AT3]					
				,[PROV2AT4]					
				,[PROV2AT5]					
				,[PROV3AT1]					
				,[PROV3AT2]					
				,[PROV3AT3]					
				,[PROV3AT4]					
				,[PROV3AT5]					
				,[StatoFuoriSede]					
				,0		--Stato Attivita
				,[DATA_REV]					
				,[DATA_PREV]					
				,[DATA_COLL]					
				,[DATA_PCOLL]		
				,0		--Segnalato	
				,0		--NuovaRiga
				,user_name()					
				,getdate()
				-- Rif. Ns. SF TV1074052 del 10.01.2011 - Sviluppo Pacchetto 6 - N.13 bis   
				,[UltimaAttivitaEseg]
				-- Rif. Ns. SF TV1272869 del 01.01.2013 - Revisione Impianti e CheckList
				,@CODICEMEZZO
				,@VERCHECKLIST
				,@TITOLOCHECKLIST
				-- Rif. Ns. SF PD1500231 PUNTO 5.1.4
				,[AnnotazioniTecnica]
				-- Rif. Ns. SF PD1600099 PUNTO A
				,idRapportoUltimVista 
				,DataUltimaVisita
				,RifLinkImmagine
                ,CodiceEdificio
				,CodiceLivello 
				,CodiceVano
				,PosizioneMappa
				,CodBarCoord
				,TipologiaBarre
		  FROM [dbo].[GEM_SEZIONICONTRATTODETTMEZZI]	
			WHERE	IDCONTRATTO=@IDCONTRATTO
				AND SEZIONECONTRATTO=@SEZIONECONTRATTO
				AND DataEliminazione IS NULL
		SET @nErrNum=@@ERROR
		IF @nErrNum<>0 GOTO ERRORE
		
		
		-- Rif. Ns. SF TV1272869 del 01.01.2013 - Revisione Impianti e CheckList
		-- AGGIORNAMENTO DATI CHECKLIST
		DECLARE DettMezzi CURSOR LOCAL FAST_FORWARD FOR
			SELECT DISTINCT CodMezzo
			FROM GEM_SEZIONICONTRATTODETTMEZZI
			WHERE	IDCONTRATTO=@IDCONTRATTO
				AND SEZIONECONTRATTO=@SEZIONECONTRATTO
				AND DataEliminazione IS NULL
			ORDER BY CodMezzo

		OPEN DettMezzi
			FETCH DettMezzi INTO @cCodMezzo
			WHILE @@FETCH_STATUS = 0
				BEGIN
					UPDATE RM SET
						RM.CodiceMezzoChekList=TC.CodiceMezzo,
						RM.VersioneChekList=TC.VersioneChekList,
						RM.TitoloChekList=TC.TitoloChekList
					FROM GEM_SEZIONECONTRATTORAPPORTIMEZZI RM
					INNER JOIN GEM_Vista_TesteCheckList TC ON TC.CodiceMezzo=RM.CodMezzo COLLATE Latin1_General_CI_AS AND TC.FlagVerStd=1 
					WHERE RM.CodMezzo = @cCodMezzo
						AND IDRAPPORTO = @IDRAPPORTO 
					SET @nErrNum=@@ERROR
					IF @nErrNum<>0 GOTO ERRORE

					FETCH DettMezzi INTO @cCodMezzo
				END;
		CLOSE DettMezzi
		DEALLOCATE DettMezzi   
		-- ---------------------------------------------------------------------
		SELECT 
			@RIFCOMMCLI=GEM_TESTACONTRATTO.RIFCOMMCLI 
		FROM GEM_TESTACONTRATTO
		INNER JOIN GEM_SEZIONECONTRATTORAPPORTI ON GEM_TESTACONTRATTO.IDCONTRATTO = GEM_SEZIONECONTRATTORAPPORTI.IDCONTRATTO 
		WHERE GEM_SEZIONECONTRATTORAPPORTI.IDRAPPORTO = @IDRAPPORTO		
		
		-- AGGIORNAMENTO DATI RAPPORTO				
		UPDATE G 
		SET STATO = 'X', 
				VersioneChekList = 	@VERCHECKLIST,
				TitoloChekList = 		@TITOLOCHECKLIST,
				Note_Tecnico = 			ISNULL(SC.NOTE_TECNICO,''),
				RIFCLIENTE = 				ISNULL(SC.RifCliente,''),
				-- 18.05.2011 Moreno Feletto - TV1074052 - Sviluppo Pacchetto 6 N.13
				Referente = 				@Referente,
				Tel_Ref = 					@Tel_Ref,
				Email_Responsabile=	@Email_Responsabile,
				-- PC 14 Luglio 2010 richiesta di Francesca 
				-- Note_Interne = ISNULL(SC.NOTE,''),
				DATAMODIFICA = GETDATE(),
				UTENTEMODIFICA = USER_NAME(),
				-- Rif. Ns. SF TV1272869 del 01.01.2013 - Revisione Impianti e CheckList
				FlgOblLetturaNote = @FlgOblLetturaNote,
				-- PD1300332 - Commesse su contr 1.2
				RIFCOMMCLI = ISNULL(@RIFCOMMCLI,''),
				-- Fine
				-- 29.10.2013 Moreno Feletto - TV1301923 - Sviluppo Pacchetto 10			
				G.OreIntPreviste = ISNULL(SC.ORE_INT,0),
				G.FlgOblPiattaforma = ISNULL(SC.FlgOblPiattaforma,0),
				G.FlgPrevistoAllegato = ISNULL(SC.FlgPrevistoAllegato,0)
				-- Fine
				--MM tv1800400 PUNTO 86 87.3
				,G.FLG_AttRipristCompr=SC.FLG_AttRipristCompr,
				G.ValoreSogliaRiprist=SC.ValoreSogliaRiprist,
				G.FLG_AmbientiConf=SC.FLG_AmbientiConf,
				G.FLG_LavoriInQuota=SC.FLG_LavoriInQuota
				--F MM tv1800400 PUNTO 86 87.3
		FROM GEM_SEZIONECONTRATTORAPPORTI G 
			INNER JOIN GEM_SEZIONICONTRATTO SC ON G.IDCONTRATTO=SC.IDCONTRATTO AND G.SEZIONECONTRATTO=SC.SEZIONECONTRATTO
		WHERE IDRAPPORTO = @IDRAPPORTO  
		SET @nErrNum=@@ERROR
		IF @nErrNum<>0 GOTO ERRORE

		-- Rif. Ns. SF TV1272869 del 01.01.2013 - Revisione Impianti e CheckList
		-- INSERIMENTO COMPONENTI
	
		INSERT INTO [dbo].[GEM_SEZIONERAPPORTI_Componenti]
				(
				 [IDCONTRATTO]
				,[SEZIONECONTRATTO]
				,[IDRAPPORTO]
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
				,@IDRAPPORTO
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
			FROM [dbo].[GEM_SEZIONI_Componenti]	
			WHERE	IDCONTRATTO=@IDCONTRATTO
				AND SEZIONECONTRATTO=@SEZIONECONTRATTO
				AND (ISNULL(ELIMINATO, '0') = '0')
		SET @nErrNum=@@ERROR
		IF @nErrNum<>0 GOTO ERRORE	
		


--**********************
		INSERT INTO [dbo].[GEM_SEZIONECONTRATTORAPPORTIMEZZI_Allegati]
           ([IDCONTRATTO]
           ,[SEZIONECONTRATTO]
           ,[IDRapporto]
           ,[IdRigaMezzo]
           ,[IDRIGAAllegato]
           ,[DATAINSERIMENTO]
           ,[REFERENTE]
           ,[OGGETTO]
           ,[ALLEGATO]
           ,[PublicaGOnLine]
           ,[DocValido]
           ,[DATAMODIFICA]
           ,[UTENTEMODIFICA])
		SELECT [IDCONTRATTO]
		   ,[SEZIONECONTRATTO]
		   ,@IDRAPPORTO
		   ,[IdRigaMezzo]
		   ,[IDRIGAAllegato]
		   ,[DATAINSERIMENTO]
		   ,[REFERENTE]
		   ,[OGGETTO]
		   ,[ALLEGATO]
		   ,[PublicaGOnLine]
		   ,[DocValido]
		   ,GETDATE()
		   ,USER_NAME()
		FROM [dbo].[GEM_SEZIONICONTRATTODETTMEZZI_Allegati]				
		WHERE	IDCONTRATTO=@IDCONTRATTO
				AND SEZIONECONTRATTO=@SEZIONECONTRATTO
print @IDCONTRATTO
print @SEZIONECONTRATTO
print @IDRAPPORTO
		print @@ERROR
		SET @nErrNum=@@ERROR
		IF @nErrNum<>0 GOTO ERRORE	

--*****************************************
     delete from GEM_SEZIONECONTRATTORAPPORTIMEZZI_Anomalie where IDCONTRATTO=@IDCONTRATTO AND SEZIONECONTRATTO=@SEZIONECONTRATTO 

     INSERT INTO [dbo].[GEM_SEZIONECONTRATTORAPPORTIMEZZI_Anomalie]
           ([IDCONTRATTO]
           ,[SEZIONECONTRATTO]
           ,[IdRapporto]
           ,[IdRigaMezzo]
           ,[IdRigaAnomalia]
           ,[idAnomalia]
           ,[Semaforo]
           ,[Note]
           ,[idStatoAnomalia]
           ,[DataApertura]
           ,[IdRapportoChiusura]
           ,[DataChiusura]
           ,[Eliminato]
           ,[DataEliminazione]
           ,[UTENTEMODIFICA]
           ,[DATAMODIFICA])
		SELECT [IDCONTRATTO]
		   ,[SEZIONECONTRATTO]
		   ,@IDRAPPORTO
		   ,[IdRigaMezzo]
		   ,[IdRigaAnomalia]
           ,[idAnomalia]
           ,[Semaforo]
           ,[Note]
           ,[idStatoAnomalia]
           ,[DataApertura]
           ,[IdRapportoChiusura]
           ,[DataChiusura]
           ,[Eliminato]
           ,[DataEliminazione]
		   ,USER_NAME()
		   ,GETDATE()
		FROM [dbo].[GEM_SEZIONICONTRATTODETTMEZZI_Anomalie]		 		
		WHERE	IDCONTRATTO=@IDCONTRATTO
				AND SEZIONECONTRATTO=@SEZIONECONTRATTO 
				AND (GEM_SEZIONICONTRATTODETTMEZZI_Anomalie.DataChiusura > getdate()-4380 OR GEM_SEZIONICONTRATTODETTMEZZI_Anomalie.DataChiusura IS NULL) AND (GEM_SEZIONICONTRATTODETTMEZZI_Anomalie.Eliminato = 0 OR GEM_SEZIONICONTRATTODETTMEZZI_Anomalie.Eliminato IS NULL) 
		COMMIT TRANSACTION 
		RETURN 0

ERRORE:
	ROLLBACK TRANSACTION
	RETURN @nErrNum
end

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_RAPPORTI_RILASCIO] TO [Metodo98]
    AS [dbo];

