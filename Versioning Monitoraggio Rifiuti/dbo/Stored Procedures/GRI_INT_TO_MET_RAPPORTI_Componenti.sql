
-- --------------------------------------------------------------------------------------
-- Funzione  : Ricezione Rapporti Intervento eseguiti da Tablet a Gemma (GEMMAYSYNC)
-- Autore   : Moreno Feletto
-- Data    : 21.04.2016
-- --------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[GRI_INT_TO_MET_RAPPORTI_Componenti] (@AZRIF AS VARCHAR(3), @IDRAPPORTO AS VARCHAR(14), @Progressivo AS decimal(10,0)) AS
BEGIN
	DECLARE @DATA_SYNC		AS DATETIME
	DECLARE @nErrNum			AS INT
	DECLARE @Valore_0_NC	AS SMALLINT
	DECLARE @Valore_1_C		AS SMALLINT
	DECLARE @Valore_2_NE	AS SMALLINT
	DECLARE @Valore_3_NA	AS SMALLINT		
	
	SET @DATA_SYNC = GETDATE()	

	BEGIN TRANSACTION 

		-- -------------------------------------------------------------------------------------- GRI_RAPPORTI_Componenti
		DELETE [GRI_RAPPORTI_Componenti] WHERE [IDRAPPORTO] = @IDRAPPORTO
		
		SET @nErrNum=@@ERROR
		IF @nErrNum<>0 GOTO ERRORE
	
		-- Inserisco in metodo i componenti 
		INSERT INTO GRI_RAPPORTI_Componenti
			(
			[IDRAPPORTO]
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
				INS.[IDRAPPORTO]
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
			FROM GemmaSync.dbo.GRI_RAPPORTI_Componenti INS
			WHERE INS.IDRAPPORTO = @IDRAPPORTO AND INS.AZRIF = @AZRIF AND INS.Progressivo = @Progressivo
		
		SET @nErrNum=@@ERROR
		IF @nErrNum<>0 GOTO ERRORE
	
		-- -------------------------------------------------------------------------------------- GRI_RAPPORTI_MEZZIChecklist
		DELETE GRI_RAPPORTI_MEZZIChecklist WHERE [IDRAPPORTO] = @IDRAPPORTO
		
		SET @nErrNum=@@ERROR
		IF @nErrNum<>0 GOTO ERRORE

		-- Inserisco in metodo i dati di check list 
		INSERT INTO GRI_RAPPORTI_MEZZIChecklist
			(
			[IDRAPPORTO]
			,[IdRigaMezzo]
			,[IdRigaCL]
			,[Valore_0_NC]
			,[Valore_1_C]
			,[Valore_2_NE]
			,[Valore_3_NA]
			,[Ordine]
			,[Esito]
			,[ValoreRilevazione]
			,[AnnotazioneTecnica]
			,[UTENTEMODIFICA]
			,[DATAMODIFICA]
			)
			SELECT
				INS.[IDRAPPORTO]
				,INS.[IdRigaMezzo]
				,INS.[IdRigaCL]
				,(CASE WHEN INS.Esito=0 THEN 1 ELSE 0 END) -- Valore_0_NC
				,(CASE WHEN INS.Esito=1 THEN 1 ELSE 0 END) -- Valore_1_C
				,(CASE WHEN INS.Esito=2 THEN 1 ELSE 0 END) -- Valore_2_NE
				,(CASE WHEN INS.Esito=3 THEN 1 ELSE 0 END) -- Valore_3_NA				
				,INS.[Ordine]
				,(CASE WHEN Esito>0 THEN CAST( INS.[Esito] AS VARCHAR(3) ) ELSE NULL END)      
				,INS.[ValoreRilevazione]
				,INS.[AnnotazioneTecnica]
				,'Sincronizzazione'
				,@DATA_SYNC
			FROM GemmaSync.dbo.GRI_RAPPORTI_MEZZIChecklist INS
			WHERE INS.IDRAPPORTO = @IDRAPPORTO 
				AND INS.AZRIF = @AZRIF 
				AND INS.Progressivo = @Progressivo		
  
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
    ON OBJECT::[dbo].[GRI_INT_TO_MET_RAPPORTI_Componenti] TO [Metodo98]
    AS [dbo];

