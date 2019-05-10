﻿
CREATE VIEW VISTASCADENZEFLUSSI AS
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
  (CASE WHEN TS.NRDISTINTA <> 0 then (select CodBanca from distinteeffetti where Progressivo = TS.NrDISTINTA ) else ( TS.BANCAINC )  end ) as BANCAINC ,
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
    (SELECT DESCRIZIONE FROM TABPAGAMENTI WHERE TABPAGAMENTI.CODICE=TS.CODPAG) AS DSCPAG,
    (SELECT CODCONTORIF FROM ANAGRAFICABANCHE WHERE CODBANCA=TS.BANCAINC) AS CONTORIFBANCA,
    (CASE WHEN SUBSTRING(TS.CODCLIFOR,1,1)<>'G' THEN(SELECT DSCCONTO1 FROM ANAGRAFICACF WHERE CODCONTO=TS.CODCLIFOR) ELSE(SELECT DSCCONTO1 FROM ANAGRAFICAGENERICI WHERE CODCONTO=TS.CODCLIFOR) END) AS DSCCONTO1,
    (SELECT DSCBANCA FROM ANAGRAFICABANCHE WHERE CODBANCA=TS.BANCAINC) AS DSCBANCA,
    (SELECT DESCRIZIONE FROM TIPIEFFETTI WHERE EFFETTO=TS.TIPOEFFETTO) AS DSCTIPOEFFETTO,
    (CASE WHEN TS.SCADATTPASS=1 THEN 1 ELSE -1 END) AS SEGNOATTPASS,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'C') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)='C')) THEN(TS.IMPORTOSCLIT*-1) ELSE TS.IMPORTOSCLIT END) AS IMPORTOSCADLIRE,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'C') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)='C')) THEN(TS.IMPORTOSCEURO*-1) ELSE TS.IMPORTOSCEURO END) AS IMPORTOSCADEURO,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'C') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)='C')) THEN(TS.IMPORTOSCVAL*-1) ELSE TS.IMPORTOSCVAL END) AS IMPORTOSCADVALUTA,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'C') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)='C')) THEN(TS.TOTFATTLIT*-1) ELSE TS.TOTFATTLIT END) AS TOTFATTURALIRE,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'C') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)='C')) THEN(TS.TOTFATTEURO*-1) ELSE TS.TOTFATTEURO END) AS TOTFATTURAEURO,
    (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'C') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)='C')) THEN(TS.TOTFATTVAL*-1) ELSE TS.TOTFATTVAL END) AS TOTFATTURAVALUTA,
    (SELECT DSCAGENTE FROM ANAGRAFICAAGENTI WHERE CODAGENTE=CODAGE1) AS DSCAGENTE1,
    (SELECT DSCAGENTE FROM ANAGRAFICAAGENTI WHERE CODAGENTE=CODAGE2) AS DSCAGENTE2,
    (SELECT DSCAGENTE FROM ANAGRAFICAAGENTI WHERE CODAGENTE=CODAGE3) AS DSCAGENTE3,
    (SELECT CODNAZIONE FROM ANAGRAFICACF WHERE CODCONTO=TS.CODCLIFOR) AS NAZIONE,
    (SELECT CODSETTORE FROM ANAGRAFICARISERVATICF WHERE CODCONTO=TS.CODCLIFOR AND ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB=USER_NAME())) AS SETTORE,
    (SELECT CODZONA FROM ANAGRAFICARISERVATICF WHERE CODCONTO=TS.CODCLIFOR AND ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB=USER_NAME())) AS ZONA,
    (SELECT CODCATEGORIA FROM ANAGRAFICARISERVATICF WHERE CODCONTO=TS.CODCLIFOR AND ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB=USER_NAME())) AS CATEGORIA,
    (SELECT TIPO FROM TIPIEFFETTI WHERE EFFETTO=TS.TIPOEFFETTO) AS DSCEFFETTO,
    (SELECT DESCRIZIONE FROM ESITI WHERE ESITI.ESITO=TS.ESITO) AS DSCESITO,
      (select INTERESSIMORA from dbo.xINTERESSIMORA where xINTERESSIMORA.DAIMPORTOINSOLUTO <= TS.IMPORTOSCLIT and xINTERESSIMORA.AIMPORTOINSOLUTO >= TS.IMPORTOSCLIT) as IMPORTOMORA,
      (select IMPORTOSPESE from dbo.xSPESEINSOLUTO where xSPESEINSOLUTO.CODBANCA = BANCAINC and xSPESEINSOLUTO.DAIMPORTOINSOLUTO <= TS.IMPORTOSCLIT and xSPESEINSOLUTO.AIMPORTOINSOLUTO >= TS.IMPORTOSCLIT) as IMPORTOSPESE,
      (select INTERESSIMORAEURO from dbo.xINTERESSIMORA where xINTERESSIMORA.DAIMPORTOINSOLUTOEURO <= TS.IMPORTOSCEURO and xINTERESSIMORA.AIMPORTOINSOLUTOEURO >= TS.IMPORTOSCEURO) as IMPORTOMORAEURO,
      (select IMPORTOSPESEEURO from dbo.xSPESEINSOLUTO where xSPESEINSOLUTO.CODBANCA = BANCAINC and xSPESEINSOLUTO.DAIMPORTOINSOLUTOEURO <= TS.IMPORTOSCEURO and xSPESEINSOLUTO.AIMPORTOINSOLUTOEURO >= TS.IMPORTOSCEURO) as IMPORTOSPESEEURO,
    SUBSTRING('Attivi Passivi',(1-SCADATTPASS)*7+1,7) AS DESSCADATTPASS,
    SUBSTRING('01-GEN02-FEB03-MAR04-APR05-MAG06-GIU07-LUG08-AGO09-SET10-OTT11-NOV12-DIC',((MONTH(DATASCADENZA))-1)*6+1,6) AS MESE,
    YEAR(DATASCADENZA) AS ANNO
    FROM TABSCADENZE TS

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTASCADENZEFLUSSI] TO [Metodo98]
    AS [dbo];

