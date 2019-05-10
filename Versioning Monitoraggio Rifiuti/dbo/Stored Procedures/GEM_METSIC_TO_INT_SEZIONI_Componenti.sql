


-- --------------------------------------------------------------------------------------
-- Funzione   : SF TV1272869 del 01.01.2013 (Azione 5) - Revisione Impianti e CheckList
-- Autore     : Moreno Feletto
-- Data       : 06.02.2013
-- --------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[GEM_METSIC_TO_INT_SEZIONI_Componenti] (@IDRAPPORTO as varchar(14),@TIPOOPERAZIONE as char(1),
																															@Progressivo as decimal(10,0),@Stato as varchar(1)) AS
BEGIN
	
	declare @IdAzienda varchar(3)

	select @IdAzienda = IdSocieta
	from GEM_TabParametriAziendaGemma
			
	-- UPDATE PER AZIENDA METODO SICURA
	IF @Stato = 'T'
		BEGIN
			UPDATE INS 
				SET INS.[SEZIONECONTRATTO] = MET.[SEZIONECONTRATTO]
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
					,INS.[AZRIF] = @IdAzienda
					--,INS.[STATO] = MET.[STATO]
				FROM GemmaSync.dbo.GEM_SEZIONERAPPORTI_Componenti INS
				INNER JOIN GEM_SEZIONERAPPORTI_Componenti MET ON
				INS.IDCONTRATTO = MET.IDCONTRATTO COLLATE Latin1_General_CI_AS
				AND INS.SEZIONECONTRATTO = MET.SEZIONECONTRATTO
				AND INS.IDRIGAMEZZO = MET.IDRIGAMEZZO
				AND INS.POSIZIONE = MET.POSIZIONE
				AND INS.AZRIF = @IdAzienda
				WHERE INS.IDRAPPORTO = @IDRAPPORTO 
					AND INS.Progressivo = @Progressivo	
		END
	ELSE
		BEGIN
			INSERT INTO GemmaSync.dbo.GEM_SEZIONERAPPORTI_Componenti
				(
				[PROGRESSIVO]
				,IDCONTRATTO
				,IDRAPPORTO
				,[SEZIONECONTRATTO]
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
				,[AZRIF]
				)
			SELECT
			@Progressivo
			,MET.IDCONTRATTO
			,MET1.IDRAPPORTO -- lo prendo dal join con GEM_SEZIONECONTRATTORAPPORTI
			,MET.[SEZIONECONTRATTO]
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
			,@IdAzienda
			FROM GEM_SEZIONERAPPORTI_Componenti MET
			INNER JOIN GEM_SEZIONECONTRATTORAPPORTI MET1 ON MET.IDCONTRATTO = MET1.IDCONTRATTO AND MET.SEZIONECONTRATTO = MET1.SEZIONECONTRATTO AND MET.IDRAPPORTO = MET1.IDRAPPORTO
					left JOIN GemmaSync.dbo.GEM_SEZIONERAPPORTI_Componenti INS ON INS.IDCONTRATTO = MET.IDCONTRATTO COLLATE Latin1_General_CI_AS
																																																				AND INS.SEZIONECONTRATTO = MET.SEZIONECONTRATTO
																																																				AND INS.IDRIGAMEZZO = MET.IDRIGAMEZZO
																																																				AND INS.POSIZIONE = MET.POSIZIONE
																																																				AND INS.AZRIF = @IdAzienda
																																																				AND INS.IDRAPPORTO = @IDRAPPORTO 
																																																				AND INS.Progressivo = @Progressivo
			WHERE MET1.IDRAPPORTO = @IDRAPPORTO
						and INS.IDContratto is null
			/*
			FROM GEM_SEZIONERAPPORTI_Componenti MET
			INNER JOIN GEM_SEZIONECONTRATTORAPPORTI MET1
			ON MET.IDCONTRATTO = MET1.IDCONTRATTO
			AND MET.SEZIONECONTRATTO = MET1.SEZIONECONTRATTO
			WHERE MET1.IDRAPPORTO = @IDRAPPORTO
			*/
		END	
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_METSIC_TO_INT_SEZIONI_Componenti] TO [Metodo98]
    AS [dbo];

