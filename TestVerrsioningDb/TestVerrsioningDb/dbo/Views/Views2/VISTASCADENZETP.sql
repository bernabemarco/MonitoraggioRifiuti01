﻿

CREATE VIEW [dbo].[VISTASCADENZETP]
AS
SELECT  TP_SCADENZE.PROGRESSIVO,
    TP_SCADENZE.ESERCIZIO,
    TP_SCADENZE.TIPODOC,
    TP_SCADENZE.NUMDOC,
    TP_SCADENZE.BIS,
    TP_SCADENZE.NUMSCAD,
    TP_SCADENZE.DATASCADENZA,
    TP_SCADENZE.CODCLIFOR,
    TP_SCADENZE.DATAFATTURA,
    TP_SCADENZE.NUMRIF,
    TP_SCADENZE.NUMEROPROT,
    (SELECT CASE WHEN TP_SCADENZE.SCADATTPASS = 0 THEN TP_SCADENZE.IMPORTOSCEURO * -1 ELSE TP_SCADENZE.IMPORTOSCEURO END) AS IMPORTOSCEURO,
    (SELECT CASE WHEN TP_SCADENZE.SCADATTPASS = 0 THEN TP_SCADENZE.IMPORTOSCVAL * -1 ELSE TP_SCADENZE.IMPORTOSCVAL END) AS IMPORTOSCVAL,
    (SELECT CASE WHEN TP_SCADENZE.SCADATTPASS = 0 THEN TP_SCADENZE.TOTFATTEURO * -1 ELSE TP_SCADENZE.TOTFATTEURO END) AS TOTFATTEURO,
    (SELECT CASE WHEN TP_SCADENZE.SCADATTPASS = 0 THEN TP_SCADENZE.TOTFATTVAL * -1 ELSE TP_SCADENZE.TOTFATTVAL END) AS TOTFATTVAL,
    TP_SCADENZE.TIPOEFFETTO,
    TP_SCADENZE.ESITO,
    TP_SCADENZE.CODCAMBIO,
    TP_SCADENZE.VALCAMBIO,
    TP_SCADENZE.SCADATTPASS,
    TP_SCADENZE.NUMRIFPARTCONT,
    TP_SCADENZE.CODPAG,
    TP_SCADENZE.DATADEC,
    TP_SCADENZE.UTENTEMODIFICA,
    TP_SCADENZE.DATAMODIFICA,
    TP_SCADENZE.ESITOPREC,
    TP_SCADENZE.TOTSCAEURO,
    TP_SCADENZE.TOTSCAVAL,
    TP_SCADENZE.TIPOSCAD,
    TP_SCADENZE.IDTESTADISTINTA,
    TP_SCADENZE.STATOSCADENZA,
    VISTASCADENZE.TIPOREC AS TIPOREC, VISTASCADENZE.ANNODOC AS ANNODOC, 
    VISTASCADENZE.BANCAINC AS BANCAINC, VISTASCADENZE.BANCAAPPOGGIO AS BANCAAPPOGGIO, 
    VISTASCADENZE.CODAGE1 AS CODAGE1, VISTASCADENZE.CODAGE2 AS CODAGE2, VISTASCADENZE.CODAGE3 AS CODAGE3, 
    VISTASCADENZE.IMPPROVLIT1 AS IMPPROVLIT1, VISTASCADENZE.IMPPROVLIT2 AS IMPPROVLIT2, 
    VISTASCADENZE.IMPPROVLIT3 AS IMPPROVLIT3, VISTASCADENZE.IMPPROVVAL1 AS IMPPROVVAL1, 
    VISTASCADENZE.IMPPROVVAL2 AS IMPPROVVAL2, VISTASCADENZE.IMPPROVVAL3 AS IMPPROVVAL3, 
    VISTASCADENZE.IMPPROVEURO1 AS IMPPROVEURO1, VISTASCADENZE.IMPPROVEURO2 AS IMPPROVEURO2, 
    VISTASCADENZE.IMPPROVEURO3 AS IMPPROVEURO3, VISTASCADENZE.LIQPROV1 AS LIQPROV1, 
    VISTASCADENZE.LIQPROV2 AS LIQPROV2, VISTASCADENZE.LIQPROV3 AS LIQPROV3, 
    VISTASCADENZE.IMPORTOSCLIT AS IMPORTOSCLIT, VISTASCADENZE.IMPONIBSCLIT AS IMPONIBSCLIT, 
    VISTASCADENZE.IMPONIBSCVAL AS IMPONIBSCVAL, VISTASCADENZE.IMPONIBSCEURO AS IMPONIBSCEURO, 
    VISTASCADENZE.TOTFATTLIT AS TOTFATTLIT, VISTASCADENZE.IMPFATTLIT AS IMPFATTLIT, 
    VISTASCADENZE.IMPFATTVAL AS IMPFATTVAL, VISTASCADENZE.IMPFATTEURO AS IMPFATTEURO, 
    VISTASCADENZE.FLAGCONT AS FLAGCONT, VISTASCADENZE.LIVSOLL AS LIVSOLL, VISTASCADENZE.LIQINS1 AS LIQINS1, 
    VISTASCADENZE.LIQINS2 AS LIQINS2, VISTASCADENZE.LIQINS3 AS LIQINS3, VISTASCADENZE.NRDISTINTA AS NRDISTINTA, 
    VISTASCADENZE.NUMRAGGR AS NUMRAGGR, VISTASCADENZE.DATAPAGEFF AS DATAPAGEFF, VISTASCADENZE.NOTE AS NOTE, 
    VISTASCADENZE.NRGIORNALE AS NRGIORNALE, VISTASCADENZE.IDBOZZAAGT1 AS IDBOZZAAGT1, 
    VISTASCADENZE.IDBOZZAAGT2 AS IDBOZZAAGT2, VISTASCADENZE.IDBOZZAAGT3 AS IDBOZZAAGT3, 
    VISTASCADENZE.NRRIGAAGT1 AS NRRIGAAGT1, VISTASCADENZE.NRRIGAAGT2 AS NRRIGAAGT2, 
    VISTASCADENZE.NRRIGAAGT3 AS NRRIGAAGT3, VISTASCADENZE.DATASOLL1 AS DATASOLL1, 
    VISTASCADENZE.DATASOLL2 AS DATASOLL2, VISTASCADENZE.DATASOLL3 AS DATASOLL3, 
    VISTASCADENZE.RIFSCADRIEMISSIONE AS RIFSCADRIEMISSIONE, VISTASCADENZE.FLAGCESSIONE AS FLAGCESSIONE, 
    VISTASCADENZE.ABI_RIEMISS AS ABI_RIEMISS, VISTASCADENZE.CAB_RIEMISS AS CAB_RIEMISS, 
    VISTASCADENZE.RAGSOC_RIEMISS AS RAGSOC_RIEMISS, VISTASCADENZE.INDIRIZZO_RIEMISS AS INDIRIZZO_RIEMISS, 
    VISTASCADENZE.CAP_RIEMISS AS CAP_RIEMISS, VISTASCADENZE.LOCALITA_RIEMISS AS LOCALITA_RIEMISS, 
    VISTASCADENZE.PROV_RIEMISS AS PROV_RIEMISS, VISTASCADENZE.NAZ_RIEMISS AS NAZ_RIEMISS, 
    VISTASCADENZE.NOTE_RIEMISS AS NOTE_RIEMISS, VISTASCADENZE.ESITOPRECRIEMISS AS ESITOPRECRIEMISS, 
    VISTASCADENZE.DSCBANCARIEMISS AS DSCBANCARIEMISS, VISTASCADENZE.DATAULTCALCINT AS DATAULTCALCINT, 
    VISTASCADENZE.DSCESITOPRECRIEMISS AS DSCESITOPRECRIEMISS, VISTASCADENZE.ESITO_R AS ESITO_R, 
    VISTASCADENZE.DSCESITO_R AS DSCESITO_R, VISTASCADENZE.DSCPAG AS DSCPAG, 
    VISTASCADENZE.CONTORIFBANCA AS CONTORIFBANCA, VISTASCADENZE.DSCCONTO1 AS DSCCONTO1, 
    VISTASCADENZE.DSCCONTO2 AS DSCCONTO2, VISTASCADENZE.FAX AS FAX, VISTASCADENZE.DSCBANCA AS DSCBANCA, 
    VISTASCADENZE.DSCTIPOEFFETTO AS DSCTIPOEFFETTO, VISTASCADENZE.SEGNOATTPASS AS SEGNOATTPASS, 
    VISTASCADENZE.IMPONIBSCADLIT AS IMPONIBSCADLIT, VISTASCADENZE.IMPONIBSCADEURO AS IMPONIBSCADEURO, 
    VISTASCADENZE.IMPONIBSCADVAL AS IMPONIBSCADVAL, VISTASCADENZE.IMPORTOSCADLIRE AS IMPORTOSCADLIRE, 
    VISTASCADENZE.IMPORTOSCADEURO AS IMPORTOSCADEURO, VISTASCADENZE.IMPORTOSCADVALUTA AS IMPORTOSCADVALUTA, 
    VISTASCADENZE.TOTFATTURALIRE AS TOTFATTURALIRE, VISTASCADENZE.TOTFATTURAEURO AS TOTFATTURAEURO, 
    VISTASCADENZE.TOTFATTURAVALUTA AS TOTFATTURAVALUTA, VISTASCADENZE.IMPFATTURALIRE AS IMPFATTURALIRE, 
    VISTASCADENZE.IMPFATTURAEURO AS IMPFATTURAEURO, VISTASCADENZE.IMPFATTURAVALUTA AS IMPFATTURAVALUTA, 
    VISTASCADENZE.IMPPROVSGNLIRE1 AS IMPPROVSGNLIRE1, VISTASCADENZE.IMPPROVSGNEURO1 AS IMPPROVSGNEURO1, 
    VISTASCADENZE.IMPPROVSGNVALUTA1 AS IMPPROVSGNVALUTA1, VISTASCADENZE.IMPPROVSGNLIRE2 AS IMPPROVSGNLIRE2, 
    VISTASCADENZE.IMPPROVSGNEURO2 AS IMPPROVSGNEURO2, VISTASCADENZE.IMPPROVSGNLIRE3 AS IMPPROVSGNLIRE3, 
    VISTASCADENZE.IMPPROVSGNVALUTA2 AS IMPPROVSGNVALUTA2, VISTASCADENZE.IMPPROVSGNEURO3 AS IMPPROVSGNEURO3, 
    VISTASCADENZE.IMPPROVSGNVALUTA3 AS IMPPROVSGNVALUTA3, VISTASCADENZE.DSCAGENTE1 AS DSCAGENTE1, 
    VISTASCADENZE.DSCAGENTE2 AS DSCAGENTE2, VISTASCADENZE.DSCAGENTE3 AS DSCAGENTE3, 
    VISTASCADENZE.NAZIONE AS NAZIONE, VISTASCADENZE.SETTORE AS SETTORE, VISTASCADENZE.ZONA AS ZONA, 
    VISTASCADENZE.CATEGORIA AS CATEGORIA, VISTASCADENZE.DSCEFFETTO AS DSCEFFETTO, 
    VISTASCADENZE.DSCESITO AS DSCESITO, VISTASCADENZE.DESSCADATTPASS AS DESSCADATTPASS, VISTASCADENZE.MESE AS MESE,
    VISTASCADENZE.ANNO AS ANNO
FROM         TP_SCADENZE LEFT OUTER JOIN
                      VISTASCADENZE ON TP_SCADENZE.PROGRESSIVO = VISTASCADENZE.PROGRESSIVO

GO
GRANT DELETE
    ON OBJECT::[dbo].[VISTASCADENZETP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VISTASCADENZETP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTASCADENZETP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VISTASCADENZETP] TO [Metodo98]
    AS [dbo];

