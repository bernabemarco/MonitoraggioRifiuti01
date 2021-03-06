﻿








CREATE VIEW [dbo].[GEM_VistaDocumentiBaseGemma]
AS
SELECT     VDB.IDTESTA, VDB.ESERCIZIO, VDB.TIPODOC, VDB.NUMERODOC, VDB.BIS, VDB.DATADOC, VDB.DOCCHIUSO, VDB.BLOCCATO, VDB.CODCLIFOR, VDB.NUMRIFDOC, 
                      VDB.DATARIFDOC, VDB.CODBANCAINCASSO, VDB.NUMDESTDIVERSAMERCI, VDB.CODPAGAMENTO, VDB.CODLINGUA, VDB.CODCAMBIO, VDB.VALCAMBIO, 
                      VDB.SCONTOFINALE, VDB.CODCFFATT, VDB.PRCPROVVAG1, VDB.PRCPROVVFINALEAG1, VDB.PRCPROVVAG2, VDB.PRCPROVVFINALEAG2, VDB.PRCPROVVAG3, 
                      VDB.PRCPROVVFINALEAG3, VDB.FLAGCONT, VDB.ANNOTAZIONIPIEDE, VDB.TIPOPAR, VDB.FLGBLACKLIST, VDB.PROGRIGADOC, VDB.POSIZIONE, VDB.TIPORIGA, 
                      VDB.RIGACHIUSA, VDB.RIGABLOCCATA, VDB.CODART, VDB.DESCRIZIONEART, VDB.DATACONSEGNA, VDB.NUMLISTINO, VDB.UMGEST, VDB.UM1, VDB.UM2, 
                      VDB.UMPREZZO, VDB.SCONTORIGA, VDB.SCONTIESTESI, VDB.CODIVA, VDB.PROVVAG1, VDB.PROVVAG2, VDB.PROVVAG3, VDB.NUMCOLLI, VDB.GENCONTROP, 
                      VDB.NRRIFPARTITA, VDB.PESONETTO, VDB.PESOLORDO, VDB.PESOIMBALLO, VDB.SUPERFICIE, VDB.VOLUME, VDB.RIFCOMMCLI, VDB.NOMECOMMESSAPROD, 
                      VDB.VERSIONEDIBA, VDB.CAUSALEMAG, VDB.NRPEZZIIMBALLO, VDB.CODIMBALLO, VDB.NOMENCLCOMBINATA, VDB.CONTOCDC, VDB.CONTOCDCMOVCOLL, 
                      VDB.CODDEPOSITO, VDB.CODDEPOSITOCOLL, VDB.CODDEPCOMP, VDB.CODDEPCOMPCOLL, VDB.VARIANTI, VDB.ANNOTAZIONI, VDB.PREZZOUNITNETTO, 
                      VDB.PREZZOUNITLORDO, VDB.PREZZOUNITNETTOVALUTA, VDB.PREZZOUNITLORDOVALUTA, VDB.PREZZOUNITNETTOEURO, VDB.PREZZOUNITLORDOEURO, 
                      VDB.UBICAZIONE, VDB.UBICAZIONECOLL, VDB.UBICAZIONECOMP, VDB.UBICAZIONECOMPCOLL, VDB.TOTPROVVFINALEAG1, VDB.TOTPROVVFINALEAG2, 
                      VDB.TOTPROVVFINALEAG3, VDB.TOTPROVVFINALEAG1VALUTA, VDB.TOTPROVVFINALEAG2VALUTA, VDB.TOTPROVVFINALEAG3VALUTA, 
                      VDB.TOTPROVVFINALEAG1EURO, VDB.TOTPROVVFINALEAG2EURO, VDB.TOTPROVVFINALEAG3EURO, VDB.TOTDOCUMENTO, VDB.TOTIMPOSTA, 
                      VDB.TOTDOCUMENTOEURO, VDB.TOTIMPOSTAEURO, VDB.TOTDOCVALUTA, VDB.TOTIMPOSTAVALUTA, VDB.QTAGEST, VDB.QTAGESTRES, VDB.QTA1MAG, 
                      VDB.QTA1MAGRES, VDB.QTA2MAG, VDB.QTA2MAGRES, VDB.QTAPREZZO, VDB.QTAPREZZORES, VDB.QTAGESTPRELEVATA, VDB.TOTLORDORIGA, 
                      VDB.TOTNETTORIGA, VDB.TOTLORDORIGAVALUTA, VDB.TOTNETTORIGAVALUTA, VDB.TOTLORDORIGAEURO, VDB.TOTNETTORIGAEURO, VDB.TOTPROVVAG1, 
                      VDB.TOTPROVVAG2, VDB.TOTPROVVAG3, VDB.TOTPROVVAG1EURO, VDB.TOTPROVVAG2EURO, VDB.TOTPROVVAG3EURO, VDB.TOTPROVVAG1VALUTA, 
                      VDB.TOTPROVVAG2VALUTA, VDB.TOTPROVVAG3VALUTA, VDB.DSCCONTO1, VDB.CODCATEGORIACF, VDB.CODNAZIONE, VDB.CODSETTORE, VDB.CODZONA, 
                      VDB.GRUPPO, VDB.VARESPLICITE, VDB.CATEGORIA, VDB.CODCATEGORIASTAT, VDB.ARTTIPOLOGIA, VDB.CODICEPRIMARIO, VDB.DSCART, VDB.AGGIORNAMAG, 
                      VDB.CODARTICOLOBASE, VDB.DSCARTICOLOBASE, VDB.INCIDENZASCONTI, VDB.RIFRELAZIONECF, VDB.TOTNETTORIGARES, VDB.TOTNETTORIGAEURORES, 
                      VDB.IDTESTARP, VDB.IDRIGARP, VDB.ANNOBOLLACLF, VDB.NUMEROBOLLACLF, VDB.OPERAZIONECLF, VDB.STATOOPERAZIONECLF, 
                      VDB.CAUSALEVERSAMENTOCLF, VDB.CAUSALETRASFERIMENTOCLF, VDB.IMPTOTPROVVRIGALIT, VDB.IMPTOTPROVVRIGAVALUTA, VDB.IMPTOTPROVVRIGAEURO, 
                      ExRD.DATACONS, ExRD.ProgressivoReg, ExRD.IdRapportoGemma, ExRD.idTecnicoRisorsa, ExRD.TipoFatturazione, ExRD.Validita, ExRD.NaturaAddebMateriali, 
                      GEM_SEZIONECONTRATTORAPPORTI.IDCONTRATTO, GEM_SEZIONECONTRATTORAPPORTI.SEZIONECONTRATTO, 
                      GEM_SEZIONECONTRATTORAPPORTI.TIPOLOGIARAPPORTO, GEM_SEZIONECONTRATTORAPPORTI.TIPO_RAPPORTO, 
                      GEM_SEZIONECONTRATTORAPPORTI.DATA_PREV, GEM_SEZIONECONTRATTORAPPORTI.DATA_EFF, GEM_SEZIONECONTRATTORAPPORTI.DATA_FATT, 
                      GEM_SEZIONECONTRATTORAPPORTI.VersioneChekList, GEM_SEZIONECONTRATTORAPPORTI.TitoloChekList, GEM_SEZIONECONTRATTORAPPORTI.STATO, 
                      GEM_SEZIONECONTRATTORAPPORTI.DA_FATT, GEM_SEZIONECONTRATTORAPPORTI.EsitoDelControllo, GEM_SEZIONECONTRATTORAPPORTI.NUMERO_RFW, 
                      GEM_SEZIONECONTRATTORAPPORTI.TECNICO_EFF, GEM_SEZIONECONTRATTORAPPORTI.RIFCLIENTE AS RifClienteRapporto, 
                      GEM_SEZIONECONTRATTORAPPORTI.TECNICO_PREV, VDB.CODAGENTE1, VDB.CODAGENTE2, VDB.CODAGENTE3, 
                      GEM_SEZIONECONTRATTORAPPORTI.FLG_DerogaRicScadenze, GEM_SEZIONECONTRATTORAPPORTI.NOTE_INTERNE, 
                      GEM_SEZIONECONTRATTORAPPORTI.NOTE_TECNICO, GEM_VistaContratti.DATACONTRATTO, GEM_VistaContratti.DATAEFFICACIA, GEM_VistaContratti.DURATA, 
                      GEM_VistaContratti.idModFatt, GEM_VistaContratti.CondizioniParticolariCollegate, GEM_VistaContratti.CollegatoAdAltriContratti, 
                      GEM_VistaContratti.RichiestaAutorizzFattura, GEM_VistaContratti.RegistroOnLine, GEM_VistaContratti.CODReferenteInternoGestione, 
                      GEM_VistaContratti.CODCategoriaContratto, GEM_VistaContratti.MINISFS, GEM_VistaContratti.STAGIONALE, GEM_VistaContratti.IdStato, 
                      GEM_VistaContratti.RINNOVOAUT, GEM_VistaContratti.DATASCADENZA, GEM_VistaContratti.idTipoFatt, GEM_VistaContratti.PubblicaGemmaPlus, 
                      GEM_VistaContratti.DataPrimaRata, GEM_VistaContratti.CadenzaRate, GEM_VistaContratti.FLGUSAPRZGEMMA, GEM_VistaContratti.PROVV_SEGNALATORE, 
                      GEM_VistaContratti.FLAG_PROV, (CASE WHEN (VDB.tiporiga IN ('R')) THEN 0 ELSE GEM_VistaContratti.CODDEST END) AS CODDEST, 
                      GEM_VistaContratti.DESCRIZIONESEZIONE, GEM_VistaContratti.SEZ_idTipoFatt, GEM_VistaContratti.idTipologMezzo, GEM_VistaContratti.SEZ_FLGUSAPRZGEMMA, 
                      GEM_VistaContratti.DescTipologMezzo, GEM_VistaContratti.IdStrutturaOpPr, GEM_VistaContratti.Revisione, GEM_VistaContratti.CodiceMezzo, 
                      GEM_VistaContratti.idGListinoContr, (CASE WHEN (len(isnull(ExRD.IdRapportoGemma, '')) = 0 AND VDB.tiporiga IN ('n', 'v', 's', 'o')) 
                      THEN td.ragsocddm ELSE (CASE WHEN VDB.tiporiga IN ('R') THEN ' ' ELSE GEM_VistaContratti.SedeRagSoc END) END) AS SedeRagSoc, 
                      (CASE WHEN (len(isnull(ExRD.IdRapportoGemma, '')) = 0 AND VDB.tiporiga IN ('n', 'v', 's', 'o')) THEN td.indirizzoddm ELSE (CASE WHEN VDB.tiporiga IN ('R') 
                      THEN ' ' ELSE GEM_VistaContratti.SedeIndirizzo END) END) AS SedeIndirizzo, (CASE WHEN (len(isnull(ExRD.IdRapportoGemma, '')) = 0 AND VDB.tiporiga IN ('n', 'v', 
                      's', 'o')) THEN td.localitaddm ELSE (CASE WHEN VDB.tiporiga IN ('R') THEN ' ' ELSE GEM_VistaContratti.SedeLocalita END) END) AS SedeLocalita, 
                      (CASE WHEN (len(isnull(ExRD.IdRapportoGemma, '')) = 0 AND tiporiga IN ('n', 'v', 's', 'o')) THEN td.provinciaddm ELSE (CASE WHEN VDB.tiporiga IN ('R') 
                      THEN ' ' ELSE GEM_VistaContratti.SedeProvincia END) END) AS SedeProvincia, (CASE WHEN (len(isnull(ExRD.IdRapportoGemma, '')) = 0 AND tiporiga IN ('n', 'v', 's', 
                      'o')) THEN td.capddm ELSE (CASE WHEN VDB.tiporiga IN ('R') THEN ' ' ELSE GEM_VistaContratti.SedeCAP END) END) AS SedeCAP, ExTD.RefGestioneOrd, 
                      tDscRefGestioneOrd.DESCRIZIONE AS DscRefGestioneOrd, ExTD.RefRespCommessa, TDscRefRespCommessa.DESCRIZIONE AS DscRefRespCommessa, 
                      ExTD.RifOfferta, ExTD.flagNonFFConforme, ExTD.RefAcquisti, TDscRefAcquisti.DESCRIZIONE AS DscRefAcquisti, ExTD.RespConformitaACQ, 
                      TDscRespConformitaACQ.DESCRIZIONE AS DscRespConformitaACQ, ExTD.DataConformitaACQ, ExTD.CommessaService, ExTD.RefAmmInterno, 
                      ExTD.RefCommessaMF,
                          (SELECT     DSCReferente + ' - ' + NOTE AS Expr1
                            FROM          GEM_Vista_ReferenteInternoGestione
                            WHERE      (CODReferenteInternoGestione = GEM_VistaContratti.CODReferenteInternoGestione)) AS DscRefinternoContratto, ExRD.IDCONTRATTOGemma
FROM         TABRESPONSABILI AS TDscRespConformitaACQ RIGHT OUTER JOIN
                      EXTRATESTEDOC AS ExTD ON TDscRespConformitaACQ.CODICE = ExTD.RespConformitaACQ LEFT OUTER JOIN
                      TABRESPONSABILI AS TDscRefAcquisti ON ExTD.RefAcquisti = TDscRefAcquisti.CODICE LEFT OUTER JOIN
                      TABRESPONSABILI AS TDscRefRespCommessa ON ExTD.RefRespCommessa = TDscRefRespCommessa.CODICE LEFT OUTER JOIN
                      TABRESPONSABILI AS tDscRefGestioneOrd ON ExTD.RefGestioneOrd = tDscRefGestioneOrd.CODICE RIGHT OUTER JOIN
                      TESTEDOCUMENTI AS TD INNER JOIN
                      VISTADOCUMENTIBASE AS VDB ON TD.PROGRESSIVO = VDB.IDTESTA ON ExTD.IDTESTA = VDB.IDTESTA LEFT OUTER JOIN
                      GEM_SEZIONECONTRATTORAPPORTI LEFT OUTER JOIN
                      GEM_VistaContratti ON GEM_SEZIONECONTRATTORAPPORTI.SEZIONECONTRATTO = GEM_VistaContratti.SEZIONECONTRATTO AND 
                      GEM_SEZIONECONTRATTORAPPORTI.IDCONTRATTO = GEM_VistaContratti.IDCONTRATTO RIGHT OUTER JOIN
                      EXTRARIGHEDOC AS ExRD ON GEM_SEZIONECONTRATTORAPPORTI.IDRAPPORTO = ExRD.IdRapportoGemma ON VDB.PROGRIGADOC = ExRD.IDRIGA AND 
                      VDB.IDTESTA = ExRD.IDTESTA





GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaDocumentiBaseGemma] TO [Metodo98]
    AS [dbo];

