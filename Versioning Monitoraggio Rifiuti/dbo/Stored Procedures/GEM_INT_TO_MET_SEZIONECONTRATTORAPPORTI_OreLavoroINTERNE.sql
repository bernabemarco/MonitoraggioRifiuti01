﻿
CREATE PROCEDURE [dbo].[GEM_INT_TO_MET_SEZIONECONTRATTORAPPORTI_OreLavoroINTERNE] (@AZRIF as varchar(3),@IDRAPPORTO as varchar(14), @Progressivo as decimal(10,0)) 

AS
BEGIN
	
		DECLARE @DATA_SYNC as datetime
		SET @DATA_SYNC = GetDate()
		-- inserisco in metodo i rapporti dei materiali non presenti
		INSERT INTO GEM_SEZIONECONTRATTORAPPORTI_OreLavoroINTERNE
		(
		[IDRAPPORTO]
		,[IDRIGA]
		,[IDCONTRATTO]
		,[SEZIONECONTRATTO]
		,[TIPOLOGIARAPPORTO]
		,[DATA]
		,[TECNICO]
		,[UTENTEMODIFICA] 
		,[DATAMODIFICA] 
		)
		SELECT
	      INS.[IDRAPPORTO] COLLATE Latin1_General_CI_AS
		  ,INS.[IdRiga]
		  ,INS.[IDCONTRATTO] COLLATE Latin1_General_CI_AS
		,INS.[SEZIONECONTRATTO]
		,INS.[TIPOLOGIARAPPORTO] COLLATE Latin1_General_CI_AS
		,INS.[DATA]
		,INS.[TECNICO] COLLATE Latin1_General_CI_AS
		  ,'Sincronizzazione'
		  ,@DATA_SYNC
		FROM
		GemmaSync.dbo.GEM_SEZIONECONTRATTORAPPORTI_OreLavoroINTERNE INS
		WHERE INS.IDRAPPORTO = @IDRAPPORTO 
          AND INS.AZRIF = @AZRIF 
          and INS.Progressivo = @Progressivo
		  and isnull(INS.Eliminato, '0') <> '1'
		EXCEPT
		SELECT
	      MET.[IDRAPPORTO]
		  ,MET.[IDRIGA]
		,MET.[IDCONTRATTO]
		,MET.[SEZIONECONTRATTO]
		,MET.[TIPOLOGIARAPPORTO]
		,MET.[DATA]
		,MET.[TECNICO]	
		  ,'Sincronizzazione'
		  ,@DATA_SYNC
		FROM
		GEM_SEZIONECONTRATTORAPPORTI_OreLavoroINTERNE MET
		WHERE MET.IDRAPPORTO = @IDRAPPORTO 

		UPDATE MET 
			SET MET.[IDCONTRATTO] = INS.[IDCONTRATTO]
		  ,MET.[SEZIONECONTRATTO] = INS.[SEZIONECONTRATTO]
		  ,MET.[TIPOLOGIARAPPORTO] = INS.[TIPOLOGIARAPPORTO]
		  ,MET.[DATA] = INS.[DATA]
		  ,MET.[TECNICO] = INS.[TECNICO]
		  ,MET.[OREORD] = INS.[OREORD]
		  ,MET.[ORESTRA] = INS.[ORESTRA]
		  ,MET.[OREVIAGGIO] = INS.[OREVIAGGIO]
		  ,MET.[TRASFERTA] = INS.[TRASFERTA]
		  ,MET.[KM] = INS.[KM]
		  ,MET.[PERNOTTO] = INS.[PERNOTTO]
		  ,MET.[UTENTEMODIFICA] = INS.[UTENTEMODIFICA]
		  ,MET.[DATAMODIFICA] = INS.[DATAMODIFICA]
		FROM GEM_SEZIONECONTRATTORAPPORTI_OreLavoroINTERNE MET
		INNER JOIN GemmaSync.dbo.GEM_SEZIONECONTRATTORAPPORTI_OreLavoroINTERNE INS ON
			MET.IDRAPPORTO = INS.IDRAPPORTO COLLATE Latin1_General_CI_AS 
			AND MET.IDRIGA = INS.IDRIGA
		WHERE MET.IDRAPPORTO = @IDRAPPORTO 
	      AND INS.AZRIF = @AZRIF 
		  and INS.Progressivo = @Progressivo
		  and isnull(INS.Eliminato, '0') <> '1'
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_INT_TO_MET_SEZIONECONTRATTORAPPORTI_OreLavoroINTERNE] TO [Metodo98]
    AS [dbo];

