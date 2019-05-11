﻿

CREATE VIEW [dbo].[GEM_VistaTesteDocumentiGemma]
AS
SELECT     VISTATESTEDOC.PROGRESSIVO, VISTATESTEDOC.ESERCIZIO, VISTATESTEDOC.TIPODOC, VISTATESTEDOC.NUMERODOC, VISTATESTEDOC.BIS, 
                      VISTATESTEDOC.DATADOC, VISTATESTEDOC.DOCCHIUSO, VISTATESTEDOC.BLOCCATO, VISTATESTEDOC.CODCLIFOR, VISTATESTEDOC.NUMRIFDOC, 
                      VISTATESTEDOC.DATARIFDOC, VISTATESTEDOC.CODAGENTE1, VISTATESTEDOC.CODAGENTE2, VISTATESTEDOC.CODAGENTE3, 
                      VISTATESTEDOC.CODBANCAINCASSO, VISTATESTEDOC.CODLISTINO, VISTATESTEDOC.CODLINGUA, VISTATESTEDOC.NUMDESTDIVERSAMERCI, 
                      VISTATESTEDOC.CODPAGAMENTO, VISTATESTEDOC.CODCAMBIO, VISTATESTEDOC.VALCAMBIO, VISTATESTEDOC.SCONTOFINALE, 
                      VISTATESTEDOC.CODCFFATT, VISTATESTEDOC.PRCPROVVAG1, VISTATESTEDOC.PRCPROVVFINALEAG1, VISTATESTEDOC.PRCPROVVAG2, 
                      VISTATESTEDOC.PRCPROVVFINALEAG2, VISTATESTEDOC.PRCPROVVAG3, VISTATESTEDOC.PRCPROVVFINALEAG3, VISTATESTEDOC.TIPOPAR, 
                      VISTATESTEDOC.RAGSOCCF, VISTATESTEDOC.CODCATEGORIACF, VISTATESTEDOC.CODNAZIONE, VISTATESTEDOC.CODSETTORE, 
                      VISTATESTEDOC.CODZONA, VISTATESTEDOC.DIVISA, VISTATESTEDOC.DSCDIVISA, VISTATESTEDOC.TOTPROVVFINALEAG1, 
                      VISTATESTEDOC.TOTPROVVFINALEAG2, VISTATESTEDOC.TOTPROVVFINALEAG3, VISTATESTEDOC.TOTPROVVFINALEAG1VALUTA, 
                      VISTATESTEDOC.TOTPROVVFINALEAG2VALUTA, VISTATESTEDOC.TOTPROVVFINALEAG3VALUTA, VISTATESTEDOC.TOTPROVVFINALEAG1EURO, 
                      VISTATESTEDOC.TOTPROVVFINALEAG2EURO, VISTATESTEDOC.TOTPROVVFINALEAG3EURO, VISTATESTEDOC.TOTPROVVFINALEAG1RES, 
                      VISTATESTEDOC.TOTPROVVFINALEAG2RES, VISTATESTEDOC.TOTPROVVFINALEAG3RES, VISTATESTEDOC.TOTPROVVFINALEAG1VALUTARES, 
                      VISTATESTEDOC.TOTPROVVFINALEAG2VALUTARES, VISTATESTEDOC.TOTPROVVFINALEAG3VALUTARES, 
                      VISTATESTEDOC.TOTPROVVFINALEAG1EURORES, VISTATESTEDOC.TOTPROVVFINALEAG2EURORES, 
                      VISTATESTEDOC.TOTPROVVFINALEAG3EURORES, VISTATESTEDOC.TOTIMPONIBILE, VISTATESTEDOC.TOTIMPOSTA, 
                      VISTATESTEDOC.TOTDOCUMENTO, VISTATESTEDOC.TOTIMPONIBILEEURO, VISTATESTEDOC.TOTIMPOSTAEURO, 
                      VISTATESTEDOC.TOTDOCUMENTOEURO, VISTATESTEDOC.TOTIMPONIBILEVALUTA, VISTATESTEDOC.TOTIMPOSTAVALUTA, 
                      VISTATESTEDOC.TOTDOCVALUTA, VISTATESTEDOC.TOTDOCUMENTORES, VISTATESTEDOC.TOTIMPONIBILERES, VISTATESTEDOC.TOTIMPOSTARES, 
                      VISTATESTEDOC.TOTIMPONIBILEEURORES, VISTATESTEDOC.TOTIMPOSTAEURORES, VISTATESTEDOC.TOTDOCUMENTOEURORES, 
                      VISTATESTEDOC.TOTIMPONIBILEVALUTARES, VISTATESTEDOC.TOTIMPOSTAVALUTARES, VISTATESTEDOC.TOTDOCVALUTARES, 
                      ANAGRAFICARISERVATICF.STATOCONTABILITA, ANAGRAFICARISERVATICF.STATOMAGAZZINO, ANAGRAFICARISERVATICF.STATOORDINI, 
                      ANAGRAFICARISERVATICF.STATOBOLLE, ANAGRAFICARISERVATICF.STATOFATTURE, ANAGRAFICARISERVATICF.STATONOTEACCREDITO, 
                      ANAGRAFICARISERVATICF.STATOALTRO, GEM_SEZIONECONTRATTORAPPORTI.IDRAPPORTO, GEM_SEZIONECONTRATTORAPPORTI.IDCONTRATTO, 
                      GEM_SEZIONECONTRATTORAPPORTI.SEZIONECONTRATTO, GEM_VistaContratti.CODDEST, GEM_VistaContratti.SedeRagSoc, 
                      GEM_VistaContratti.SedeProvincia,
					  GEM_VistaContratti.STAGIONALE, GEM_VistaContratti.MINISFS, GEM_VistaContratti.CODCategoriaContratto
FROM         GEM_VistaContratti RIGHT OUTER JOIN
                      GEM_SEZIONECONTRATTORAPPORTI ON GEM_VistaContratti.IDCONTRATTO = GEM_SEZIONECONTRATTORAPPORTI.IDCONTRATTO AND 
                      GEM_VistaContratti.SEZIONECONTRATTO = GEM_SEZIONECONTRATTORAPPORTI.SEZIONECONTRATTO RIGHT OUTER JOIN
                      ANAGRAFICARISERVATICF INNER JOIN
                      VISTATESTEDOC ON ANAGRAFICARISERVATICF.ESERCIZIO = VISTATESTEDOC.ESERCIZIO AND 
                      ANAGRAFICARISERVATICF.CODCONTO = VISTATESTEDOC.CODCLIFOR ON 
                      GEM_SEZIONECONTRATTORAPPORTI.NUMERO_RFW = VISTATESTEDOC.PROGRESSIVO


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaTesteDocumentiGemma] TO [Metodo98]
    AS [dbo];
