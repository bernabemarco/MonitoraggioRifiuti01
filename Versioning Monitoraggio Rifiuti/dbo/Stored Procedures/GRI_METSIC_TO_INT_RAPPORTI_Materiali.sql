
-- --------------------------------------------------------------------------------------
-- Funzione  : GRI_RAPPORTI_Materiali (Metodo->DbSync)
-- Autore   : Moreno Feletto
-- Data    : 20.04.2016
-- --------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[GRI_METSIC_TO_INT_RAPPORTI_Materiali] (@IDRAPPORTO AS VARCHAR(14),@TIPOOPERAZIONE AS char(1),@Progressivo AS decimal(10,0),@Stato AS VARCHAR(1)) AS
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
					INS.AZRIF = @IdAzienda
					,INS.[IDMATERIALE] = MET.[IDMATERIALE]
					,INS.[PREZZO] = MET.[PREZZO]
					,INS.[SCONTO] = MET.[SCONTO]
					,INS.[QTA] = MET.[QTA]
					,INS.[PROVVIGIONE1] = MET.[PROVVIGIONE1]
					,INS.[PROVVIGIONE2] = MET.[PROVVIGIONE2]
					,INS.[PROVVIGIONE3] = MET.[PROVVIGIONE3]
					,INS.[flg_mat_dafatt] = MET.[flg_mat_dafatt]
					,INS.[NoMovimentaMagazzino] = MET.[NoMovimentaMagazzino]					
					,INS.[CODDEPOSITO] = MET.[CODDEPOSITO]
					,INS.[CODUBICAZIONE] = MET.[CODUBICAZIONE]
					,INS.[UTENTEMODIFICA] = MET.[UTENTEMODIFICA]
					,INS.[DATAMODIFICA] = MET.[DATAMODIFICA]					
				FROM GemmaSync.dbo.GRI_RAPPORTI_Materiali INS
				INNER JOIN GRI_RAPPORTI_Materiali MET ON INS.IDRAPPORTO = MET.IDRAPPORTO COLLATE Latin1_General_CI_AS AND INS.IDRIGA = MET.IDRIGA AND INS.AZRIF = @IdAzienda
				WHERE INS.IDRAPPORTO = @IDRAPPORTO 
					AND INS.Progressivo = @Progressivo
					
		END
	ELSE
		BEGIN
		
			INSERT INTO GemmaSync.dbo.GRI_RAPPORTI_Materiali
			(
				[IDRAPPORTO]
				,[AZRIF]
				,[Progressivo]
				,[IDRIGA]
				,[IDMATERIALE]
				,[PREZZO]
				,[SCONTO]
				,[QTA]
				,[PROVVIGIONE1]
				,[PROVVIGIONE2]
				,[PROVVIGIONE3]
				,[flg_mat_dafatt]
				,[NoMovimentaMagazzino]
				,[CODDEPOSITO]
				,[CODUBICAZIONE]
				,[UTENTEMODIFICA]
				,[DATAMODIFICA]
			)	
			SELECT
				MET.[IDRAPPORTO]
				,@IdAzienda					-- MET.[AZRIF]
				,@Progressivo				-- MET.[Progressivo]
				,MET.[IDRIGA]
				,MET.[IDMATERIALE]
				,MET.[PREZZO]
				,MET.[SCONTO]
				,MET.[QTA]
				,MET.[PROVVIGIONE1]
				,MET.[PROVVIGIONE2]
				,MET.[PROVVIGIONE3]
				,MET.[flg_mat_dafatt]
				,MET.[NoMovimentaMagazzino]
				,MET.[CODDEPOSITO]
				,MET.[CODUBICAZIONE]
				,MET.[UTENTEMODIFICA]
				,MET.[DATAMODIFICA]
			FROM GRI_RAPPORTI_Materiali MET
			WHERE MET.IDRAPPORTO = @IDRAPPORTO
		
		END
		
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GRI_METSIC_TO_INT_RAPPORTI_Materiali] TO [Metodo98]
    AS [dbo];

