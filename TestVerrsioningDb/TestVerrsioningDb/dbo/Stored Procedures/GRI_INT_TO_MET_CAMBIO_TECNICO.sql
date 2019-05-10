
-- --------------------------------------------------------------------------------------
-- Funzione : Ricezione Rapporti Intervento eseguiti da Tablet a Gemma (GEMMAYSYNC)
-- Autore  	: Moreno Feletto
-- Data    	: 21.04.2016
-- --------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[GRI_INT_TO_MET_CAMBIO_TECNICO] (@AZRIF AS VARCHAR(3), @IDRAPPORTO AS VARCHAR(14), @Progressivo AS DECIMAL(10,0)) AS
BEGIN
		-- Aggiorno il campo 
		UPDATE MET SET
				MET.TECNICO_PREV = INS.TECNICO_PREV
				,MET.AZ_TEC_EFF = INS.AZ_TEC_EFF
				,MET.STATO = INS.STATO
		FROM GRI_RAPPORTI MET
		INNER JOIN GemmaSync.dbo.GRI_RAPPORTI INS ON MET.IDRAPPORTO = INS.IDRAPPORTO COLLATE Latin1_General_CI_AS
                                 AND INS.AZRIF = @AZRIF
                                 AND INS.Progressivo = @Progressivo
		WHERE MET.IDRAPPORTO = @IDRAPPORTO 

		UPDATE GemmaSync.dbo.GRI_RAPPORTI	SET
				CAMBIO_TECNICO = NULL
		WHERE IDRAPPORTO = @IDRAPPORTO
			AND AZRIF = @AZRIF
			AND Progressivo = @Progressivo
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GRI_INT_TO_MET_CAMBIO_TECNICO] TO [Metodo98]
    AS [dbo];

