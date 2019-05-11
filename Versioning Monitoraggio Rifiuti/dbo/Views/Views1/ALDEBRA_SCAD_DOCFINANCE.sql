﻿




CREATE VIEW [dbo].[ALDEBRA_SCAD_DOCFINANCE]
AS
SELECT     dbo.ALDSPC(dbo.ALDTIPOPAG(dbo.TABSCADENZE.TIPOEFFETTO, dbo.TABSCADENZE.ESITO), 2) AS TIPOPAGAMENTO, 
                      dbo.ALDNUM(dbo.ALDSEGNOSCAD('C', dbo.TABSCADENZE.SCADATTPASS, dbo.TABSCADENZE.IMPORTOSCVAL), 1, 11, 3) AS IMPORTOSCVAL, 
                      dbo.ALDSPC
                          ((SELECT     DIVISA
                              FROM         TABCAMBI
                              WHERE     CODICE = dbo.TABSCADENZE.CODCAMBIO), 5) AS DIVISA, dbo.ALDNUM(dbo.TABSCADENZE.VALCAMBIO, 0, 5, 3) AS VALCAMBIO, 
                      dbo.ALDNUM(dbo.ALDSEGNOSCAD('C', dbo.TABSCADENZE.SCADATTPASS, dbo.TABSCADENZE.IMPORTOSCEURO), 1, 12, 2) AS IMPORTOSCEURO, 
                      dbo.ALDSPC('', 2) AS TIPODOCUMENTO, dbo.ALDSPC('1', 5) AS NRTITOLI, dbo.ALDSPC(dbo.EXTRACLIENTI.CodiceDeroga, 2) AS DEROGA, 
                      dbo.ALDDAT(dbo.TABSCADENZE.DATASCADENZA) AS DATASCADENZA, dbo.ALDDAT(DATEADD(day, CAST(ISNULL(dbo.EXTRACLIENTI.GIORNIRITARDO, 
                      0) AS INTEGER), dbo.TABSCADENZE.DATASCADENZA)) AS DATAVALUTA, dbo.ALDSPC(dbo.EXTRABANCHE.BANCA, 8) AS BANCA, 
                      dbo.ALDSPC(dbo.EXTRABANCHE.RBN, 4) AS RBN, dbo.ALDSPC(dbo.ALDBLOCCA(dbo.ANAGRAFICARISERVATICF.STATOCONTABILITA), 1) AS BLOCCATA,
                       dbo.ALDSPC(dbo.EXTRACLIENTI.CODICEVOCE, 6) AS VOCE, dbo.ALDSPC(dbo.ALDCLIFOR(dbo.TABSCADENZE.CODCLIFOR), 16) AS PDC, 
                      dbo.ALDSPC(dbo.ANAGRAFICACF.DSCCONTO1, 40) AS DESCRIZIONE, dbo.ALDSPC(RIGHT(dbo.BANCAAPPCF.ABI, 5), 5) AS ABI, 
                      dbo.ALDSPC(RIGHT(dbo.BANCAAPPCF.CAB, 5), 5) AS CAB, dbo.ALDSPC('', 10) AS CC, dbo.ALDSPC('CO', 2) AS PROVENIENZA, 
					  dbo.ALDSPC(REPLACE(TABSCADENZE.CODAGE1,' ' ,''),6) AS AGENTE, 
					  dbo.ALDNUM(0, 0, 5, 3) AS CAMBIO, dbo.ALDSPC(LEFT(dbo.TABSCADENZE.NUMRIFPARTCONT, 4) 
                      + RIGHT(dbo.TABSCADENZE.NUMRIFPARTCONT, 8), 12) AS DOCORIGINE, dbo.ALDSPC('S' +
                          (SELECT     AZIENDA
                            FROM          ALDEBRA_DatiStandard) + CAST(dbo.TABSCADENZE.PROGRESSIVO AS VARCHAR(16)), 26) AS COGE, dbo.ALDSPC
                          ((SELECT     AZIENDA
                              FROM         ALDEBRA_DatiStandard), 10) AS AZIENDA, dbo.ALDSPC('', 1) AS RAGREFF, dbo.ALDSPC(dbo.BANCAAPPCF.CONTOCORRENTE, 12) 
                      AS NCC, dbo.ALDSPC(dbo.BANCAAPPCF.CIN, 1) AS CINNCC, dbo.ALDSPC('', 16) AS PDCPAG, dbo.ALDSPC(LEFT(dbo.BANCAAPPCF.CODICEIBAN, 2), 2) 
                      AS PAESE, dbo.ALDSPC(SUBSTRING(dbo.BANCAAPPCF.CODICEIBAN, 3, 2), 2) AS CHECKDIGIT, 
                      dbo.ALDSPC(dbo.ALDDAT(dbo.TABSCADENZE.DATAFATTURA), 8) AS DATADOC, dbo.ALDSPC('CIG:'+dbo.TABSCADENZE.CODICECIG+' - CUP:'+dbo.TABSCADENZE.CODICECUP, 80) AS NOTE, 
                      dbo.ALDSPC(dbo.BANCAAPPCF.CODICEBIC, 11) AS BIC, dbo.ALDSPC(dbo.BANCAAPPCF.CODICEIBAN, 34) AS IBAN
FROM         dbo.TABSCADENZE LEFT OUTER JOIN
                      dbo.EXTRABANCHE ON dbo.TABSCADENZE.BANCAINC = dbo.EXTRABANCHE.CODBANCA LEFT OUTER JOIN
                      dbo.BANCAAPPCF ON dbo.TABSCADENZE.BANCAAPPOGGIO = dbo.BANCAAPPCF.CODICE AND 
                      dbo.TABSCADENZE.CODCLIFOR = dbo.BANCAAPPCF.CODCONTO LEFT OUTER JOIN
                      dbo.EXTRACLIENTI ON dbo.TABSCADENZE.CODCLIFOR = dbo.EXTRACLIENTI.CODCONTO LEFT OUTER JOIN
                      dbo.ANAGRAFICACF ON dbo.TABSCADENZE.CODCLIFOR = dbo.ANAGRAFICACF.CODCONTO LEFT OUTER JOIN
                      dbo.ANAGRAFICARISERVATICF ON dbo.TABSCADENZE.CODCLIFOR = dbo.ANAGRAFICARISERVATICF.CODCONTO AND 
                      dbo.TABSCADENZE.ESERCIZIO = dbo.ANAGRAFICARISERVATICF.ESERCIZIO LEFT OUTER JOIN
                      dbo.PARAMETRIDOC ON dbo.TABSCADENZE.TIPODOC = dbo.PARAMETRIDOC.CODICE
WHERE     LEFT(dbo.TABSCADENZE.CODCLIFOR, 1) = 'C' AND dbo.TABSCADENZE.ESITO IN (0, 3)
UNION
SELECT     dbo.ALDSPC(dbo.ALDTIPOPAG(dbo.TABSCADENZE.TIPOEFFETTO, dbo.TABSCADENZE.ESITO), 2) AS TIPOPAGAMENTO, 
                      dbo.ALDNUM(dbo.ALDSEGNOSCAD('F', dbo.TABSCADENZE.SCADATTPASS, dbo.TABSCADENZE.IMPORTOSCVAL), 1, 11, 3) AS IMPORTOSCVAL, 
                      dbo.ALDSPC
                          ((SELECT     DIVISA
                              FROM         TABCAMBI
                              WHERE     CODICE = dbo.TABSCADENZE.CODCAMBIO), 5) AS DIVISA, dbo.ALDNUM(dbo.TABSCADENZE.VALCAMBIO, 0, 5, 3) AS VALCAMBIO, 
                      dbo.ALDNUM(dbo.ALDSEGNOSCAD('F', dbo.TABSCADENZE.SCADATTPASS, dbo.TABSCADENZE.IMPORTOSCEURO), 1, 12, 2) AS IMPORTOSCEURO, 
                      dbo.ALDSPC('', 2) AS TIPODOCUMENTO, dbo.ALDSPC('1', 5) AS NRTITOLI, dbo.ALDSPC(dbo.EXTRAFORNITORI.CodiceDeroga, 2) AS DEROGA, 
                      dbo.ALDDAT(dbo.TABSCADENZE.DATASCADENZA) AS DATASCADENZA, dbo.ALDDAT(DATEADD(day, 
                      CAST(ISNULL(dbo.EXTRAFORNITORI.GIORNIRITARDO, 0) AS INTEGER), dbo.TABSCADENZE.DATASCADENZA)) AS DATAVALUTA, 
                      dbo.ALDSPC(dbo.EXTRABANCHE.BANCA, 8) AS BANCA, dbo.ALDSPC(dbo.EXTRABANCHE.RBN, 4) AS RBN, 
                      dbo.ALDSPC(dbo.ALDBLOCCA(dbo.ANAGRAFICARISERVATICF.STATOCONTABILITA), 1) AS BLOCCATA, 
                      dbo.ALDSPC(dbo.EXTRAFORNITORI.CODICEVOCE, 6) AS VOCE, dbo.ALDSPC(dbo.ALDCLIFOR(dbo.TABSCADENZE.CODCLIFOR), 16) AS PDC, 
                      dbo.ALDSPC(dbo.ANAGRAFICACF.DSCCONTO1, 40) AS DESCRIZIONE, dbo.ALDSPC(RIGHT(dbo.BANCAAPPCF.ABI, 5), 5) AS ABI, 
                      dbo.ALDSPC(RIGHT(dbo.BANCAAPPCF.CAB, 5), 5) AS CAB, dbo.ALDSPC('', 10) AS CC, dbo.ALDSPC('CO', 2) AS PROVENIENZA, dbo.ALDSPC('', 6) 
                      AS AGENTE, dbo.ALDNUM(0, 0, 5, 3) AS CAMBIO, dbo.ALDSPC(LEFT(dbo.TABSCADENZE.NUMRIFPARTCONT, 4) 
                      + RIGHT(dbo.TABSCADENZE.NUMRIFPARTCONT, 8), 12) AS DOCORIGINE, dbo.ALDSPC('S' +
                          (SELECT     AZIENDA
                            FROM          ALDEBRA_DatiStandard) + CAST(dbo.TABSCADENZE.PROGRESSIVO AS VARCHAR(16)), 26) AS COGE, dbo.ALDSPC
                          ((SELECT     AZIENDA
                              FROM         ALDEBRA_DatiStandard), 10) AS AZIENDA, dbo.ALDSPC('', 1) AS RAGREFF, dbo.ALDSPC(dbo.BANCAAPPCF.CONTOCORRENTE, 12) 
                      AS NCC, dbo.ALDSPC(dbo.BANCAAPPCF.CIN, 1) AS CINNCC, dbo.ALDSPC('', 16) AS PDCPAG, dbo.ALDSPC(LEFT(dbo.BANCAAPPCF.CODICEIBAN, 2), 2) 
                      AS PAESE, dbo.ALDSPC(SUBSTRING(dbo.BANCAAPPCF.CODICEIBAN, 3, 2), 2) AS CHECKDIGIT, 
                      dbo.ALDSPC(dbo.ALDDAT(dbo.TABSCADENZE.DATAFATTURA), 8) AS DATADOC, dbo.ALDSPC('CIG:'+dbo.TABSCADENZE.CODICECIG+' - CUP:'+dbo.TABSCADENZE.CODICECUP, 80) AS NOTE, 
                      dbo.ALDSPC(dbo.BANCAAPPCF.CODICEBIC, 11) AS BIC, dbo.ALDSPC(dbo.BANCAAPPCF.CODICEIBAN, 34) AS IBAN
FROM         dbo.TABSCADENZE LEFT OUTER JOIN
                      dbo.EXTRABANCHE ON dbo.TABSCADENZE.BANCAINC = dbo.EXTRABANCHE.CODBANCA LEFT OUTER JOIN
                      dbo.BANCAAPPCF ON dbo.TABSCADENZE.BANCAAPPOGGIO = dbo.BANCAAPPCF.CODICE AND 
                      dbo.TABSCADENZE.CODCLIFOR = dbo.BANCAAPPCF.CODCONTO LEFT OUTER JOIN
                      dbo.EXTRAFORNITORI ON dbo.TABSCADENZE.CODCLIFOR = dbo.EXTRAFORNITORI.CODCONTO LEFT OUTER JOIN
                      dbo.ANAGRAFICACF ON dbo.TABSCADENZE.CODCLIFOR = dbo.ANAGRAFICACF.CODCONTO LEFT OUTER JOIN
                      dbo.ANAGRAFICARISERVATICF ON dbo.TABSCADENZE.CODCLIFOR = dbo.ANAGRAFICARISERVATICF.CODCONTO AND 
                      dbo.TABSCADENZE.ESERCIZIO = dbo.ANAGRAFICARISERVATICF.ESERCIZIO LEFT OUTER JOIN
                      dbo.PARAMETRIDOC ON dbo.TABSCADENZE.TIPODOC = dbo.PARAMETRIDOC.CODICE
WHERE     LEFT(dbo.TABSCADENZE.CODCLIFOR, 1) = 'F' AND dbo.TABSCADENZE.ESITO IN (0, 3)
UNION
SELECT     dbo.ALDSPC(dbo.ALDTIPOPAG(dbo.SCADENZEPREVISIONALI.TIPOEFFETTO, dbo.SCADENZEPREVISIONALI.ESITO), 2) AS TIPOPAGAMENTO, 
                      dbo.ALDNUM(dbo.ALDSEGNOSCAD('C', dbo.SCADENZEPREVISIONALI.SCADATTPASS, dbo.SCADENZEPREVISIONALI.IMPORTOSCVAL), 1, 11, 3) 
                      AS IMPORTOSCVAL, dbo.ALDSPC
                          ((SELECT     DIVISA
                              FROM         TABCAMBI
                              WHERE     CODICE = dbo.SCADENZEPREVISIONALI.CODCAMBIO), 5) AS DIVISA, dbo.ALDNUM(dbo.SCADENZEPREVISIONALI.VALCAMBIO, 0, 5, 3) 
                      AS VALCAMBIO, dbo.ALDNUM(dbo.ALDSEGNOSCAD('C', dbo.SCADENZEPREVISIONALI.SCADATTPASS, 
                      dbo.SCADENZEPREVISIONALI.IMPORTOSCEURO), 1, 12, 2) AS IMPORTOSCEURO, dbo.ALDSPC('', 2) AS TIPODOCUMENTO, dbo.ALDSPC('1', 5) 
                      AS NRTITOLI, dbo.ALDSPC(dbo.EXTRACLIENTI.CodiceDeroga, 2) AS DEROGA, dbo.ALDDAT(dbo.SCADENZEPREVISIONALI.DATASCADENZA) 
                      AS DATASCADENZA, dbo.ALDDAT(DATEADD(day, CAST(ISNULL(dbo.EXTRACLIENTI.GIORNIRITARDO, 0) AS INTEGER), 
                      dbo.SCADENZEPREVISIONALI.DATASCADENZA)) AS DATAVALUTA, dbo.ALDSPC(dbo.EXTRABANCHE.BANCA, 8) AS BANCA, 
                      dbo.ALDSPC(dbo.EXTRABANCHE.RBN, 4) AS RBN, dbo.ALDSPC(dbo.ALDBLOCCA(dbo.ANAGRAFICARISERVATICF.STATOCONTABILITA), 1) AS BLOCCATA,
                       dbo.ALDSPC(dbo.EXTRACLIENTI.CODICEVOCE, 6) AS VOCE, dbo.ALDSPC(dbo.ALDCLIFOR(dbo.SCADENZEPREVISIONALI.CODCLIFOR), 16) AS PDC, 
                      dbo.ALDSPC(dbo.ANAGRAFICACF.DSCCONTO1, 40) AS DESCRIZIONE, dbo.ALDSPC(RIGHT(dbo.BANCAAPPCF.ABI, 5), 5) AS ABI, 
                      dbo.ALDSPC(RIGHT(dbo.BANCAAPPCF.CAB, 5), 5) AS CAB, dbo.ALDSPC('', 10) AS CC, dbo.ALDSPC(dbo.ALDDOC(parametridoc.tipo), 2) 
                      AS PROVENIENZA,DBO.ALDSPC(REPLACE(SCADENZEPREVISIONALI.CODAGE1,' ' ,''),6) AS AGENTE, 
					  dbo.ALDNUM(0, 0, 5, 3) AS CAMBIO, 
                      dbo.ALDSPC(LEFT(dbo.SCADENZEPREVISIONALI.NUMRIFPARTCONT, 4) + RIGHT(dbo.SCADENZEPREVISIONALI.NUMRIFPARTCONT, 8), 12) 
                      AS DOCORIGINE, dbo.ALDSPC('P' +
                          (SELECT     AZIENDA
                            FROM          ALDEBRA_DatiStandard) + CAST(dbo.SCADENZEPREVISIONALI.PROGRESSIVO AS VARCHAR(16)), 26) AS COGE, dbo.ALDSPC
                          ((SELECT     AZIENDA
                              FROM         ALDEBRA_DatiStandard), 10) AS AZIENDA, dbo.ALDSPC('', 1) AS RAGREFF, dbo.ALDSPC(dbo.BANCAAPPCF.CONTOCORRENTE, 12) 
                      AS NCC, dbo.ALDSPC(dbo.BANCAAPPCF.CIN, 1) AS CINNCC, dbo.ALDSPC('', 16) AS PDCPAG, dbo.ALDSPC('', 2) AS PAESE, dbo.ALDSPC('', 2) 
                      AS CHECKDIGIT, dbo.ALDSPC(dbo.ALDDAT(dbo.SCADENZEPREVISIONALI.DATAFATTURA), 8) AS DATADOC, dbo.ALDSPC('CIG:'+dbo.SCADENZEPREVISIONALI.CODICECIG+' - CUP:'+dbo.SCADENZEPREVISIONALI.CODICECUP, 80) AS NOTE, 
                      dbo.ALDSPC(dbo.BANCAAPPCF.CODICEBIC, 11) AS BIC, dbo.ALDSPC(dbo.BANCAAPPCF.CODICEIBAN, 34) AS IBAN
FROM         dbo.SCADENZEPREVISIONALI LEFT OUTER JOIN
                      dbo.EXTRABANCHE ON dbo.SCADENZEPREVISIONALI.BANCAINC = dbo.EXTRABANCHE.CODBANCA LEFT OUTER JOIN
                      dbo.BANCAAPPCF ON dbo.SCADENZEPREVISIONALI.BANCAAPPOGGIO = dbo.BANCAAPPCF.CODICE AND 
                      dbo.SCADENZEPREVISIONALI.CODCLIFOR = dbo.BANCAAPPCF.CODCONTO LEFT OUTER JOIN
                      dbo.EXTRACLIENTI ON dbo.SCADENZEPREVISIONALI.CODCLIFOR = dbo.EXTRACLIENTI.CODCONTO LEFT OUTER JOIN
                      dbo.ANAGRAFICACF ON dbo.SCADENZEPREVISIONALI.CODCLIFOR = dbo.ANAGRAFICACF.CODCONTO LEFT OUTER JOIN
                      dbo.ANAGRAFICARISERVATICF ON dbo.SCADENZEPREVISIONALI.CODCLIFOR = dbo.ANAGRAFICARISERVATICF.CODCONTO AND 
                      dbo.SCADENZEPREVISIONALI.ESERCIZIO = dbo.ANAGRAFICARISERVATICF.ESERCIZIO LEFT OUTER JOIN
                      dbo.PARAMETRIDOC ON dbo.SCADENZEPREVISIONALI.TIPODOC = dbo.PARAMETRIDOC.CODICE
WHERE     LEFT(dbo.SCADENZEPREVISIONALI.CODCLIFOR, 1) = 'C'
UNION
SELECT     dbo.ALDSPC(dbo.ALDTIPOPAG(dbo.SCADENZEPREVISIONALI.TIPOEFFETTO, dbo.SCADENZEPREVISIONALI.ESITO), 2) AS TIPOPAGAMENTO, 
                      dbo.ALDNUM(dbo.ALDSEGNOSCAD('F', dbo.SCADENZEPREVISIONALI.SCADATTPASS, dbo.SCADENZEPREVISIONALI.IMPORTOSCVAL), 1, 11, 3) 
                      AS IMPORTOSCVAL, dbo.ALDSPC
                          ((SELECT     DIVISA
                              FROM         TABCAMBI
                              WHERE     CODICE = dbo.SCADENZEPREVISIONALI.CODCAMBIO), 5) AS DIVISA, dbo.ALDNUM(dbo.SCADENZEPREVISIONALI.VALCAMBIO, 0, 5, 3) 
                      AS VALCAMBIO, dbo.ALDNUM(dbo.ALDSEGNOSCAD('F', dbo.SCADENZEPREVISIONALI.SCADATTPASS, 
                      dbo.SCADENZEPREVISIONALI.IMPORTOSCEURO), 1, 12, 2) AS IMPORTOSCEURO, dbo.ALDSPC('', 2) AS TIPODOCUMENTO, dbo.ALDSPC('1', 5) 
                      AS NRTITOLI, dbo.ALDSPC(dbo.EXTRAFORNITORI.CodiceDeroga, 2) AS DEROGA, dbo.ALDDAT(dbo.SCADENZEPREVISIONALI.DATASCADENZA) 
                      AS DATASCADENZA, dbo.ALDDAT(DATEADD(day, CAST(ISNULL(dbo.EXTRAFORNITORI.GIORNIRITARDO, 0) AS INTEGER), 
                      dbo.SCADENZEPREVISIONALI.DATASCADENZA)) AS DATAVALUTA, dbo.ALDSPC(dbo.EXTRABANCHE.BANCA, 8) AS BANCA, 
                      dbo.ALDSPC(dbo.EXTRABANCHE.RBN, 4) AS RBN, dbo.ALDSPC(dbo.ALDBLOCCA(dbo.ANAGRAFICARISERVATICF.STATOCONTABILITA), 1) AS BLOCCATA,
                       dbo.ALDSPC(dbo.EXTRAFORNITORI.CODICEVOCE, 6) AS VOCE, dbo.ALDSPC(dbo.ALDCLIFOR(dbo.SCADENZEPREVISIONALI.CODCLIFOR), 16) AS PDC, 
                      dbo.ALDSPC(dbo.ANAGRAFICACF.DSCCONTO1, 40) AS DESCRIZIONE, dbo.ALDSPC(RIGHT(dbo.BANCAAPPCF.ABI, 5), 5) AS ABI, 
                      dbo.ALDSPC(RIGHT(dbo.BANCAAPPCF.CAB, 5), 5) AS CAB, dbo.ALDSPC('', 10) AS CC, dbo.ALDSPC(dbo.ALDDOC(parametridoc.tipo), 2) 
                      AS PROVENIENZA, dbo.ALDSPC('', 6) AS AGENTE, dbo.ALDNUM(0, 0, 5, 3) AS CAMBIO, 
                      dbo.ALDSPC(LEFT(dbo.SCADENZEPREVISIONALI.NUMRIFPARTCONT, 4) + RIGHT(dbo.SCADENZEPREVISIONALI.NUMRIFPARTCONT, 8), 12) 
                      AS DOCORIGINE, dbo.ALDSPC('P' +
                          (SELECT     AZIENDA
                            FROM          ALDEBRA_DatiStandard) + CAST(dbo.SCADENZEPREVISIONALI.PROGRESSIVO AS VARCHAR(16)), 26) AS COGE, dbo.ALDSPC
                          ((SELECT     AZIENDA
                              FROM         ALDEBRA_DatiStandard), 10) AS AZIENDA, dbo.ALDSPC('', 1) AS RAGREFF, dbo.ALDSPC(dbo.BANCAAPPCF.CONTOCORRENTE, 12) 
                      AS NCC, dbo.ALDSPC(dbo.BANCAAPPCF.CIN, 1) AS CINNCC, dbo.ALDSPC('', 16) AS PDCPAG, dbo.ALDSPC('', 2) AS PAESE, dbo.ALDSPC('', 2) 
                      AS CHECKDIGIT, dbo.ALDSPC(dbo.ALDDAT(dbo.SCADENZEPREVISIONALI.DATAFATTURA), 8) AS DATADOC, dbo.ALDSPC('CIG:'+dbo.SCADENZEPREVISIONALI.CODICECIG+' - CUP:'+dbo.SCADENZEPREVISIONALI.CODICECUP, 80) AS NOTE, 
                      dbo.ALDSPC(dbo.BANCAAPPCF.CODICEBIC, 11) AS BIC, dbo.ALDSPC(dbo.BANCAAPPCF.CODICEIBAN, 34) AS IBAN
FROM         dbo.SCADENZEPREVISIONALI LEFT OUTER JOIN
                      dbo.EXTRABANCHE ON dbo.SCADENZEPREVISIONALI.BANCAINC = dbo.EXTRABANCHE.CODBANCA LEFT OUTER JOIN
                      dbo.BANCAAPPCF ON dbo.SCADENZEPREVISIONALI.BANCAAPPOGGIO = dbo.BANCAAPPCF.CODICE AND 
                      dbo.SCADENZEPREVISIONALI.CODCLIFOR = dbo.BANCAAPPCF.CODCONTO LEFT OUTER JOIN
                      dbo.EXTRAFORNITORI ON dbo.SCADENZEPREVISIONALI.CODCLIFOR = dbo.EXTRAFORNITORI.CODCONTO LEFT OUTER JOIN
                      dbo.ANAGRAFICACF ON dbo.SCADENZEPREVISIONALI.CODCLIFOR = dbo.ANAGRAFICACF.CODCONTO LEFT OUTER JOIN
                      dbo.ANAGRAFICARISERVATICF ON dbo.SCADENZEPREVISIONALI.CODCLIFOR = dbo.ANAGRAFICARISERVATICF.CODCONTO AND 
                      dbo.SCADENZEPREVISIONALI.ESERCIZIO = dbo.ANAGRAFICARISERVATICF.ESERCIZIO LEFT OUTER JOIN
                      dbo.PARAMETRIDOC ON dbo.SCADENZEPREVISIONALI.TIPODOC = dbo.PARAMETRIDOC.CODICE
WHERE     LEFT(dbo.SCADENZEPREVISIONALI.CODCLIFOR, 1) = 'F'






GO
GRANT SELECT
    ON OBJECT::[dbo].[ALDEBRA_SCAD_DOCFINANCE] TO [Metodo98]
    AS [dbo];
