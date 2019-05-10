
CREATE PROCEDURE [dbo].[GEM_upd_stp_SEZIONECONTRATTORAPPORTIMEZZI] (@UtStampa as varchar(25)) 
AS
BEGIN
		UPDATE TempRM 
			SET TempRM.[IDRAPPORTOAGGREGATO] = MET.[IDRAPPORTOAGGREGATO]
			  ,TempRM.[CodMezzo] = MET.[CodMezzo]
			  ,TempRM.[DataInserimento] = MET.[DataInserimento]
			  ,TempRM.[DataEliminazione] = MET.[DataEliminazione]
			  ,TempRM.[ELIMINATO] = isnull(MET.[ELIMINATO], '0')
			  ,TempRM.[POSIZIONE] = MET.[POSIZIONE]
			  ,TempRM.[SUBPOSIZIONE] = MET.[SUBPOSIZIONE]
			  ,TempRM.[UBICAZIONE] = MET.[UBICAZIONE]
			  ,TempRM.[POSCLIENTE] = MET.[POSCLIENTE]
			  ,TempRM.[NOTE] = MET.[NOTE] 
			  ,TempRM.[ORDINE] = MET.[ORDINE] 
			  ,TempRM.[CarTesto1] = MET.[CarTesto1] 
			  ,TempRM.[CarTesto2] = MET.[CarTesto2] 
			  ,TempRM.[CarTesto3] = MET.[CarTesto3] 
			  ,TempRM.[CarTesto4] = MET.[CarTesto4] 
			  ,TempRM.[CarTesto5] = MET.[CarTesto5]
			  ,TempRM.[CarTesto6] = MET.[CarTesto6] 
			  ,TempRM.[CarTesto7] = MET.[CarTesto7] 
			  ,TempRM.[CarTesto8] = MET.[CarTesto8] 
			  ,TempRM.[CarTesto9] = MET.[CarTesto9] 
			  ,TempRM.[CodiceBarre] = MET.[CodiceBarre] 
			  ,TempRM.[OMOLOGATO] = MET.[OMOLOGATO] 
			  ,TempRM.[ANNO] = MET.[ANNO] 
			  ,TempRM.[FLAG_INST] = MET.[FLAG_INST] 
			  ,TempRM.[STATO] = MET.[STATO] 
			  ,TempRM.[POSQLIK] = MET.[POSQLIK] 
			  ,TempRM.[QUANTITA] = isnull(MET.[QUANTITA], 1) 
			  ,TempRM.[TEMPO_MAN] = MET.[TEMPO_MAN] 
			  ,TempRM.[IMPORTOAT1] = MET.[IMPORTOAT1] 
			  ,TempRM.[IMPORTOAT2] = MET.[IMPORTOAT2] 
			  ,TempRM.[IMPORTOAT3] = MET.[IMPORTOAT3] 
			  ,TempRM.[IMPORTOAT4] = MET.[IMPORTOAT4] 
			  ,TempRM.[IMPORTOAT5] = MET.[IMPORTOAT5] 
			  ,TempRM.[SCONTOAT1] = MET.[SCONTOAT1] 
			  ,TempRM.[SCONTOAT2] = MET.[SCONTOAT2] 
			  ,TempRM.[SCONTOAT3] = MET.[SCONTOAT3] 
			  ,TempRM.[SCONTOAT4] = MET.[SCONTOAT4] 
			  ,TempRM.[SCONTOAT5] = MET.[SCONTOAT5] 
			  ,TempRM.[PROV1AT1] = MET.[PROV1AT1] 
			  ,TempRM.[PROV1AT2] = MET.[PROV1AT2]
			  ,TempRM.[PROV1AT3] = MET.[PROV1AT3] 
			  ,TempRM.[PROV1AT4] = MET.[PROV1AT4] 
			  ,TempRM.[PROV1AT5] = MET.[PROV1AT5] 
			  ,TempRM.[PROV2AT1] = MET.[PROV2AT1]
			  ,TempRM.[PROV2AT2] = MET.[PROV2AT2] 
			  ,TempRM.[PROV2AT3] = MET.[PROV2AT3] 
			  ,TempRM.[PROV2AT4] = MET.[PROV2AT4] 
			  ,TempRM.[PROV2AT5] = MET.[PROV2AT5] 
			  ,TempRM.[PROV3AT1] = MET.[PROV3AT1] 
			  ,TempRM.[PROV3AT2] = MET.[PROV3AT2] 
			  ,TempRM.[PROV3AT3] = MET.[PROV3AT3] 
			  ,TempRM.[PROV3AT4] = MET.[PROV3AT4] 
			  ,TempRM.[PROV3AT5] = MET.[PROV3AT5] 
			  ,TempRM.[StatoFuoriSede] = isnull(MET.[StatoFuoriSede], 0)
			  ,TempRM.[StatoAttivita] = isnull(MET.[StatoAttivita], 0) 
			  ,TempRM.[FLAGAT1] = isnull(MET.[FLAGAT1], '0')
			  ,TempRM.[FLAGAT2] = isnull(MET.[FLAGAT2], '0')
			  ,TempRM.[FLAGAT3] = isnull(MET.[FLAGAT3], '0')
			  ,TempRM.[FLAGAT4] = isnull(MET.[FLAGAT4], '0')
			  ,TempRM.[FLAGAT5] = isnull(MET.[FLAGAT5], '0')
			  ,TempRM.[FLAGRICARICA] = isnull(MET.[FLAGRICARICA], '0')
			  ,TempRM.[DATA_REV] = MET.[DATA_REV] 
			  ,TempRM.[DATA_PREV] = MET.[DATA_PREV] 
			  ,TempRM.[DATA_COLL] = MET.[DATA_COLL] 
			  ,TempRM.[DATA_PCOLL] = MET.[DATA_PCOLL] 
			  ,TempRM.[PRESSIONE_DIN] = MET.[PRESSIONE_DIN] 
			  ,TempRM.[PRESSIONE_STA] = MET.[PRESSIONE_STA] 
			  ,TempRM.[CAMPO01] = MET.[CAMPO01] 
			  ,TempRM.[CAMPO02] = MET.[CAMPO02] 
			  ,TempRM.[CAMPO03] = MET.[CAMPO03] 
			  ,TempRM.[CAMPO04] = MET.[CAMPO04] 
			  ,TempRM.[CAMPO05] = MET.[CAMPO05] 
			  ,TempRM.[CAMPO06] = MET.[CAMPO06] 
			  ,TempRM.[CAMPO07] = MET.[CAMPO07] 
			  ,TempRM.[CAMPO08] = MET.[CAMPO08] 
			  ,TempRM.[CAMPO09] = MET.[CAMPO09] 
			  ,TempRM.[CAMPO10] = MET.[CAMPO10] 
			  ,TempRM.[CAMPO11] = MET.[CAMPO11] 
			  ,TempRM.[CAMPO12] = MET.[CAMPO12] 
			  ,TempRM.[CAMPO13] = MET.[CAMPO13] 
			  ,TempRM.[CAMPO14] = MET.[CAMPO14] 
			  ,TempRM.[CAMPO15] = MET.[CAMPO15] 
			  ,TempRM.[CAMPO16] = MET.[CAMPO16] 
			  ,TempRM.[CAMPO17] = MET.[CAMPO17] 
			  ,TempRM.[CAMPO18] = MET.[CAMPO18] 
			  ,TempRM.[CAMPO19] = MET.[CAMPO19] 
			  ,TempRM.[CAMPO20] = MET.[CAMPO20] 
			  ,TempRM.[CAMPO21] = MET.[CAMPO21] 
			  ,TempRM.[CAMPO22] = MET.[CAMPO22] 
			  ,TempRM.[CAMPO23] = MET.[CAMPO23] 
			  ,TempRM.[CAMPO24] = MET.[CAMPO24] 
			  ,TempRM.[CAMPO25] = MET.[CAMPO25] 
			  ,TempRM.[CAMPO26] = MET.[CAMPO26] 
			  ,TempRM.[CAMPO27] = MET.[CAMPO27] 
			  ,TempRM.[CAMPO28] = MET.[CAMPO28] 
			  ,TempRM.[CAMPO29] = MET.[CAMPO29] 
			  ,TempRM.[CAMPO30] = MET.[CAMPO30] 
			  ,TempRM.[CAMPO31] = MET.[CAMPO31] 
			  ,TempRM.[CAMPO32] = MET.[CAMPO32] 
			  ,TempRM.[CAMPO33] = MET.[CAMPO33] 
			  ,TempRM.[CAMPO34] = MET.[CAMPO34] 
			  ,TempRM.[CAMPO35] = MET.[CAMPO35] 
			  ,TempRM.[CAMPO36] = MET.[CAMPO36] 
			  ,TempRM.[CAMPO37] = MET.[CAMPO37] 
			  ,TempRM.[CAMPO38] = MET.[CAMPO38] 
			  ,TempRM.[CAMPO39] = MET.[CAMPO39] 
			  ,TempRM.[CAMPO40] = MET.[CAMPO40] 
			  ,TempRM.[CAMPO41] = MET.[CAMPO41] 
			  ,TempRM.[CAMPO42] = MET.[CAMPO42] 
			  ,TempRM.[CAMPO43] = MET.[CAMPO43] 
			  ,TempRM.[CAMPO44] = MET.[CAMPO44] 
			  ,TempRM.[CAMPO45] = MET.[CAMPO45] 
			  ,TempRM.[CAMPO46] = MET.[CAMPO46] 
			  ,TempRM.[CAMPO47] = MET.[CAMPO47] 
			  ,TempRM.[CAMPO48] = MET.[CAMPO48] 
			  ,TempRM.[CAMPO49] = MET.[CAMPO49] 
			  ,TempRM.[CAMPO50] = MET.[CAMPO50] 
			  ,TempRM.[SEGNALATO] = MET.[SEGNALATO] 
			  ,TempRM.[NUOVARIGA] = MET.[NUOVARIGA] 
			  ,TempRM.[UTENTEMODIFICA] = MET.[UTENTEMODIFICA] 
			  ,TempRM.[DATAMODIFICA] = MET.[DATAMODIFICA] 
			  ,TempRM.UltimaAttivitaEseg = MET.UltimaAttivitaEseg
			  ,TempRM.CodiceMezzoChekList= MET.CodiceMezzoChekList
			  ,TempRM.VersioneChekList= MET.VersioneChekList
			  ,TempRM.TitoloChekList= MET.TitoloChekList
			  ,TempRM.AnnotazioniTecnica= MET.AnnotazioniTecnica
			FROM GEM_SEZIONECONTRATTORAPPORTIMEZZI MET
			INNER JOIN GEM_TEMP_SEZIONECONTRATTORAPPORTIMEZZI TempRM ON
			TempRM.IDRAPPORTO = MET.IDRAPPORTO  
			AND TempRM.SEZIONECONTRATTO = MET.SEZIONECONTRATTO 
			AND TempRM.IDCONTRATTO = MET.IDCONTRATTO 
			AND TempRM.IDRAPPORTO = MET.IDRAPPORTO 
			AND TempRM.IDRIGAMEZZO = MET.IDRIGAMEZZO
			WHERE TempRM.UTENTEMODIFICA_stp = @UtStampa
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_upd_stp_SEZIONECONTRATTORAPPORTIMEZZI] TO [Metodo98]
    AS [dbo];

