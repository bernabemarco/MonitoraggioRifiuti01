	
-- --------------------------------------------------------------------------------------
-- Funzione	: GRI_RAPPORTI_MEZZIChecklist (Metodo->DbSync)
-- Autore  	: Moreno Feletto
-- Data    	: 20.04.2016
-- --------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[GRI_METSIC_TO_INT_RAPPORTI_MezziCheckList] (@IDRAPPORTO AS VARCHAR(14),@TIPOOPERAZIONE AS char(1),@Progressivo AS decimal(10,0),@Stato AS VARCHAR(1)) AS
BEGIN
	
	DECLARE @IdAzienda VARCHAR(3)
	SELECT @IdAzienda = IdSocieta
	FROM GRI_RAPPORTI RI 
	INNER JOIN GRI_TIPOLOGIARAPPORTO TR ON TR.IdTipoRapporto=RI.IdTipoRapporto
	WHERE RI.IDRAPPORTO = @IDRAPPORTO

	-- UPDATE PER AZIENDA METODO SICURA
	IF @Stato = 'T'
		BEGIN
				
			UPDATE INS SET
				INS.[AZRIF] = @IdAzienda
				,INS.[Valore_0_NC] = MET.[Valore_0_NC]				
				,INS.[Valore_1_C] = MET.[Valore_1_C]
				,INS.[Valore_2_NE] = MET.[Valore_2_NE]
				,INS.[Valore_3_NA] = MET.[Valore_3_NA]
				,INS.[Ordine] = MET.[Ordine]
				,INS.[Esito] = MET.[Esito]
				,INS.[ValoreRilevazione] = MET.[ValoreRilevazione]
				,INS.[AnnotazioneTecnica] = MET.[AnnotazioneTecnica]
				,INS.[UTENTEMODIFICA] = MET.[UTENTEMODIFICA]
				,INS.[DATAMODIFICA] = MET.[DATAMODIFICA]							
				FROM GemmaSync.dbo.GRI_RAPPORTI_MEZZIChecklist INS
				INNER JOIN GRI_RAPPORTI_MEZZIChecklist MET ON INS.IDRAPPORTO = MET.IDRAPPORTO COLLATE Latin1_General_CI_AS	AND INS.IdRigaMezzo = MET.IdRigaMezzo 
																																																										AND INS.IdRigaCL = MET.IdRigaCL
																																																										AND INS.AZRIF = @IdAzienda
				WHERE INS.IDRAPPORTO = @IDRAPPORTO 
					AND INS.Progressivo = @Progressivo
				
		END
	ELSE
		BEGIN
			INSERT INTO GemmaSync.dbo.GRI_RAPPORTI_MEZZIChecklist
			(
				[IDRAPPORTO]
				,[AZRIF]
				,[Progressivo]
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
				MET.[IDRAPPORTO]
				,@IdAzienda			-- MET.[AZRIF]
				,@Progressivo		-- MET.[Progressivo]
				,MET.[IdRigaMezzo]
				,MET.[IdRigaCL]
				,MET.[Valore_0_NC]
				,MET.[Valore_1_C]
				,MET.[Valore_2_NE]
				,MET.[Valore_3_NA]
				,MET.[Ordine]
				,MET.[Esito]
				,MET.[ValoreRilevazione]	
				,MET.[AnnotazioneTecnica]	
				,MET.[UTENTEMODIFICA]
				,MET.[DATAMODIFICA]
			FROM GRI_RAPPORTI_MEZZIChecklist MET
			WHERE MET.IDRAPPORTO = @IDRAPPORTO 
			
	END	
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GRI_METSIC_TO_INT_RAPPORTI_MezziCheckList] TO [Metodo98]
    AS [dbo];

