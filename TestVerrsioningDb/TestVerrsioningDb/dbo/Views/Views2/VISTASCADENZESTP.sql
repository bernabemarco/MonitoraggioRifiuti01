﻿CREATE VIEW VISTASCADENZESTP
  AS SELECT 1 AS TIPOREC,TABSCADENZE.PROGRESSIVO,
    TABSCADENZE.ESERCIZIO,
    TABSCADENZE.ANNODOC,
    TABSCADENZE.TIPODOC,
    TABSCADENZE.NUMDOC,
    TABSCADENZE.BIS,
    TABSCADENZE.NUMSCAD,
    TABSCADENZE.DATASCADENZA,
    TABSCADENZE.CODCLIFOR,
    TABSCADENZE.DATAFATTURA,
    TABSCADENZE.BANCAINC,
    TABSCADENZE.BANCAAPPOGGIO,
    TABSCADENZE.NUMRIF,
    TABSCADENZE.NUMEROPROT,
    TABSCADENZE.CODAGE1,
    TABSCADENZE.CODAGE2,
    TABSCADENZE.CODAGE3,
    TABSCADENZE.IMPPROVLIT1,
    TABSCADENZE.IMPPROVLIT2,
    TABSCADENZE.IMPPROVLIT3,
    TABSCADENZE.IMPPROVVAL1,
    TABSCADENZE.IMPPROVVAL2,
    TABSCADENZE.IMPPROVVAL3,
    TABSCADENZE.IMPPROVEURO1,
    TABSCADENZE.IMPPROVEURO2,
    TABSCADENZE.IMPPROVEURO3,
    TABSCADENZE.LIQPROV1,
    TABSCADENZE.LIQPROV2,TABSCADENZE.LIQPROV3,
    TABSCADENZE.IMPORTOSCLIT,
    TABSCADENZE.IMPORTOSCVAL,
    TABSCADENZE.IMPORTOSCEURO,TABSCADENZE.IMPONIBSCLIT,TABSCADENZE.IMPONIBSCVAL,
    TABSCADENZE.IMPONIBSCEURO,
    TABSCADENZE.TOTFATTLIT,
    TABSCADENZE.TOTFATTVAL,
    TABSCADENZE.TOTFATTEURO,
    TABSCADENZE.IMPFATTLIT,
    TABSCADENZE.IMPFATTVAL,
    TABSCADENZE.IMPFATTEURO,
    TABSCADENZE.FLAGCONT,TABSCADENZE.TIPOEFFETTO,
    TABSCADENZE.ESITO,
    TABSCADENZE.LIVSOLL,
    TABSCADENZE.LIQINS1,TABSCADENZE.LIQINS2,
    TABSCADENZE.LIQINS3,
    TABSCADENZE.CODCAMBIO,
    TABSCADENZE.VALCAMBIO,
    TABSCADENZE.NRDISTINTA,
    TABSCADENZE.NUMRAGGR,
    TABSCADENZE.DATAPAGEFF,
    TABSCADENZE.SCADATTPASS,
    TABSCADENZE.NUMRIFPARTCONT,TABSCADENZE.CODPAG,
    TABSCADENZE.DATADEC,
    TABSCADENZE.NOTE,
    TABSCADENZE.NRGIORNALE,
    TABSCADENZE.UTENTEMODIFICA,
    TABSCADENZE.DATAMODIFICA,
    (SELECT CODCONTORIF FROM ANAGRAFICABANCHE WHERE CODBANCA=BANCAINC) AS CONTORIFBANCA,
    (SELECT DSCCONTO1 FROM ANAGRAFICACF WHERE CODCONTO=CODCLIFOR) AS DSCCONTO1,
    (SELECT DSCBANCA FROM ANAGRAFICABANCHE WHERE CODBANCA=BANCAINC) AS DSCBANCA,
    (SELECT DSCAGENTE FROM ANAGRAFICAAGENTI WHERE CODAGENTE=CODAGE1) AS DSCAGENTE1,
    (SELECT DSCAGENTE FROM ANAGRAFICAAGENTI WHERE CODAGENTE=CODAGE2) AS DSCAGENTE2,
    (SELECT DSCAGENTE FROM ANAGRAFICAAGENTI WHERE CODAGENTE=CODAGE3) AS DSCAGENTE3,
    (SELECT TIPO FROM TIPIEFFETTI WHERE EFFETTO=TABSCADENZE.TIPOEFFETTO) AS DSCEFFETTO,
    (SELECT DESCRIZIONE FROM ESITI WHERE ESITI.ESITO=TABSCADENZE.ESITO) AS DSCESITO,
    (CASE WHEN ((SCADATTPASS<>0 AND SUBSTRING(CODCLIFOR,1,1)='F') OR(SCADATTPASS=0 AND SUBSTRING(CODCLIFOR,1,1)<>'F')) THEN(IMPORTOSCLIT*-1) ELSE IMPORTOSCLIT END) AS IMPORTOSCADLIRE,
    (CASE WHEN ((SCADATTPASS<>0 AND SUBSTRING(CODCLIFOR,1,1)='F') OR(SCADATTPASS=0 AND SUBSTRING(CODCLIFOR,1,1)<>'F')) THEN(IMPORTOSCEURO*-1) ELSE IMPORTOSCEURO END) AS IMPORTOSCADEURO,
    (CASE WHEN ((SCADATTPASS<>0 AND SUBSTRING(CODCLIFOR,1,1)='F') OR(SCADATTPASS=0 AND SUBSTRING(CODCLIFOR,1,1)<>'F')) THEN(IMPORTOSCVAL*-1) ELSE IMPORTOSCVAL END) AS IMPORTOSCADVALUTA,
    (SELECT CODNAZIONE FROM ANAGRAFICACF WHERE CODCONTO=CODCLIFOR) AS NAZIONE,
    (SELECT CODSETTORE FROM ANAGRAFICARISERVATICF WHERE CODCONTO=CODCLIFOR AND ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB=CAST(USER_NAME() AS VARCHAR(25)))) AS SETTORE,
    (SELECT CODZONA FROM ANAGRAFICARISERVATICF WHERE CODCONTO=CODCLIFOR AND ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB=CAST(USER_NAME() AS VARCHAR(25)))) AS ZONA,
    (SELECT CODCATEGORIA FROM ANAGRAFICARISERVATICF WHERE CODCONTO=CODCLIFOR AND ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB=CAST(USER_NAME() AS VARCHAR(25)))) AS CATEGORIA,
    (SELECT SALDO FROM VISTASALDOCONTIPN WHERE CONTO=CODCLIFOR AND ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB=CAST(USER_NAME() AS VARCHAR(25)))) AS SALDOPN,
    (SELECT SALDOVALUTA FROM VISTASALDOCONTIPN WHERE CONTO=CODCLIFOR AND ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB=CAST(USER_NAME() AS VARCHAR(25)))) AS SALDOPNVALUTA,
    (SELECT SALDOEURO FROM VISTASALDOCONTIPN WHERE CONTO=CODCLIFOR AND ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB=CAST(USER_NAME() AS VARCHAR(25)))) AS SALDOPNEURO,
    (SELECT SALDO FROM VISTASALDOCONTIPN WHERE CONTO=(SELECT CODCONTORIF FROM ANAGRAFICABANCHE WHERE CODBANCA=BANCAINC) AND ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB=CAST(USER_NAME() AS VARCHAR(25)))) AS SALDOBANCA,
    (SELECT SALDOVALUTA FROM VISTASALDOCONTIPN WHERE CONTO=(SELECT CODCONTORIF FROM ANAGRAFICABANCHE WHERE CODBANCA=BANCAINC) AND ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB=CAST(USER_NAME() AS VARCHAR(25)))) AS SALDOBANCAVALUTA,
    (SELECT SALDOEURO FROM VISTASALDOCONTIPN WHERE CONTO=(SELECT CODCONTORIF FROM ANAGRAFICABANCHE WHERE CODBANCA=BANCAINC) AND ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB=CAST(USER_NAME() AS VARCHAR(25)))) AS SALDOBANCAEURO
    FROM TABSCADENZE


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTASCADENZESTP] TO [Metodo98]
    AS [dbo];
