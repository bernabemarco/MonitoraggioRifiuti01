
-- --------------------------------------------------------------------------------------
-- Funzione  : GRI_RAPPORTI_OreLavoroAddebito (Metodo->DbSync)
-- Autore   : Moreno Feletto
-- Data    : 20.04.2016
-- --------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[GRI_METSIC_TO_INT_RAPPORTI_OreLavoro] (@IDRAPPORTO AS VARCHAR(14),@TIPOOPERAZIONE AS char(1),@Progressivo AS decimal(10,0),@Stato AS VARCHAR(1)) AS
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
				,INS.[idRiga] = MET.[idRiga]
				,INS.[TipoAgente] = MET.[TipoAgente]
				,INS.[DATA] = MET.[DATA]
				,INS.[TECNICO] = MET.[TECNICO]
				,INS.[OREORD] = MET.[OREORD]
				,INS.[ORESTRA] = MET.[ORESTRA]
				,INS.[OREVIAGGIO] = MET.[OREVIAGGIO]
				,INS.[TRASFERTA] = MET.[TRASFERTA]
				,INS.[KM] = MET.[KM]
				,INS.[UTENTEMODIFICA] = MET.[UTENTEMODIFICA]
				,INS.[DATAMODIFICA] = MET.[DATAMODIFICA]
				,INS.[PERNOTTO] = MET.[PERNOTTO]
			FROM GemmaSync.dbo.GRI_RAPPORTI_OreLavoroAddebito INS
			INNER JOIN GRI_RAPPORTI_OreLavoroAddebito MET ON INS.IDRAPPORTO = MET.IDRAPPORTO COLLATE Latin1_General_CI_AS AND INS.IDRIGA = MET.IDRIGA AND INS.AZRIF = @IdAzienda
			WHERE INS.IDRAPPORTO = @IDRAPPORTO 
				AND INS.Progressivo = @Progressivo
			
		END
	ELSE
		BEGIN
			INSERT INTO GemmaSync.dbo.GRI_RAPPORTI_OreLavoroAddebito
			(
				[IDRAPPORTO]
				,[AZRIF]
				,[Progressivo]
				,[idRiga]
				,[TipoAgente]
				,[DATA]
				,[TECNICO]
				,[OREORD]
				,[ORESTRA]
				,[OREVIAGGIO]
				,[TRASFERTA]
				,[KM]
				,[UTENTEMODIFICA]
				,[DATAMODIFICA]
				,[PERNOTTO]
			)
			SELECT 
				[IDRAPPORTO]
				,@IdAzienda			-- [AZRIF]
				,@Progressivo		-- [Progressivo]
				,[idRiga]
				,[TipoAgente]
				,[DATA]
				,[TECNICO]
				,[OREORD]
				,[ORESTRA]
				,[OREVIAGGIO]
				,[TRASFERTA]
				,[KM]
				,[UTENTEMODIFICA]
				,[DATAMODIFICA]
				,[PERNOTTO]			
			FROM GRI_RAPPORTI_OreLavoroAddebito MET
			WHERE MET.IDRAPPORTO = @IDRAPPORTO 
		END
		
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GRI_METSIC_TO_INT_RAPPORTI_OreLavoro] TO [Metodo98]
    AS [dbo];

