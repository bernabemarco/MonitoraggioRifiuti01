
CREATE PROCEDURE [dbo].[GEM_INT_TO_MET_GEM_RAPPORTI_DocumentiCollegati] (@AZRIF as varchar(3),
																																				 @IDRAPPORTO as varchar(14),
																																				 @Progressivo as decimal(10,0) ) AS
BEGIN
		SET DATEFORMAT ymd 

		DECLARE @DATA_SYNC as datetime
		SET @DATA_SYNC = GetDate()

		-- inserisco in metodo i rapporti dei materiali non presenti
		INSERT INTO GEM_RAPPORTI_DocumentiCollegati
           ([IDRapporto]
						,[IDCONTRATTO]
						,[SEZIONECONTRATTO]
						,[IDRIGA]
						,[UTENTEMODIFICA]
						,[DATAMODIFICA])
		SELECT INS.[IDRapporto] COLLATE Latin1_General_CI_AS
					,INS.[IDCONTRATTO] COLLATE Latin1_General_CI_AS
					,INS.[SEZIONECONTRATTO] 
					,INS.[IDRIGA] 
					,'Sincronizzazione'
					,@DATA_SYNC
		FROM GemmaSync.dbo.GEM_RAPPORTI_DocumentiCollegati INS   
		WHERE INS.IDRAPPORTO = @IDRAPPORTO AND INS.AZRIF = @AZRIF and INS.Progressivo = @Progressivo
		EXCEPT
		SELECT MET.[IDRapporto]
					,MET.[IDCONTRATTO]
					,MET.[SEZIONECONTRATTO]
					,MET.[IDRIGA]
					,'Sincronizzazione'
					,@DATA_SYNC
		FROM GEM_RAPPORTI_DocumentiCollegati MET  
		WHERE MET.IDRAPPORTO = @IDRAPPORTO 

		UPDATE MET SET
				MET.[IDRIGA] = INS.[IDRIGA],
		  	MET.[DATAINSERIMENTO] = INS.[DATAINSERIMENTO],
		  	MET.[REFERENTE] = INS.[REFERENTE],
				MET.[OGGETTO] = INS.[OGGETTO],
				MET.[ALLEGATO] = INS.[ALLEGATO],
				MET.[PublicaGOnLine] = INS.[PublicaGOnLine],
				MET.[DocValido] = INS.[DocValido],
				MET.[DATAMODIFICA] = INS.[DATAMODIFICA],
				MET.[UTENTEMODIFICA] = INS.[UTENTEMODIFICA]
			FROM GEM_RAPPORTI_DocumentiCollegati MET
			INNER JOIN GemmaSync.dbo.GEM_RAPPORTI_DocumentiCollegati INS ON INS.IDRAPPORTO = MET.IDRAPPORTO COLLATE Latin1_General_CI_AS AND
																																			INS.IDCONTRATTO = MET.IDCONTRATTO COLLATE Latin1_General_CI_AS AND
																																			INS.SEZIONECONTRATTO = MET.SEZIONECONTRATTO AND 
																																			INS.[IDRIGA] = MET.[IDRIGA] 
			WHERE MET.IDRAPPORTO = @IDRAPPORTO AND INS.AZRIF = @AZRIF and INS.Progressivo = @Progressivo
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_INT_TO_MET_GEM_RAPPORTI_DocumentiCollegati] TO [Metodo98]
    AS [dbo];

