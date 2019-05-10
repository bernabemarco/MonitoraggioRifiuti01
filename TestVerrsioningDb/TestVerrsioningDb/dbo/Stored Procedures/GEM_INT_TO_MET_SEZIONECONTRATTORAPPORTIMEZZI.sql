
CREATE PROCEDURE [dbo].[GEM_INT_TO_MET_SEZIONECONTRATTORAPPORTIMEZZI] (@AZRIF as varchar(3),
																	  @IDRAPPORTO as varchar(14),
																	  @Progressivo as decimal(10,0)) 
AS

BEGIN
		SET DATEFORMAT ymd 
	
		DECLARE @DATA_SYNC as datetime
		SET @DATA_SYNC = GetDate()

		-- inserisco in metodo i rapporti dei mezzi non presenti
		INSERT INTO GEM_SEZIONECONTRATTORAPPORTIMEZZI
		(
		  [IDCONTRATTO]
			,[SEZIONECONTRATTO]
			,[IDRAPPORTO]
			,[IdRigaMezzo]
		  ,[UTENTEMODIFICA] 
		  ,[DATAMODIFICA] 
		)
		SELECT
	     INS.[IDCONTRATTO] COLLATE Latin1_General_CI_AS
		  ,INS.[SEZIONECONTRATTO] 
		  ,INS.[IDRAPPORTO] COLLATE Latin1_General_CI_AS
		  ,INS.[IdRigaMezzo]
		  ,'Sincronizzazione'
		  ,@DATA_SYNC
		FROM
		GemmaSync.dbo.GEM_SEZIONECONTRATTORAPPORTIMEZZI INS
		WHERE INS.IDRAPPORTO = @IDRAPPORTO AND INS.AZRIF = @AZRIF and INS.Progressivo = @Progressivo
		EXCEPT
		SELECT
	      MET.[IDCONTRATTO]
		  ,MET.[SEZIONECONTRATTO]
		  ,MET.[IDRAPPORTO]
		  ,MET.[IdRigaMezzo]
		  ,'Sincronizzazione'
		  ,@DATA_SYNC
		FROM
		GEM_SEZIONECONTRATTORAPPORTIMEZZI MET
		WHERE MET.IDRAPPORTO = @IDRAPPORTO 		
	
        -- aggiorno i dati con i dati provenienti da interscambio
		UPDATE MET 
			SET MET.[IDRAPPORTOAGGREGATO] = INS.[IDRAPPORTOAGGREGATO]
			  ,MET.[CodMezzo] = INS.[CodMezzo]
			  ,MET.[DataInserimento] = convert(varchar(10), INS.[DataInserimento], 111) -- elimino l'ora. Era INS.[DataInserimento]
			  ,MET.[DataEliminazione] = convert(varchar(10), INS.[DataEliminazione], 111) -- elimino l'ora. Era INS.[DataEliminazione]
			  ,MET.[ELIMINATO] = isnull(INS.[ELIMINATO], '0')
			  ,MET.[POSIZIONE] = INS.[POSIZIONE]
			  ,MET.[SUBPOSIZIONE] = INS.[SUBPOSIZIONE]
			  ,MET.[UBICAZIONE] = INS.[UBICAZIONE]
			  ,MET.[POSCLIENTE] = INS.[POSCLIENTE]
			  ,MET.[NOTE] = INS.[NOTE] 
			  ,MET.[ORDINE] = INS.[ORDINE] 
			  ,MET.[CarTesto1] = INS.[CarTesto1] 
			  ,MET.[CarTesto2] = INS.[CarTesto2] 
			  ,MET.[CarTesto3] = INS.[CarTesto3] 
			  ,MET.[CarTesto4] = INS.[CarTesto4] 
			  ,MET.[CarTesto5] = INS.[CarTesto5]
			  ,MET.[CarTesto6] = INS.[CarTesto6] 
			  ,MET.[CarTesto7] = INS.[CarTesto7] 
			  ,MET.[CarTesto8] = INS.[CarTesto8] 
			  ,MET.[CarTesto9] = INS.[CarTesto9] 
			  ,MET.[CodiceBarre] = INS.[CodiceBarre] 
			  ,MET.[OMOLOGATO] = INS.[OMOLOGATO] 
			  ,MET.[ANNO] = INS.[ANNO] 
			  ,MET.[FLAG_INST] = INS.[FLAG_INST] 
			  ,MET.[STATO] = INS.[STATO] 
			  ,MET.[POSQLIK] = INS.[POSQLIK] 
			  ,MET.[QUANTITA] = INS.[QUANTITA] 
			  ,MET.[TEMPO_MAN] = INS.[TEMPO_MAN] 
			  ,MET.[IMPORTOAT1] = INS.[IMPORTOAT1] 
			  ,MET.[IMPORTOAT2] = INS.[IMPORTOAT2] 
			  ,MET.[IMPORTOAT3] = INS.[IMPORTOAT3] 
			  ,MET.[IMPORTOAT4] = INS.[IMPORTOAT4] 
			  ,MET.[IMPORTOAT5] = INS.[IMPORTOAT5] 
			  ,MET.[SCONTOAT1] = INS.[SCONTOAT1] 
			  ,MET.[SCONTOAT2] = INS.[SCONTOAT2] 
			  ,MET.[SCONTOAT3] = INS.[SCONTOAT3] 
			  ,MET.[SCONTOAT4] = INS.[SCONTOAT4] 
			  ,MET.[SCONTOAT5] = INS.[SCONTOAT5] 
			  ,MET.[PROV1AT1] = INS.[PROV1AT1] 
			  ,MET.[PROV1AT2] = INS.[PROV1AT2]
			  ,MET.[PROV1AT3] = INS.[PROV1AT3] 
			  ,MET.[PROV1AT4] = INS.[PROV1AT4] 
			  ,MET.[PROV1AT5] = INS.[PROV1AT5] 
			  ,MET.[PROV2AT1] = INS.[PROV2AT1]
			  ,MET.[PROV2AT2] = INS.[PROV2AT2] 
			  ,MET.[PROV2AT3] = INS.[PROV2AT3] 
			  ,MET.[PROV2AT4] = INS.[PROV2AT4] 
			  ,MET.[PROV2AT5] = INS.[PROV2AT5] 
			  ,MET.[PROV3AT1] = INS.[PROV3AT1] 
			  ,MET.[PROV3AT2] = INS.[PROV3AT2] 
			  ,MET.[PROV3AT3] = INS.[PROV3AT3] 
			  ,MET.[PROV3AT4] = INS.[PROV3AT4] 
			  ,MET.[PROV3AT5] = INS.[PROV3AT5] 
			  ,MET.[StatoFuoriSede] = INS.[StatoFuoriSede] 
			  ,MET.[StatoAttivita] = INS.[StatoAttivita] 
			  ,MET.[FLAGAT1] = isnull(INS.[FLAGAT1], '0')
			  ,MET.[FLAGAT2] = isnull(INS.[FLAGAT2], '0')
			  ,MET.[FLAGAT3] = isnull(INS.[FLAGAT3], '0')
			  ,MET.[FLAGAT4] = isnull(INS.[FLAGAT4], '0')
			  ,MET.[FLAGAT5] = isnull(INS.[FLAGAT5], '0')
			  ,MET.[FLAGRICARICA] = isnull(INS.[FLAGRICARICA], '0')
			  ,MET.[DATA_REV] = INS.[DATA_REV] 
			  ,MET.[DATA_PREV] = INS.[DATA_PREV] 
			  ,MET.[DATA_COLL] = INS.[DATA_COLL] 
			  ,MET.[DATA_PCOLL] = INS.[DATA_PCOLL] 
			  ,MET.[PRESSIONE_DIN] = INS.[PRESSIONE_DIN] 
			  ,MET.[PRESSIONE_STA] = INS.[PRESSIONE_STA] 
			  ,MET.[CAMPO01] = INS.[CAMPO01] 
			  ,MET.[CAMPO02] = INS.[CAMPO02] 
			  ,MET.[CAMPO03] = INS.[CAMPO03] 
			  ,MET.[CAMPO04] = INS.[CAMPO04] 
			  ,MET.[CAMPO05] = INS.[CAMPO05] 
			  ,MET.[CAMPO06] = INS.[CAMPO06] 
			  ,MET.[CAMPO07] = INS.[CAMPO07] 
			  ,MET.[CAMPO08] = INS.[CAMPO08] 
			  ,MET.[CAMPO09] = INS.[CAMPO09] 
			  ,MET.[CAMPO10] = INS.[CAMPO10] 
			  ,MET.[CAMPO11] = INS.[CAMPO11] 
			  ,MET.[CAMPO12] = INS.[CAMPO12] 
			  ,MET.[CAMPO13] = INS.[CAMPO13] 
			  ,MET.[CAMPO14] = INS.[CAMPO14] 
			  ,MET.[CAMPO15] = INS.[CAMPO15] 
			  ,MET.[CAMPO16] = INS.[CAMPO16] 
			  ,MET.[CAMPO17] = INS.[CAMPO17] 
			  ,MET.[CAMPO18] = INS.[CAMPO18] 
			  ,MET.[CAMPO19] = INS.[CAMPO19] 
			  ,MET.[CAMPO20] = INS.[CAMPO20] 
			  ,MET.[CAMPO21] = INS.[CAMPO21] 
			  ,MET.[CAMPO22] = INS.[CAMPO22] 
			  ,MET.[CAMPO23] = INS.[CAMPO23] 
			  ,MET.[CAMPO24] = INS.[CAMPO24] 
			  ,MET.[CAMPO25] = INS.[CAMPO25] 
			  ,MET.[CAMPO26] = INS.[CAMPO26] 
			  ,MET.[CAMPO27] = INS.[CAMPO27] 
			  ,MET.[CAMPO28] = INS.[CAMPO28] 
			  ,MET.[CAMPO29] = INS.[CAMPO29] 
			  ,MET.[CAMPO30] = INS.[CAMPO30] 
			  ,MET.[CAMPO31] = INS.[CAMPO31] 
			  ,MET.[CAMPO32] = INS.[CAMPO32] 
			  ,MET.[CAMPO33] = INS.[CAMPO33] 
			  ,MET.[CAMPO34] = INS.[CAMPO34] 
			  ,MET.[CAMPO35] = INS.[CAMPO35] 
			  ,MET.[CAMPO36] = INS.[CAMPO36] 
			  ,MET.[CAMPO37] = INS.[CAMPO37] 
			  ,MET.[CAMPO38] = INS.[CAMPO38] 
			  ,MET.[CAMPO39] = INS.[CAMPO39] 
			  ,MET.[CAMPO40] = INS.[CAMPO40] 
			  ,MET.[CAMPO41] = INS.[CAMPO41] 
			  ,MET.[CAMPO42] = INS.[CAMPO42] 
			  ,MET.[CAMPO43] = INS.[CAMPO43] 
			  ,MET.[CAMPO44] = INS.[CAMPO44] 
			  ,MET.[CAMPO45] = INS.[CAMPO45] 
			  ,MET.[CAMPO46] = INS.[CAMPO46] 
			  ,MET.[CAMPO47] = INS.[CAMPO47] 
			  ,MET.[CAMPO48] = INS.[CAMPO48] 
			  ,MET.[CAMPO49] = INS.[CAMPO49] 
			  ,MET.[CAMPO50] = INS.[CAMPO50] 
			  ,MET.[SEGNALATO] = INS.[SEGNALATO] 
			  ,MET.[NUOVARIGA] = INS.[NUOVARIGA] 
			  ,MET.[UTENTEMODIFICA] = INS.[UTENTEMODIFICA] 
			  ,MET.[DATAMODIFICA] = INS.[DATAMODIFICA] 
			  ,MET.UltimaAttivitaEseg = INS.UltimaAttivitaEseg
			  -- Rif. Ns. SF TV1272869 del 01.01.2013 - Revisione Impianti e CheckList			  
			  ,MET.[CodiceMezzoChekList] = INS.[CodiceMezzoChekList]
			  ,MET.[VersioneChekList] = INS.[VersioneChekList]
			  ,MET.[TitoloChekList] = INS.[TitoloChekList]
			  ,MET.[AnnotazioniTecnica] = INS.[AnnotazioniTecnica]
              ,MET.[RifLinkImmagine] = INS.[RifLinkImmagine]
			  ,MET.[CodiceEdificio] = INS.[CodiceEdificio]
			  ,MET.[CodiceLivello] = INS.[CodiceLivello]
			  ,MET.[CodiceVano] = INS.[CodiceVano]
			  ,MET.[PosizioneMappa] = INS.[PosizioneMappa]
              ,MET.[CodBarCoord] = INS.[CodBarCoord]
			  ,MET.[TipologiaBarre] = INS.[TipologiaBarre]
			  			  
			FROM GEM_SEZIONECONTRATTORAPPORTIMEZZI MET
			INNER JOIN GemmaSync.dbo.GEM_SEZIONECONTRATTORAPPORTIMEZZI INS ON
			MET.IDRAPPORTO = INS.IDRAPPORTO COLLATE Latin1_General_CI_AS 
			AND MET.SEZIONECONTRATTO = INS.SEZIONECONTRATTO 
			AND MET.IDCONTRATTO = INS.IDCONTRATTO COLLATE Latin1_General_CI_AS
			AND MET.IDRAPPORTO = INS.IDRAPPORTO COLLATE Latin1_General_CI_AS
			AND MET.IDRIGAMEZZO = INS.IDRIGAMEZZO
			WHERE MET.IDRAPPORTO = @IDRAPPORTO AND INS.AZRIF = @AZRIF and INS.Progressivo = @Progressivo
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_INT_TO_MET_SEZIONECONTRATTORAPPORTIMEZZI] TO [Metodo98]
    AS [dbo];

