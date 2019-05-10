	
-- --------------------------------------------------------------------------------------
-- Funzione  : GRI_RAPPORTI_DocumentiCollegati (Metodo->DbSync)
-- Autore   : Moreno Feletto
-- Data    : 20.04.2016
-- --------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[GRI_METSIC_TO_INT_RAPPORTI_DocumentiCollegati] (@IDRAPPORTO AS VARCHAR(14),@TIPOOPERAZIONE AS char(1),@Progressivo AS decimal(10,0),@Stato AS VARCHAR(1)) AS
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
				,INS.[DATAINSERIMENTO] = MET.[DATAINSERIMENTO]				
				,INS.[REFERENTE] = MET.[REFERENTE]
				,INS.[OGGETTO] = MET.[OGGETTO]
				,INS.[ALLEGATO] = MET.[ALLEGATO]
				,INS.[PublicaGOnLine] = MET.[PublicaGOnLine]
				,INS.[DocValido] = MET.[DocValido]
				,INS.[UTENTEMODIFICA] = MET.[UTENTEMODIFICA]
				,INS.[DATAMODIFICA] = MET.[DATAMODIFICA]				
				FROM GemmaSync.dbo.GRI_RAPPORTI_DocumentiCollegati INS
				INNER JOIN GRI_RAPPORTI_DocumentiCollegati MET ON INS.IDRAPPORTO = MET.IDRAPPORTO COLLATE Latin1_General_CI_AS AND INS.IDRIGA = MET.IDRIGA AND INS.AZRIF = @IdAzienda
				WHERE INS.IDRAPPORTO = @IDRAPPORTO 
					AND INS.Progressivo = @Progressivo
				
		END
	ELSE
		BEGIN
			INSERT INTO GemmaSync.dbo.GRI_RAPPORTI_DocumentiCollegati
			(
				[IDRAPPORTO]
				,[AZRIF]
				,[Progressivo]
				,[IDRIGA]
				,[DATAINSERIMENTO]
				,[REFERENTE]
				,[OGGETTO]
				,[ALLEGATO]
				,[PublicaGOnLine]
				,[DocValido]	
				,[UTENTEMODIFICA]
				,[DATAMODIFICA]
			)
			SELECT
				MET.[IDRAPPORTO]
				,@IdAzienda			-- MET.[AZRIF]
				,@Progressivo		-- MET.[Progressivo]
				,MET.[IDRIGA]
				,MET.[DATAINSERIMENTO]
				,MET.[REFERENTE]
				,MET.[OGGETTO]
				,MET.[ALLEGATO]
				,MET.[PublicaGOnLine]
				,MET.[DocValido]	
				,MET.[UTENTEMODIFICA]
				,MET.[DATAMODIFICA]
			FROM GRI_RAPPORTI_DocumentiCollegati MET
			WHERE MET.IDRAPPORTO = @IDRAPPORTO 
			
	END	
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GRI_METSIC_TO_INT_RAPPORTI_DocumentiCollegati] TO [Metodo98]
    AS [dbo];

