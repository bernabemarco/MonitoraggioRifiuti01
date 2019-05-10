
-- --------------------------------------------------------------------------------------
-- Funzione   : SF TV1272869 del 01.01.2013 (Azione 6) - Revisione Impianti e CheckList
-- Autore     : Moreno Feletto
-- Data       : 06.02.2013
-- --------------------------------------------------------------------------------------
-- Funzione   : SF TV1272869 del 01.01.2013 (P.3 - Az.2) - Revisione Impianti e CheckList
-- Autore     : Moreno Feletto
-- Data       : 08.02.2013
-- --------------------------------------------------------------------------------------
-- Funzione   : SF TV1272869 del 01.01.2013 (P.3 - Az.2) - Revisione Impianti e CheckList
--						: Aggiunta gestione Esito
-- Autore     : Moreno Feletto
-- Data       : 12.03.2013
-- --------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[GEM_INT_TO_MET_SEZIONI_Componenti] (@AZRIF as varchar(3),
                                                           @IDRAPPORTO as varchar(14),
						                                   						 @Progressivo as decimal(10,0))  AS
BEGIN
	DECLARE @DATA_SYNC		AS datetime
	DECLARE @nErrNum			AS INT
	DECLARE @Valore_0_NC	AS SMALLINT
	DECLARE @Valore_1_C		AS SMALLINT
	DECLARE @Valore_2_NE	AS SMALLINT
	DECLARE @Valore_3_NA	AS SMALLINT		
	
	SET @DATA_SYNC = GetDate()	

	-- Rif. Ns. SF TV1272869 del 01.01.2013 - Revisione Impianti e CheckList
	BEGIN TRANSACTION 
		/*
		-- update per allineare i campi per far funzionare la EXCEPT
		UPDATE MET 
			SET MET.[SEZIONECONTRATTO] = INS.[SEZIONECONTRATTO]
				,MET.[IdApparato] = INS.[IdApparato]
				,MET.[IdSottoTipoApparato] = INS.[IdSottoTipoApparato]
				,MET.[MARCA] = INS.[MARCA]
				,MET.[MODELLO] = INS.[MODELLO]
				,MET.[QUANTITA] = INS.[QUANTITA]
				,MET.[IMPORTO_UNITARIO] = INS.[IMPORTO_UNITARIO]
				,MET.[ELIMINATO] = INS.[ELIMINATO]
				,MET.[PROVVIGIONE1] = INS.[PROVVIGIONE1]
				,MET.[PROVVIGIONE2] = INS.[PROVVIGIONE2]
				,MET.[PROVVIGIONE3] = INS.[PROVVIGIONE3]
				,MET.[NOTE] = INS.[NOTE]
				,MET.[UTENTEMODIFICA] = INS.[UTENTEMODIFICA]
				,MET.[DATAMODIFICA] = INS.[DATAMODIFICA]
				,MET.[SEGNALATO] = INS.[SEGNALATO]
				--,MET.[STATO] = INS.[STATO]
			FROM GEM_SEZIONI_Componenti MET
			INNER JOIN GemmaSync.dbo.GEM_SEZIONI_Componenti INS ON MET.IDCONTRATTO = INS.IDCONTRATTO COLLATE Latin1_General_CI_AS
																															 and MET.[SEZIONECONTRATTO] = INS.[SEZIONECONTRATTO]
																															 and MET.[IdRigaMezzo] = INS.[IdRigaMezzo]
																															 and MET.[POSIZIONE] = INS.[POSIZIONE]
			WHERE INS.IDRAPPORTO = @IDRAPPORTO AND INS.AZRIF = @AZRIF and INS.Progressivo = @Progressivo

			-- inserisco in metodo i componenti non presenti
		INSERT INTO GEM_SEZIONI_Componenti
			(
					[IDCONTRATTO]
			,[SEZIONECONTRATTO]
			,[IdRigaMezzo]
			,[POSIZIONE]
			,[UTENTEMODIFICA] 
			,[DATAMODIFICA] 
			,[IdApparato]
			,[QUANTITA]
			,[ELIMINATO]
			)
			SELECT
				INS.IDCONTRATTO COLLATE Latin1_General_CI_AS
							,INS.[SEZIONECONTRATTO]
							,INS.[IdRigaMezzo]
							,INS.[POSIZIONE]
				,'Sincronizzazione'
				,@DATA_SYNC
				,INS.[IdApparato]
				,INS.[QUANTITA]
				,INS.[ELIMINATO]
			FROM GemmaSync.dbo.GEM_SEZIONI_Componenti INS
			WHERE INS.IDRAPPORTO = @IDRAPPORTO AND INS.AZRIF = @AZRIF and INS.Progressivo = @Progressivo
			EXCEPT
			SELECT
				MET.IDCONTRATTO COLLATE Latin1_General_CI_AS
							,MET.[SEZIONECONTRATTO]
							,MET.[IdRigaMezzo]
							,MET.[POSIZIONE]
				,'Sincronizzazione'
				,@DATA_SYNC
				,MET.[IdApparato] COLLATE Latin1_General_CI_AS
				,MET.[QUANTITA]
				,MET.[ELIMINATO] COLLATE Latin1_General_CI_AS
			FROM GEM_SEZIONI_Componenti MET
			INNER JOIN GemmaSync.dbo.GEM_SEZIONI_Componenti INS ON MET.IDCONTRATTO = INS.IDCONTRATTO COLLATE Latin1_General_CI_AS
																														 and MET.[SEZIONECONTRATTO] = INS.[SEZIONECONTRATTO]
																														 and MET.[IdRigaMezzo] = INS.[IdRigaMezzo]
																														 and MET.[POSIZIONE] = INS.[POSIZIONE]
			WHERE INS.IDRAPPORTO = @IDRAPPORTO AND INS.AZRIF = @AZRIF and INS.Progressivo = @Progressivo

		-- update finale
		UPDATE MET 
			SET MET.[SEZIONECONTRATTO] = INS.[SEZIONECONTRATTO]
				,MET.[IdApparato] = INS.[IdApparato]
				,MET.[IdSottoTipoApparato] = INS.[IdSottoTipoApparato]
				,MET.[MARCA] = INS.[MARCA]
				,MET.[MODELLO] = INS.[MODELLO]
				,MET.[QUANTITA] = INS.[QUANTITA]
				,MET.[IMPORTO_UNITARIO] = INS.[IMPORTO_UNITARIO]
				,MET.[ELIMINATO] = INS.[ELIMINATO]
				,MET.[PROVVIGIONE1] = INS.[PROVVIGIONE1]
				,MET.[PROVVIGIONE2] = INS.[PROVVIGIONE2]
				,MET.[PROVVIGIONE3] = INS.[PROVVIGIONE3]
				,MET.[NOTE] = INS.[NOTE]
				,MET.[UTENTEMODIFICA] = INS.[UTENTEMODIFICA]
				,MET.[DATAMODIFICA] = INS.[DATAMODIFICA]
				,MET.[SEGNALATO] = INS.[SEGNALATO]
				--,MET.[STATO] = INS.[STATO]
			FROM GEM_SEZIONI_Componenti MET
			INNER JOIN GemmaSync.dbo.GEM_SEZIONI_Componenti INS ON MET.IDCONTRATTO = INS.IDCONTRATTO COLLATE Latin1_General_CI_AS
																															 and MET.[SEZIONECONTRATTO] = INS.[SEZIONECONTRATTO]
																															 and MET.[IdRigaMezzo] = INS.[IdRigaMezzo]
																															 and MET.[POSIZIONE] = INS.[POSIZIONE]
			WHERE INS.IDRAPPORTO = @IDRAPPORTO AND INS.AZRIF = @AZRIF and INS.Progressivo = @Progressivo
		*/

		DELETE [GEM_SEZIONERAPPORTI_Componenti]
		WHERE [IDRAPPORTO] = @IDRAPPORTO
		SET @nErrNum=@@ERROR
		IF @nErrNum<>0 GOTO ERRORE
		
		-- Inserisco in metodo i componenti 
		INSERT INTO GEM_SEZIONERAPPORTI_Componenti
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
				 INS.IDCONTRATTO COLLATE Latin1_General_CI_AS
				,INS.[SEZIONECONTRATTO]
				,INS.[IDRAPPORTO]
				,INS.[IdRigaMezzo]
				,INS.[POSIZIONE]
				,INS.[IdApparato]
				,INS.[IdSottoTipoApparato]
				,INS.[MARCA]
				,INS.[MODELLO]
				,INS.[QUANTITA]
				,INS.[IMPORTO_UNITARIO]
				,INS.[ELIMINATO]			
				,INS.[PROVVIGIONE1]
				,INS.[PROVVIGIONE2]
				,INS.[PROVVIGIONE3]
				,INS.[NOTE]			
				,'Sincronizzazione'
				,@DATA_SYNC
				,INS.[SEGNALATO]
			FROM GemmaSync.dbo.GEM_SEZIONERAPPORTI_Componenti INS
			WHERE INS.IDRAPPORTO = @IDRAPPORTO AND INS.AZRIF = @AZRIF and INS.Progressivo = @Progressivo
		
		SET @nErrNum=@@ERROR
		IF @nErrNum<>0 GOTO ERRORE
	
		DELETE GEM_SEZIONECONTRATTORAPPORTIMEZZI_CheckList
		WHERE [IDRAPPORTO] = @IDRAPPORTO
		SET @nErrNum=@@ERROR
		IF @nErrNum<>0 GOTO ERRORE

		-- Inserisco in metodo i dati di check list 
		INSERT INTO GEM_SEZIONECONTRATTORAPPORTIMEZZI_CheckList
			(
			 [IDCONTRATTO]
			,[SEZIONECONTRATTO]
			,[IDRAPPORTO]
			,[IdRigaMezzo]
			,[IdRigaCL]
			,[Valore_0_NC]
			,[Valore_1_C]
			,[Valore_2_NE]
			,[Valore_3_NA]
			,[Ordine]
			,[Esito]
			,[AnnotazioneTecnica]
			,[UTENTEMODIFICA]
			,[DATAMODIFICA]
			)
			SELECT
				 INS.IDCONTRATTO COLLATE Latin1_General_CI_AS
				,INS.[SEZIONECONTRATTO]
				,INS.[IDRAPPORTO]
				,INS.[IdRigaMezzo]
				,INS.[IdRigaCL]
				,(CASE WHEN Esito=0 THEN 1 ELSE 0 END) -- Valore_0_NC
				,(CASE WHEN Esito=1 THEN 1 ELSE 0 END) -- Valore_1_C
				,(CASE WHEN Esito=2 THEN 1 ELSE 0 END) -- Valore_2_NE
				,(CASE WHEN Esito=3 THEN 1 ELSE 0 END) -- Valore_3_NA				
				,INS.[Ordine]
				,INS.[Esito]
				,INS.[AnnotazioneTecnica]
				,'Sincronizzazione'
				,@DATA_SYNC
			FROM GemmaSync.dbo.GEM_SEZIONECONTRATTORAPPORTIMEZZI_CheckList INS
			WHERE INS.IDRAPPORTO = @IDRAPPORTO AND INS.AZRIF = @AZRIF and INS.Progressivo = @Progressivo
    
		SET @nErrNum=@@ERROR
		IF @nErrNum<>0 GOTO ERRORE
		
		COMMIT TRANSACTION 
		RETURN 0

ERRORE:
	ROLLBACK TRANSACTION 
	RETURN @nErrNum
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_INT_TO_MET_SEZIONI_Componenti] TO [Metodo98]
    AS [dbo];

