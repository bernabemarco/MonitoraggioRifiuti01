
CREATE PROCEDURE [dbo].[GRI_INT_TO_MET_RAPPORTIMEZZI_Anomalie] (@AZRIF AS VARCHAR(3), @IDRAPPORTO AS VARCHAR(14), @Progressivo AS decimal(10,0)) AS
BEGIN
	DECLARE @DATA_SYNC DATETIME
	SET @DATA_SYNC = GETDATE()	

	-- inserisco in metodo i rapporti dei materiali non presenti
	INSERT INTO GRI_RAPPORTIMEZZI_Anomalie
	(
		[IDRAPPORTO]
		,[IdRigaMezzo]
		,[IdRigaAnomalia]
		,[UTENTEMODIFICA] 
		,[DATAMODIFICA] 
	)	
	SELECT
		INS.[IDRAPPORTO] COLLATE Latin1_General_CI_AS
		,INS.[IdRigaMezzo]
		,INS.[IdRigaAnomalia]
		,'Sincronizzazione'
		,@DATA_SYNC
	FROM GemmaSync.dbo.GRI_RAPPORTIMEZZI_Anomalie INS
	WHERE ISNULL(INS.ELIMINATO, '0') = '0' AND INS.IDRAPPORTO = @IDRAPPORTO AND INS.AZRIF = @AZRIF and INS.Progressivo = @Progressivo
	EXCEPT
	SELECT
		MET.[IDRAPPORTO]
		,MET.[IdRigaMezzo]
		,MET.[IdRigaAnomalia]
		,'Sincronizzazione'
		,@DATA_SYNC
	FROM GRI_RAPPORTIMEZZI_Anomalie MET
	WHERE MET.IDRAPPORTO = @IDRAPPORTO 
		
	UPDATE MET SET
			MET.[IDCONTRATTO] = INS.[IDCONTRATTO]
			,MET.[SEZIONECONTRATTO] = INS.[SEZIONECONTRATTO]
			,MET.[idAnomalia] = INS.[idAnomalia]
			,MET.[Semaforo] = INS.[Semaforo]
			,MET.[Note] = INS.[Note]
			,MET.[idStatoAnomalia] = INS.[idStatoAnomalia]			
			,MET.[DataApertura] = INS.[DataApertura]
			,MET.[IdRapportoChiusura] = INS.[IdRapportoChiusura]
			,MET.[DataChiusura] = INS.[DataChiusura]
			,MET.[Eliminato] = INS.[Eliminato]
			,MET.[DataEliminazione] = INS.[DataEliminazione]		
			,MET.[UTENTEMODIFICA] = INS.[UTENTEMODIFICA]
			,MET.[DATAMODIFICA] = INS.[DATAMODIFICA]
		FROM GRI_RAPPORTIMEZZI_Anomalie MET
		INNER JOIN GemmaSync.dbo.GRI_RAPPORTIMEZZI_Anomalie INS ON 	MET.IDRAPPORTO = INS.IDRAPPORTO COLLATE Latin1_General_CI_AS AND 
																																MET.IdRigaMezzo = INS.IdRigaMezzo AND
																																MET.IdRigaAnomalia = INS.IdRigaAnomalia
		WHERE MET.IDRAPPORTO = @IDRAPPORTO AND INS.AZRIF = @AZRIF AND INS.Progressivo = @Progressivo
	
	DELETE MET 
	FROM GRI_RAPPORTIMEZZI_Anomalie MET
	INNER JOIN GemmaSync.dbo.GRI_RAPPORTIMEZZI_Anomalie INS ON 	MET.IDRAPPORTO = INS.IDRAPPORTO COLLATE Latin1_General_CI_AS AND
																															MET.IdRigaMezzo = INS.IdRigaMezzo AND
																															MET.IdRigaAnomalia = INS.IdRigaAnomalia
	WHERE INS.ELIMINATO = '1'
		AND MET.IDRAPPORTO = @IDRAPPORTO 
		AND INS.AZRIF = @AZRIF 
		AND INS.Progressivo = @Progressivo
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GRI_INT_TO_MET_RAPPORTIMEZZI_Anomalie] TO [Metodo98]
    AS [dbo];

