


-- --------------------------------------------------------------------------------------
-- Funzione  : Ricezione Rapporti Intervento eseguiti da Tablet a Gemma (GEMMAYSYNC)
-- Autore   : Moreno Feletto
-- Data    : 21.04.2016
-- --------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[GRI_INT_TO_MET_RAPPORTI_DocumentiCollegati] (@AZRIF AS VARCHAR(3), @IDRAPPORTO AS VARCHAR(14), @Progressivo AS decimal(10,0))
AS
BEGIN
	DECLARE @DATA_SYNC DATETIME
	SET @DATA_SYNC = GETDATE()	

	-- inserisco in metodo i rapporti dei materiali non presenti
	INSERT INTO GRI_RAPPORTI_DocumentiCollegati
	(
		[IDRAPPORTO]
		,[IDRIGA]
		,[UTENTEMODIFICA] 
		,[DATAMODIFICA] 
	)	
	SELECT
		INS.[IDRAPPORTO] COLLATE Latin1_General_CI_AS
		,INS.[IDRIGA]
		,'Sincronizzazione'
		,@DATA_SYNC
	FROM GemmaSync.dbo.GRI_RAPPORTI_DocumentiCollegati INS
	WHERE --ISNULL(INS.ELIMINATO, '0') = '0' AND 
	INS.IDRAPPORTO = @IDRAPPORTO AND INS.AZRIF = @AZRIF and INS.Progressivo = @Progressivo
	EXCEPT
	SELECT
		MET.[IDRAPPORTO]
		,MET.[IDRIGA]
		,'Sincronizzazione'
		,@DATA_SYNC
	FROM GRI_RAPPORTI_DocumentiCollegati MET
	WHERE MET.IDRAPPORTO = @IDRAPPORTO 
		
	UPDATE MET SET
			MET.[DATAINSERIMENTO] = INS.[DATAINSERIMENTO]
			,MET.[REFERENTE] = INS.[REFERENTE]
			,MET.[OGGETTO] = INS.[OGGETTO]
			,MET.[ALLEGATO] = INS.[ALLEGATO]
			,MET.[PublicaGOnLine] = INS.[PublicaGOnLine]
			,MET.[DocValido] = INS.[DocValido]
			,MET.[UTENTEMODIFICA] = INS.[UTENTEMODIFICA]
			,MET.[DATAMODIFICA] = INS.[DATAMODIFICA]
		FROM GRI_RAPPORTI_DocumentiCollegati MET
		INNER JOIN GemmaSync.dbo.GRI_RAPPORTI_DocumentiCollegati INS ON MET.IDRAPPORTO = INS.IDRAPPORTO COLLATE Latin1_General_CI_AS AND MET.IDRIGA = INS.IDRIGA
		WHERE MET.IDRAPPORTO = @IDRAPPORTO AND INS.AZRIF = @AZRIF AND INS.Progressivo = @Progressivo
	
	--DELETE MET 
	--FROM GRI_RAPPORTI_DocumentiCollegati MET
	--INNER JOIN GemmaSync.dbo.GRI_RAPPORTI_DocumentiCollegati INS ON MET.IDRAPPORTO = INS.IDRAPPORTO COLLATE Latin1_General_CI_AS AND MET.IDRIGA = INS.IDRIGA
	--WHERE --INS.ELIMINATO = '1'
		--AND 
	--	MET.IDRAPPORTO = @IDRAPPORTO 
	--	AND INS.AZRIF = @AZRIF 
	--	AND INS.Progressivo = @Progressivo

END



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GRI_INT_TO_MET_RAPPORTI_DocumentiCollegati] TO [Metodo98]
    AS [dbo];

