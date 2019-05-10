
-- --------------------------------------------------------------------------------------
-- Funzione  : Ricezione Rapporti Intervento eseguiti da Tablet a Gemma (GEMMAYSYNC)
-- Autore   : Moreno Feletto
-- Data    : 21.04.2016
-- --------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[GRI_INT_TO_MET_RAPPORTI_OreLavoro] (@AZRIF AS VARCHAR(3), @IDRAPPORTO AS VARCHAR(14), @Progressivo AS decimal(10,0)) 
AS
BEGIN
	
		DECLARE @DATA_SYNC AS datetime
		SET @DATA_SYNC = GetDate()
			
		-- inserisco in metodo i rapporti delle ore non presenti
		INSERT INTO GRI_RAPPORTI_OreLavoroAddebito
		(
			[IDRAPPORTO]
			,[IDRIGA]
			,[DATA]
			,[TECNICO]
			,[UTENTEMODIFICA] 
			,[DATAMODIFICA] 
		)
		SELECT
   INS.[IDRAPPORTO] COLLATE Latin1_General_CI_AS
		 ,INS.[IdRiga]
			,INS.[DATA]
			,INS.[TECNICO] COLLATE Latin1_General_CI_AS
		 ,'Sincronizzazione'
		 ,@DATA_SYNC
		FROM GemmaSync.dbo.GRI_RAPPORTI_OreLavoroAddebito INS
		WHERE INS.IDRAPPORTO = @IDRAPPORTO 
     AND INS.AZRIF = @AZRIF 
     AND INS.Progressivo = @Progressivo
					AND ISNULL(INS.Eliminato, '0') <> '1'
		EXCEPT
		SELECT
	   MET.[IDRAPPORTO]
		 ,MET.[IDRIGA]
			,MET.[DATA]
			,MET.[TECNICO]
		 ,'Sincronizzazione'
		 ,@DATA_SYNC
		FROM GRI_RAPPORTI_OreLavoroAddebito MET
		WHERE MET.IDRAPPORTO = @IDRAPPORTO 
	
		UPDATE MET SET
				MET.[TipoAgente] = INS.[TipoAgente]
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
			FROM GRI_RAPPORTI_OreLavoroAddebito MET
			INNER JOIN GemmaSync.dbo.GRI_RAPPORTI_OreLavoroAddebito INS ON MET.IDRAPPORTO = INS.IDRAPPORTO COLLATE Latin1_General_CI_AS AND MET.IDRIGA = INS.IDRIGA
			WHERE MET.IDRAPPORTO = @IDRAPPORTO 
				AND INS.AZRIF = @AZRIF 
				AND INS.Progressivo = @Progressivo
				AND ISNULL(INS.Eliminato, '0') <> '1'
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GRI_INT_TO_MET_RAPPORTI_OreLavoro] TO [Metodo98]
    AS [dbo];

