﻿


CREATE VIEW [dbo].[GEM_VistadocumentiResGemma]
AS
SELECT     VSDRes.IDTESTA, VSDRes.ESERCIZIO, VSDRes.TIPODOC, VSDRes.NUMERODOC, VSDRes.BIS, VSDRes.DATADOC, VSDRes.DOCCHIUSO, VSDRes.BLOCCATO, 
                      VSDRes.CODCLIFOR, VSDRes.NUMRIFDOC, VSDRes.DATARIFDOC, VSDRes.CODAGENTE1, VSDRes.CODAGENTE2, VSDRes.CODAGENTE3, 
                      VSDRes.CODBANCAINCASSO, VSDRes.NUMDESTDIVERSAMERCI, VSDRes.CODPAGAMENTO, VSDRes.CODLINGUA, VSDRes.CODCAMBIO, VSDRes.VALCAMBIO, 
                      VSDRes.SCONTOFINALE, VSDRes.CODCFFATT, VSDRes.PRCPROVVAG1, VSDRes.PRCPROVVFINALEAG1, VSDRes.PRCPROVVAG2, VSDRes.PRCPROVVFINALEAG2, 
                      VSDRes.PRCPROVVAG3, VSDRes.PRCPROVVFINALEAG3, VSDRes.ANNOTAZIONIPIEDE, VSDRes.TIPOPAR, VSDRes.PROGRIGADOC, VSDRes.POSIZIONE, 
                      VSDRes.TIPORIGA, VSDRes.RIGACHIUSA, VSDRes.RIGABLOCCATA, VSDRes.CODART, VSDRes.DESCRIZIONEART, VSDRes.DATACONSEGNA, 
                      VSDRes.DATACONSEGNARICHIESTA, VSDRes.NUMLISTINO, VSDRes.UMGEST, VSDRes.UM1, VSDRes.UM2, VSDRes.UMPREZZO, VSDRes.SCONTORIGA, 
                      VSDRes.SCONTIESTESI, VSDRes.CODIVA, VSDRes.PROVVAG1, VSDRes.PROVVAG2, VSDRes.PROVVAG3, VSDRes.NUMCOLLI, VSDRes.GENCONTROP, 
                      VSDRes.NRRIFPARTITA, VSDRes.PESONETTO, VSDRes.PESOLORDO, VSDRes.PESOIMBALLO, VSDRes.SUPERFICIE, VSDRes.VOLUME, VSDRes.RIFCOMMCLI, 
                      VSDRes.NOMECOMMESSAPROD, VSDRes.VERSIONEDIBA, VSDRes.CAUSALEMAG, VSDRes.NRPEZZIIMBALLO, VSDRes.CODIMBALLO, 
                      VSDRes.NOMENCLCOMBINATA, VSDRes.CONTOCDC, VSDRes.CONTOCDCMOVCOLL, VSDRes.CODDEPOSITO, VSDRes.CODDEPOSITOCOLL, VSDRes.CODDEPCOMP, 
                      VSDRes.CODDEPCOMPCOLL, VSDRes.VARIANTI, VSDRes.ANNOTAZIONI, VSDRes.PREZZOUNITNETTO, VSDRes.PREZZOUNITLORDO, 
                      VSDRes.PREZZOUNITNETTOVALUTA, VSDRes.PREZZOUNITLORDOVALUTA, VSDRes.PREZZOUNITNETTOEURO, VSDRes.PREZZOUNITLORDOEURO, 
                      VSDRes.UBICAZIONE, VSDRes.UBICAZIONECOLL, VSDRes.UBICAZIONECOMP, VSDRes.UBICAZIONECOMPCOLL, VSDRes.TOTPROVVFINALEAG1, 
                      VSDRes.TOTPROVVFINALEAG2, VSDRes.TOTPROVVFINALEAG3, VSDRes.TOTPROVVFINALEAG1VALUTA, VSDRes.TOTPROVVFINALEAG2VALUTA, 
                      VSDRes.TOTPROVVFINALEAG3VALUTA, VSDRes.TOTPROVVFINALEAG1EURO, VSDRes.TOTPROVVFINALEAG2EURO, VSDRes.TOTPROVVFINALEAG3EURO, 
                      VSDRes.TOTDOCUMENTO, VSDRes.TOTIMPOSTA, VSDRes.TOTDOCUMENTOEURO, VSDRes.TOTIMPOSTAEURO, VSDRes.TOTDOCVALUTA, 
                      VSDRes.TOTIMPOSTAVALUTA, VSDRes.QTAGEST, VSDRes.QTAGESTRES, VSDRes.QTA1MAG, VSDRes.QTA1MAGRES, VSDRes.QTA2MAG, VSDRes.QTA2MAGRES, 
                      VSDRes.QTAPREZZO, VSDRes.QTAPREZZORES, VSDRes.QTAGESTPRELEVATA, VSDRes.TOTLORDORIGA, VSDRes.TOTNETTORIGA, 
                      VSDRes.TOTLORDORIGAVALUTA, VSDRes.TOTNETTORIGAVALUTA, VSDRes.TOTLORDORIGAEURO, VSDRes.TOTNETTORIGAEURO, VSDRes.TOTPROVVAG1, 
                      VSDRes.TOTPROVVAG2, VSDRes.TOTPROVVAG3, VSDRes.TOTPROVVAG1EURO, VSDRes.TOTPROVVAG2EURO, VSDRes.TOTPROVVAG3EURO, 
                      VSDRes.TOTPROVVAG1VALUTA, VSDRes.TOTPROVVAG2VALUTA, VSDRes.TOTPROVVAG3VALUTA, VSDRes.DSCCONTO1, VSDRes.CODCATEGORIACF, 
                      VSDRes.CODNAZIONE, VSDRes.CODSETTORE, VSDRes.CODZONA, VSDRes.GRUPPO, VSDRes.VARESPLICITE, VSDRes.CATEGORIA, VSDRes.CODCATEGORIASTAT, 
                      VSDRes.ARTTIPOLOGIA, VSDRes.CODICEPRIMARIO, VSDRes.DSCART, VSDRes.TIPOCALCPROVVFINALI, VSDRes.INCIDENZASCONTI, VSDRes.CODARTICOLOBASE, 
                      VSDRes.DSCARTICOLOBASE, VSDRes.RIFRELAZIONECF, EXTRARIGHEDOC.DATACONS, EXTRARIGHEDOC.ProgressivoReg, EXTRARIGHEDOC.IdRapportoGemma, 
                      EXTRARIGHEDOC.idTecnicoRisorsa, EXTRARIGHEDOC.TipoFatturazione, EXTRARIGHEDOC.Validita, EXTRARIGHEDOC.NaturaAddebMateriali, 
                      GEM_SEZIONECONTRATTORAPPORTI.IDCONTRATTO, GEM_SEZIONECONTRATTORAPPORTI.SEZIONECONTRATTO, 
                      GEM_SEZIONECONTRATTORAPPORTI.TIPOLOGIARAPPORTO, GEM_SEZIONECONTRATTORAPPORTI.TIPO_RAPPORTO, 
                      GEM_SEZIONECONTRATTORAPPORTI.DATA_PREV, GEM_SEZIONECONTRATTORAPPORTI.DATA_EFF, GEM_SEZIONECONTRATTORAPPORTI.DATA_FATT, 
                      GEM_SEZIONECONTRATTORAPPORTI.VersioneChekList, GEM_SEZIONECONTRATTORAPPORTI.TitoloChekList, GEM_SEZIONECONTRATTORAPPORTI.STATO, 
                      GEM_SEZIONECONTRATTORAPPORTI.DA_FATT, GEM_SEZIONECONTRATTORAPPORTI.EsitoDelControllo, GEM_SEZIONECONTRATTORAPPORTI.NUMERO_RFW, 
                      GEM_SEZIONECONTRATTORAPPORTI.TECNICO_EFF, GEM_SEZIONECONTRATTORAPPORTI.TECNICO_PREV, 
                      GEM_SEZIONECONTRATTORAPPORTI.RIFCLIENTE AS RifClienteRapporto, GEM_SEZIONECONTRATTORAPPORTI.FLG_DerogaRicScadenze, 
                      GEM_SEZIONECONTRATTORAPPORTI.NOTE_INTERNE, GEM_SEZIONECONTRATTORAPPORTI.NOTE_TECNICO, GEM_VistaContratti.DATACONTRATTO, 
                      GEM_VistaContratti.DATAEFFICACIA, GEM_VistaContratti.DURATA, GEM_VistaContratti.idModFatt, GEM_VistaContratti.CondizioniParticolariCollegate, 
                      GEM_VistaContratti.CollegatoAdAltriContratti, GEM_VistaContratti.RichiestaAutorizzFattura, GEM_VistaContratti.RegistroOnLine, 
                      GEM_VistaContratti.CODReferenteInternoGestione, GEM_VistaContratti.CODCategoriaContratto, GEM_VistaContratti.STAGIONALE, GEM_VistaContratti.IdStato, 
                      GEM_VistaContratti.RINNOVOAUT, GEM_VistaContratti.DATASCADENZA, GEM_VistaContratti.idTipoFatt, GEM_VistaContratti.PubblicaGemmaPlus, 
                      GEM_VistaContratti.DataPrimaRata, GEM_VistaContratti.CadenzaRate, GEM_VistaContratti.FLGUSAPRZGEMMA, GEM_VistaContratti.PROVV_SEGNALATORE, 
                      GEM_VistaContratti.CODDEST, GEM_VistaContratti.DESCRIZIONESEZIONE, GEM_VistaContratti.SEZ_idTipoFatt, GEM_VistaContratti.idTipologMezzo, 
                      GEM_VistaContratti.SEZ_FLGUSAPRZGEMMA, GEM_VistaContratti.DescTipologMezzo, GEM_VistaContratti.IdStrutturaOpPr, GEM_VistaContratti.Revisione, 
					  GEM_VistaContratti.MINISFS,
                      GEM_VistaContratti.CodiceMezzo, GEM_VistaContratti.idGListinoContr, GEM_VistaContratti.SedeRagSoc, GEM_VistaContratti.SedeIndirizzo, 
                      GEM_VistaContratti.SedeLocalita, GEM_VistaContratti.SedeProvincia, GEM_VistaContratti.SedeCAP,
                          (SELECT     DSCReferente + ' - ' + NOTE AS Expr1
                            FROM          GEM_Vista_ReferenteInternoGestione
                            WHERE      (CODReferenteInternoGestione = GEM_VistaContratti.CODReferenteInternoGestione)) AS DscRefinternoContratto,
                          (SELECT     AGGIORNAMAG
                            FROM          ANAGRAFICAARTICOLI AS AA
                            WHERE      (CODICE = VSDRes.CODART)) AS AGGIORNAMAG
							,          ExTD.RefGestioneOrd, tDscRefGestioneOrd.DESCRIZIONE AS DscRefGestioneOrd, ExTD.RefRespCommessa, 
                      TDscRefRespCommessa.DESCRIZIONE AS DscRefRespCommessa, ExTD.RifOfferta, ExTD.flagNonFFConforme, ExTD.RefAcquisti, 
                      TDscRefAcquisti.DESCRIZIONE AS DscRefAcquisti, ExTD.RespConformitaACQ, TDscRespConformitaACQ.DESCRIZIONE AS DscRespConformitaACQ, 
                      ExTD.DataConformitaACQ,
					  CommessaService, RefAmmInterno, RefCommessaMF
					  --,CODReferenteInternoGestione, 
					 --, (SELECT  DSCReferente + ' - ' + NOTE 
					--FROM GEM_Vista_ReferenteInternoGestione where CODReferenteInternoGestione=GEM_VistaContratti.CODReferenteInternoGestione) as DscRefinternoContratto

FROM         EXTRATESTEDOC AS ExTD LEFT OUTER JOIN
                      TABRESPONSABILI AS TDscRespConformitaACQ ON ExTD.RespConformitaACQ = TDscRespConformitaACQ.CODICE RIGHT OUTER JOIN
					  TABRESPONSABILI AS TDscRefAcquisti ON ExTD.RefAcquisti = TDscRefAcquisti.CODICE LEFT OUTER JOIN
                      TABRESPONSABILI AS TDscRefRespCommessa ON ExTD.RefRespCommessa = TDscRefRespCommessa.CODICE LEFT OUTER JOIN
                      TABRESPONSABILI AS tDscRefGestioneOrd ON ExTD.RefGestioneOrd = tDscRefGestioneOrd.CODICE RIGHT OUTER JOIN
                      VISTADOCUMENTIRESBASE AS VSDRes ON ExTD.IDTESTA = VSDRes.IDTESTA LEFT OUTER JOIN
                      GEM_SEZIONECONTRATTORAPPORTI LEFT OUTER JOIN
                      GEM_VistaContratti ON GEM_SEZIONECONTRATTORAPPORTI.SEZIONECONTRATTO = GEM_VistaContratti.SEZIONECONTRATTO AND 
                      GEM_SEZIONECONTRATTORAPPORTI.IDCONTRATTO = GEM_VistaContratti.IDCONTRATTO RIGHT OUTER JOIN
                      EXTRARIGHEDOC ON GEM_SEZIONECONTRATTORAPPORTI.IDRAPPORTO = EXTRARIGHEDOC.IdRapportoGemma ON 
                      VSDRes.PROGRIGADOC = EXTRARIGHEDOC.IDRIGA AND VSDRes.IDTESTA = EXTRARIGHEDOC.IDTESTA
					  
	


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistadocumentiResGemma] TO [Metodo98]
    AS [dbo];
