
CREATE PROCEDURE [dbo].[GRI_METSIC_TO_INT_RAPPORTIMEZZI_Anomalie] (@IDRAPPORTO AS VARCHAR(14),@TIPOOPERAZIONE AS char(1),@Progressivo AS decimal(10,0),@Stato AS VARCHAR(1)) AS
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
				,INS.[IDCONTRATTO] = MET.[IDCONTRATTO]				
				,INS.[SEZIONECONTRATTO] = MET.[SEZIONECONTRATTO]
				,INS.[idAnomalia] = MET.[idAnomalia]
				,INS.[Semaforo] = MET.[Semaforo]
				,INS.[Note] = MET.[Note]
				,INS.[idStatoAnomalia] = MET.[idStatoAnomalia]				
				,INS.[DataApertura] = MET.[DataApertura]
				,INS.[IdRapportoChiusura] = MET.[IdRapportoChiusura]
				,INS.[DataChiusura] = MET.[DataChiusura]
				,INS.[Eliminato] = MET.[Eliminato]
				,INS.[DataEliminazione] = MET.[DataEliminazione]
				,INS.[UTENTEMODIFICA] = MET.[UTENTEMODIFICA]
				,INS.[DATAMODIFICA] = MET.[DATAMODIFICA]				
				FROM GemmaSync.dbo.GRI_RAPPORTIMEZZI_Anomalie INS
				INNER JOIN GRI_RAPPORTIMEZZI_Anomalie MET ON 	INS.IDRAPPORTO = MET.IDRAPPORTO COLLATE Latin1_General_CI_AS	AND
																											INS.IdRigaMezzo = MET.IdRigaMezzo AND
																											INS.IdRigaAnomalia = MET.IdRigaAnomalia AND
																											INS.AZRIF = @IdAzienda
				WHERE INS.IDRAPPORTO = @IDRAPPORTO 
					AND INS.Progressivo = @Progressivo				
		END
	ELSE
		BEGIN
			INSERT INTO GemmaSync.dbo.GRI_RAPPORTIMEZZI_Anomalie
			(
				[IDRAPPORTO]
				,[AZRIF]
				,[Progressivo]
				,[IdRigaMezzo]
				,[IdRigaAnomalia]				
				,[IDCONTRATTO]
				,[SEZIONECONTRATTO]
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
				,[DATAMODIFICA]
			)
			SELECT
				MET.[IDRAPPORTO]
				,@IdAzienda			-- MET.[AZRIF]
				,@Progressivo		-- MET.[Progressivo]
				,MET.[IdRigaMezzo]
				,MET.[IdRigaAnomalia]				
				,MET.[IDCONTRATTO]
				,MET.[SEZIONECONTRATTO]
				,MET.[idAnomalia]
				,MET.[Semaforo]
				,MET.[Note]
				,MET.[idStatoAnomalia]		
				,MET.[DataApertura]
				,MET.[IdRapportoChiusura]
				,MET.[DataChiusura]
				,MET.[Eliminato]
				,MET.[DataEliminazione]
				,MET.[UTENTEMODIFICA]
				,MET.[DATAMODIFICA]
			FROM GRI_RAPPORTIMEZZI_Anomalie MET
			WHERE MET.IDRAPPORTO = @IDRAPPORTO 			
	END	
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GRI_METSIC_TO_INT_RAPPORTIMEZZI_Anomalie] TO [Metodo98]
    AS [dbo];

