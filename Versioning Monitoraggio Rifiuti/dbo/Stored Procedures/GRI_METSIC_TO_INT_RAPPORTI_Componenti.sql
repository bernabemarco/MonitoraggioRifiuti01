	
-- --------------------------------------------------------------------------------------
-- Funzione  : GRI_RAPPORTI_Componenti (Metodo->DbSync)
-- Autore   : Moreno Feletto
-- Data    : 20.04.2016
-- --------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[GRI_METSIC_TO_INT_RAPPORTI_Componenti] (@IDRAPPORTO AS VARCHAR(14),@TIPOOPERAZIONE AS char(1),
																															@Progressivo AS decimal(10,0),@Stato AS VARCHAR(1)) AS
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
					,INS.[IdRigaMezzo] = MET.[IdRigaMezzo]
					,INS.[POSIZIONE] = MET.[POSIZIONE]
					,INS.[IdApparato] = MET.[IdApparato]
					,INS.[IdSottoTipoApparato] = MET.[IdSottoTipoApparato]
					,INS.[MARCA] = MET.[MARCA]
					,INS.[MODELLO] = MET.[MODELLO]
					,INS.[QUANTITA] = MET.[QUANTITA]
					,INS.[IMPORTO_UNITARIO] = MET.[IMPORTO_UNITARIO]
					,INS.[ELIMINATO] = MET.[ELIMINATO]
					,INS.[PROVVIGIONE1] = MET.[PROVVIGIONE1]
					,INS.[PROVVIGIONE2] = MET.[PROVVIGIONE2]
					,INS.[PROVVIGIONE3] = MET.[PROVVIGIONE3]
					,INS.[NOTE] = MET.[NOTE]
					,INS.[UTENTEMODIFICA] = MET.[UTENTEMODIFICA]
					,INS.[DATAMODIFICA] = MET.[DATAMODIFICA]
					,INS.[SEGNALATO] = MET.[SEGNALATO]
			FROM GemmaSync.dbo.GRI_RAPPORTI_Componenti INS
			INNER JOIN GRI_RAPPORTI_Componenti MET ON INS.IDRAPPORTO = MET.IDRAPPORTO COLLATE Latin1_General_CI_AS AND INS.IDRIGAMEZZO = MET.IDRIGAMEZZO
																																																						 AND INS.POSIZIONE = MET.POSIZIONE
																																																						 AND INS.AZRIF = @IdAzienda COLLATE Latin1_General_CI_AS 
			WHERE INS.IDRAPPORTO = @IDRAPPORTO 
				AND INS.Progressivo = @Progressivo
	
		END
	ELSE
		BEGIN
			INSERT INTO GemmaSync.dbo.GRI_RAPPORTI_Componenti
			(
				[IDRAPPORTO]
				,[AZRIF]
				,[Progressivo]
				,[IdRigaMezzo]
				,[POSIZIONE]
				,[IdApparato]
				,[IdSottoTipoApparato]
				,[MARCA]
				,[MODELLO]
				,[QUANTITA]
				,[IMPORTO_UNITARIO]
				,[ELIMINATO] 
				,[PROVVIGIONE1]
				,[PROVVIGIONE2] 
				,[PROVVIGIONE3] 
				,[NOTE] 
				,[UTENTEMODIFICA] 
				,[DATAMODIFICA] 
				,[SEGNALATO] 				
			)
			SELECT			
				MET.[IDRAPPORTO]
				,@IdAzienda		-- [AZRIF]
				,@Progressivo	-- [Progressivo]
				,MET.[IdRigaMezzo]
				,MET.[POSIZIONE]
				,MET.[IdApparato]
				,MET.[IdSottoTipoApparato]
				,MET.[MARCA]
				,MET.[MODELLO]
				,MET.[QUANTITA]
				,MET.[IMPORTO_UNITARIO]
				,MET.[ELIMINATO] 
				,MET.[PROVVIGIONE1]
				,MET.[PROVVIGIONE2] 
				,MET.[PROVVIGIONE3] 
				,MET.[NOTE] 
				,MET.[UTENTEMODIFICA] 
				,MET.[DATAMODIFICA] 
				,MET.[SEGNALATO]
			FROM GRI_RAPPORTI_Componenti MET
			WHERE MET.IDRAPPORTO = @IDRAPPORTO 
			
		END	
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GRI_METSIC_TO_INT_RAPPORTI_Componenti] TO [Metodo98]
    AS [dbo];

