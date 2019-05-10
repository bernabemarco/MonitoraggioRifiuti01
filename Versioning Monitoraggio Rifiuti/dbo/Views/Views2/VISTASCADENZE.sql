﻿
CREATE VIEW VISTASCADENZE AS
SELECT 1 AS TIPOREC,
    TS.PROGRESSIVO,
    TS.ESERCIZIO,
    TS.ANNODOC,
    TS.TIPODOC,
    TS.NUMDOC,
    TS.BIS,
    TS.NUMSCAD,
    TS.DATASCADENZA,
    TS.CODCLIFOR,
    TS.DATAFATTURA,
    TS.BANCAINC,
    TS.BANCAAPPOGGIO,
    TS.NUMRIF,
    TS.NUMEROPROT,
    TS.CODAGE1,
    TS.CODAGE2,
    TS.CODAGE3,
    TS.IMPPROVLIT1,
    TS.IMPPROVLIT2,
    TS.IMPPROVLIT3,
    TS.IMPPROVVAL1,
    TS.IMPPROVVAL2,
    TS.IMPPROVVAL3,
    TS.IMPPROVEURO1,
    TS.IMPPROVEURO2,
    TS.IMPPROVEURO3,
    TS.LIQPROV1,
    TS.LIQPROV2,
    TS.LIQPROV3,
    TS.IMPORTOSCLIT,
    TS.IMPORTOSCVAL,
    TS.IMPORTOSCEURO,
    TS.IMPONIBSCLIT,
    TS.IMPONIBSCVAL,
    TS.IMPONIBSCEURO,
    TS.TOTFATTLIT,
    TS.TOTFATTVAL,
    TS.TOTFATTEURO,
    TS.IMPFATTLIT,
    TS.IMPFATTVAL,
    TS.IMPFATTEURO,
    TS.FLAGCONT,
    TS.TIPOEFFETTO,
    TS.ESITO,
    TS.LIVSOLL,
    TS.LIQINS1,
    TS.LIQINS2,
    TS.LIQINS3,
    TS.CODCAMBIO,
    TS.VALCAMBIO,
    TS.NRDISTINTA,
    TS.NUMRAGGR,
    TS.DATAPAGEFF,
    TS.SCADATTPASS,
    TS.NUMRIFPARTCONT,
    TS.CODPAG,
    TS.DATADEC,
    TS.NOTE,
    TS.NRGIORNALE,
    TS.UTENTEMODIFICA,
    TS.DATAMODIFICA,
    TS.IDBOZZAAGT1,
    TS.IDBOZZAAGT2,
    TS.IDBOZZAAGT3,
    TS.NRRIGAAGT1,
    TS.NRRIGAAGT2,
    TS.NRRIGAAGT3,
    TS.DATASOLL1,
    TS.DATASOLL2,
    TS.DATASOLL3,
    TS.DATASOLL4,
    TS.DATASOLL5,
    TS.RIFSCADRIEMISSIONE,
    TS.FLAGCESSIONE,
    TS.ABI_RIEMISS,
    TS.CAB_RIEMISS,
    TS.RAGSOC_RIEMISS,
    TS.INDIRIZZO_RIEMISS,
    TS.CAP_RIEMISS,
    TS.LOCALITA_RIEMISS,
    TS.PROV_RIEMISS,
    TS.NAZ_RIEMISS,
    TS.NOTE_RIEMISS,
    TS.ESITOPRECRIEMISS,
    TS.DSCBANCARIEMISS,
    TS.DATAULTCALCINT,
    TS.STATOSCADENZA,
    TS.DATABLOCCO,
    TS.CODICECIG,
    TS.CODICECUP,
    TS.ESCLUDICALCPREMI,
    TS.PROGSCADANTICIPO,
    TS.IDTESTADOC,
    TS.IDTESTAPN,
    TS.FLGLIQSOSP,
    TS.CODCOMMESSA,
    TS.DATAVALUTA,
    (SELECT DESCRIZIONE FROM ESITI WHERE ESITO=TS.ESITOPRECRIEMISS) AS DSCESITOPRECRIEMISS,
    (CASE WHEN TS.ESITO<>5 THEN TS.ESITO ELSE TS.ESITOPRECRIEMISS END) AS ESITO_R,
    (SELECT DESCRIZIONE FROM ESITI WHERE ESITO=(CASE WHEN TS.ESITO<>5 THEN TS.ESITO ELSE TS.ESITOPRECRIEMISS END)) AS DSCESITO_R,
    TP.DESCRIZIONE AS DSCPAG,
    AB.CODCONTORIF AS CONTORIFBANCA,
    CFG.DSCCONTO1 AS DSCCONTO1,
    AC.DSCCONTO2 AS DSCCONTO2,
    AC.FAX,
    AB.DSCBANCA AS DSCBANCA,
    TE.DESCRIZIONE AS DSCTIPOEFFETTO,
    (CASE WHEN TS.SCADATTPASS=1 THEN 1 ELSE -1 END) AS SEGNOATTPASS,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)='F') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'F')) THEN(TS.IMPONIBSCLIT*-1) ELSE TS.IMPONIBSCLIT END) AS IMPONIBSCADLIT,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)='F') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'F')) THEN(TS.IMPONIBSCEURO*-1) ELSE TS.IMPONIBSCEURO END) AS IMPONIBSCADEURO,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)='F') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'F')) THEN(TS.IMPONIBSCVAL*-1) ELSE TS.IMPONIBSCVAL END) AS IMPONIBSCADVAL,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)='F') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'F')) THEN(TS.IMPORTOSCLIT*-1) ELSE TS.IMPORTOSCLIT END) AS IMPORTOSCADLIRE,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)='F') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'F')) THEN(TS.IMPORTOSCEURO*-1) ELSE TS.IMPORTOSCEURO END) AS IMPORTOSCADEURO,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)='F') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'F')) THEN(TS.IMPORTOSCVAL*-1) ELSE TS.IMPORTOSCVAL END) AS IMPORTOSCADVALUTA,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)='F') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'F')) THEN(TS.TOTFATTLIT*-1) ELSE TS.TOTFATTLIT END) AS TOTFATTURALIRE,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)='F') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'F')) THEN(TS.TOTFATTEURO*-1) ELSE TS.TOTFATTEURO END) AS TOTFATTURAEURO,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)='F') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'F')) THEN(TS.TOTFATTVAL*-1) ELSE TS.TOTFATTVAL END) AS TOTFATTURAVALUTA,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)='F') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'F')) THEN(TS.IMPFATTLIT*-1) ELSE TS.IMPFATTLIT END) AS IMPFATTURALIRE,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)='F') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'F')) THEN(TS.IMPFATTEURO*-1) ELSE TS.IMPFATTEURO END) AS IMPFATTURAEURO,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)='F') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'F')) THEN(TS.IMPFATTVAL*-1) ELSE TS.IMPFATTVAL END) AS IMPFATTURAVALUTA,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)='F') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'F')) THEN(TS.IMPPROVLIT1*-1) ELSE TS.IMPPROVLIT1 END) AS IMPPROVSGNLIRE1,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)='F') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'F')) THEN(TS.IMPPROVEURO1*-1) ELSE TS.IMPPROVEURO1 END) AS IMPPROVSGNEURO1,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)='F') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'F')) THEN(TS.IMPPROVVAL1*-1) ELSE TS.IMPPROVVAL1 END) AS IMPPROVSGNVALUTA1,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)='F') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'F')) THEN(TS.IMPPROVLIT2*-1) ELSE TS.IMPPROVLIT2 END) AS IMPPROVSGNLIRE2,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)='F') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'F')) THEN(TS.IMPPROVEURO2*-1) ELSE TS.IMPPROVEURO2 END) AS IMPPROVSGNEURO2,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)='F') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'F')) THEN(TS.IMPPROVVAL2*-1) ELSE TS.IMPPROVVAL2 END) AS IMPPROVSGNVALUTA2,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)='F') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'F')) THEN(TS.IMPPROVLIT3*-1) ELSE TS.IMPPROVLIT3 END) AS IMPPROVSGNLIRE3,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)='F') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'F')) THEN(TS.IMPPROVEURO3*-1) ELSE TS.IMPPROVEURO3 END) AS IMPPROVSGNEURO3,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)='F') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'F')) THEN(TS.IMPPROVVAL3*-1) ELSE TS.IMPPROVVAL3 END) AS IMPPROVSGNVALUTA3,
    AG1.DSCAGENTE AS DSCAGENTE1,
    AG2.DSCAGENTE AS DSCAGENTE2,
    AG3.DSCAGENTE AS DSCAGENTE3,
    AC.CODNAZIONE AS NAZIONE,
    AR.CODSETTORE AS SETTORE,
    AR.CODZONA AS ZONA,
    AR.CODCATEGORIA AS CATEGORIA,
    TE.TIPO AS DSCEFFETTO,
    ES.DESCRIZIONE AS DSCESITO,
    CFG.CODMASTRO AS CODMASTRO,
    SUBSTRING('Attivi Passivi',(1-SCADATTPASS)*7+1,7) AS DESSCADATTPASS,
    SUBSTRING('01-GEN02-FEB03-MAR04-APR05-MAG06-GIU07-LUG08-AGO09-SET10-OTT11-NOV12-DIC',((MONTH(DATASCADENZA))-1)*6+1,6) AS MESE,
    YEAR(DATASCADENZA) AS ANNO
    FROM 
        ((((((((((TABSCADENZE TS 
            LEFT OUTER JOIN ANAGRAFICACF AC          ON AC.CODCONTO=TS.CODCLIFOR)
            LEFT OUTER JOIN TABCFG CFG               ON CFG.CODCONTO=TS.CODCLIFOR)
            LEFT OUTER JOIN ANAGRAFICARISERVATICF AR ON AR.CODCONTO=TS.CODCLIFOR AND AR.ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB=CAST(USER_NAME() AS VARCHAR(25)))) 
        LEFT OUTER JOIN ANAGRAFICAAGENTI AG1     ON AG1.CODAGENTE=TS.CODAGE1)
        LEFT OUTER JOIN ANAGRAFICAAGENTI AG2     ON AG2.CODAGENTE=TS.CODAGE2)
        LEFT OUTER JOIN ANAGRAFICAAGENTI AG3     ON AG3.CODAGENTE=TS.CODAGE3)
        LEFT OUTER JOIN ANAGRAFICABANCHE AB      ON AB.CODBANCA=TS.BANCAINC)
        LEFT OUTER JOIN TIPIEFFETTI TE           ON TE.EFFETTO=TS.TIPOEFFETTO)
        LEFT OUTER JOIN TABPAGAMENTI TP          ON TP.CODICE=TS.CODPAG)
        LEFT OUTER JOIN ESITI ES                 ON ES.ESITO=TS.ESITO)


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTASCADENZE] TO [Metodo98]
    AS [dbo];

