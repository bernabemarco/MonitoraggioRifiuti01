CREATE VIEW dbo.BRIOVISTASCADENZEALL
AS
SELECT     TIPOSCADENZA = 1, TS .ESERCIZIO, TS .ANNODOC, STR(MONTH(TS.DATAFATTURA), 2, 0) + ' - ' + DATENAME(MM, TS.DATAFATTURA) AS MESEDOC,{ fn WEEK(TS.DATAFATTURA) 
                      } AS SETTDOC, TS .TIPODOC, TS .NUMDOC, TS .NUMRIF, TS .DATAFATTURA, TS .NUMEROPROT, 
                      TS .TIPOEFFETTO, TS .ESITO, SUBSTRING('Attivi Passivi', (1 - SCADATTPASS) * 7 + 1, 7) AS DESSCADATTPASS,
                      TS .DATASCADENZA,
                      YEAR(TS.DATASCADENZA) AS ANNOSCAD,
                      STR(MONTH(TS.DATASCADENZA), 2, 0) + ' - ' + DATENAME(MM, TS.DATASCADENZA) AS MESESCAD,
                      { fn WEEK(TS.DATASCADENZA) } AS SETTSCAD,
                      ISNULL (TS .DATAPAGEFF, (select (CASE WHEN (datediff (dd, ts.datascadenza, getdate()) < 0) then ts.datascadenza else getdate() END))) AS DATAPAGEFF,
                       YEAR(( ISNULL (TS .DATAPAGEFF, (select (CASE WHEN (datediff (dd, ts.datascadenza, getdate()) < 0) then ts.datascadenza else getdate() END))))) AS ANNOPAGEFF,
                      STR(MONTH(( ISNULL (TS .DATAPAGEFF, (select (CASE WHEN (datediff (dd, ts.datascadenza, getdate()) < 0) then ts.datascadenza else getdate() END))))), 2, 0) + ' - ' + DATENAME(MM, ( ISNULL (TS .DATAPAGEFF, (select (CASE WHEN (datediff (dd, ts.datascadenza, getdate()) < 0) then ts.datascadenza else getdate() END))))) AS MESEPAGEFF,
                      { fn WEEK(( ISNULL (TS .DATAPAGEFF, (select (CASE WHEN (datediff (dd, ts.datascadenza, getdate()) < 0) then ts.datascadenza else getdate() END))))) } AS SETTPAGEFF,
                       TS .BANCAINC, TS .NRDISTINTA, TS .CODCLIFOR, TS .FLAGCONT, TS .CODCAMBIO, 
                          (SELECT     CODNAZIONE
                            FROM          ANAGRAFICACF
                            WHERE      ANAGRAFICACF.CODCONTO = TS .CODCLIFOR) AS NAZIONE,
                          (SELECT     CODSETTORE
                            FROM          ANAGRAFICARISERVATICF
                            WHERE      ANAGRAFICARISERVATICF.CODCONTO = TS .CODCLIFOR AND ESERCIZIO =
                                                       (SELECT     MAX(Codice)
                                                         FROM          TABEsercizi)) AS CODSETTORE,
                          (SELECT     CODZONA
                            FROM          ANAGRAFICARISERVATICF
                            WHERE      ANAGRAFICARISERVATICF.CODCONTO = TS .CODCLIFOR AND ESERCIZIO =
                                                       (SELECT     MAX(Codice)
                                                         FROM          TABEsercizi)) AS CODZONA,
                          (SELECT     CODCATEGORIA
                            FROM          ANAGRAFICARISERVATICF
                            WHERE      ANAGRAFICARISERVATICF.CODCONTO = TS .CODCLIFOR AND ESERCIZIO =
                                                       (SELECT     MAX(Codice)
                                                         FROM          TABEsercizi)) AS CODCATEGORIACF, TS .CODAGE1, TS .CODAGE2, TS .CODAGE3, (CASE WHEN ((TS .SCADATTPASS <> 0 AND
                       SUBSTRING(TS .CODCLIFOR, 1, 1) <> 'C') OR
                      (TS .SCADATTPASS = 0 AND SUBSTRING(TS .CODCLIFOR, 1, 1) = 'C')) THEN (TS .IMPPROVEURO1 * - 1) ELSE TS .IMPPROVEURO1 END) 
                      AS IMPPROVEURO1, (CASE WHEN ((TS .SCADATTPASS = 0 AND SUBSTRING(TS .CODCLIFOR, 1, 1) <> 'C') OR
                      (TS .SCADATTPASS = 0 AND SUBSTRING(TS .CODCLIFOR, 1, 1) = 'C')) THEN (TS .IMPPROVEURO2 * - 1) ELSE TS .IMPPROVEURO2 END) 
                      AS IMPPROVEURO2, (CASE WHEN ((TS .SCADATTPASS = 0 AND SUBSTRING(TS .CODCLIFOR, 1, 1) <> 'C') OR
                      (TS .SCADATTPASS = 0 AND SUBSTRING(TS .CODCLIFOR, 1, 1) = 'C')) THEN (TS .IMPPROVEURO3 * - 1) ELSE TS .IMPPROVEURO3 END) 
                      AS IMPPROVEURO3, (CASE WHEN ((TS .SCADATTPASS = 0 AND SUBSTRING(TS .CODCLIFOR, 1, 1) <> 'C') OR
                      (TS .SCADATTPASS = 0 AND SUBSTRING(TS .CODCLIFOR, 1, 1) = 'C')) THEN (TS .IMPORTOSCEURO * - 1) ELSE TS .IMPORTOSCEURO END) 
                      AS IMPORTOSCADEURO, (CASE WHEN ((TS .SCADATTPASS = 0 AND SUBSTRING(TS .CODCLIFOR, 1, 1) <> 'C') OR
                      (TS .SCADATTPASS = 0 AND SUBSTRING(TS .CODCLIFOR, 1, 1) = 'C')) THEN (TS .TOTFATTEURO * - 1) ELSE TS .TOTFATTEURO END) 
                      AS TOTFATTURAEURO,
                      (CASE WHEN ((TS .SCADATTPASS = 0 AND SUBSTRING(TS .CODCLIFOR, 1, 1) <> 'C') OR
                      (TS .SCADATTPASS = 0 AND SUBSTRING(TS .CODCLIFOR, 1, 1) = 'C')) THEN (TS .IMPORTOSCVAL * - 1) ELSE TS .IMPORTOSCVAL END) 
                      AS IMPORTOSCVAL,
                      (CASE WHEN ((TS .SCADATTPASS = 0 AND SUBSTRING(TS .CODCLIFOR, 1, 1) <> 'C') OR
                      (TS .SCADATTPASS = 0 AND SUBSTRING(TS .CODCLIFOR, 1, 1) = 'C')) THEN (TS .IMPFATTVAL *  - 1) ELSE TS .IMPFATTVAL END) 
                      AS IMPFATTVAL

FROM         TABSCADENZE TS
WHERE NUMSCAD<>-1
UNION ALL
SELECT     TIPOSCADENZA = 2, SP.ESERCIZIO, SP.ANNODOC, STR(MONTH(SP.DATAFATTURA), 2, 0) + ' - ' + DATENAME(MM, SP.DATAFATTURA) AS MESEDOC,{ fn WEEK(SP.DATAFATTURA) 
                      } AS SETTDOC, SP.TIPODOC, SP.NUMDOC, SP.NUMRIF, SP.DATAFATTURA, SP.NUMEROPROT, SP.TIPOEFFETTO, 
                      SP.ESITO, SUBSTRING('Attivi Passivi', (1 - SCADATTPASS) * 7 + 1, 7) AS DESSCADATTPASS, SP.DATASCADENZA, YEAR(SP.DATASCADENZA) AS ANNOSCAD, 
                       STR(MONTH(SP.DATASCADENZA), 2, 0) + ' - ' + DATENAME(MM, SP.DATASCADENZA) AS MESESCAD,
                      { fn WEEK(SP.DATASCADENZA) } AS SETTSCAD,
                      ISNULL (SP .DATAPAGEFF, (select (CASE WHEN (datediff (dd, SP.DATASCADENZA, getdate()) < 0) then SP.DATASCADENZA else getdate() END))) AS DATAPAGEFF,
                      YEAR(( ISNULL (SP .DATAPAGEFF, (select (CASE WHEN (datediff (dd, SP.DATASCADENZA, getdate()) < 0) then SP.DATASCADENZA else getdate() END))))) AS ANNOPAGEFF,
                      STR(MONTH(( ISNULL (SP .DATAPAGEFF, (select (CASE WHEN (datediff (dd, SP.DATASCADENZA, getdate()) < 0) then SP.DATASCADENZA else getdate() END))))), 2, 0) + ' - ' + DATENAME(MM, ( ISNULL (SP .DATAPAGEFF, (select (CASE WHEN (datediff (dd, SP.DATASCADENZA, getdate()) < 0) then SP.DATASCADENZA else getdate() END))))) AS MESEPAGEFF,
                      { fn WEEK(( ISNULL (SP .DATAPAGEFF, (select (CASE WHEN (datediff (dd, SP.DATASCADENZA, getdate()) < 0) then SP.DATASCADENZA else getdate() END))))) } AS SETTPAGEFF,
                      SP.BANCAINC, 
                      SP.NRDISTINTA, SP.CODCLIFOR, SP.FLAGCONT, SP.CODCAMBIO, 
                          (SELECT     CODNAZIONE
                            FROM          ANAGRAFICACF
                            WHERE      ANAGRAFICACF.CODCONTO = SP.CODCLIFOR) AS NAZIONE,
                          (SELECT     CODSETTORE
                            FROM          ANAGRAFICARISERVATICF
                            WHERE      ANAGRAFICARISERVATICF.CODCONTO = SP.CODCLIFOR AND ESERCIZIO =
                                                       (SELECT     MAX(Codice)
                                                         FROM          TABEsercizi)) AS CODSETTORE,
                          (SELECT     CODZONA
                            FROM          ANAGRAFICARISERVATICF
                            WHERE      ANAGRAFICARISERVATICF.CODCONTO = SP.CODCLIFOR AND ESERCIZIO =
                                                       (SELECT     MAX(Codice)
                                                         FROM          TABEsercizi)) AS CODZONA,
                          (SELECT     CODCATEGORIA
                            FROM          ANAGRAFICARISERVATICF
                            WHERE      ANAGRAFICARISERVATICF.CODCONTO = SP.CODCLIFOR AND ESERCIZIO =
                                                       (SELECT     MAX(Codice)
                                                         FROM          TABEsercizi)) AS CODCATEGORIACF, SP.CODAGE1, SP.CODAGE2, SP.CODAGE3, (CASE WHEN ((SP.SCADATTPASS <> 0 AND 
                      SUBSTRING(SP.CODCLIFOR, 1, 1) <> 'C') OR
                      (SP.SCADATTPASS = 0 AND SUBSTRING(SP.CODCLIFOR, 1, 1) = 'C')) THEN (SP.IMPPROVEURO1 * - 1) ELSE SP.IMPPROVEURO1 END) 
                      AS IMPPROVEURO1, (CASE WHEN ((SP.SCADATTPASS <> 0 AND SUBSTRING(SP.CODCLIFOR, 1, 1) <> 'C') OR
                      (SP.SCADATTPASS = 0 AND SUBSTRING(SP.CODCLIFOR, 1, 1) = 'C')) THEN (SP.IMPPROVEURO2 * - 1) ELSE SP.IMPPROVEURO2 END) 
                      AS IMPPROVEURO2, (CASE WHEN ((SP.SCADATTPASS <> 0 AND SUBSTRING(SP.CODCLIFOR, 1, 1) <> 'C') OR
                      (SP.SCADATTPASS = 0 AND SUBSTRING(SP.CODCLIFOR, 1, 1) = 'C')) THEN (SP.IMPPROVEURO3 * - 1) ELSE SP.IMPPROVEURO3 END) 
                      AS IMPPROVEURO3, (CASE WHEN ((SP.SCADATTPASS <> 0 AND SUBSTRING(SP.CODCLIFOR, 1, 1) <> 'C') OR
                      (SP.SCADATTPASS = 0 AND SUBSTRING(SP.CODCLIFOR, 1, 1) = 'C')) THEN (SP.IMPORTOSCEURO * - 1) ELSE SP.IMPORTOSCEURO END) 
                      AS IMPORTOSCADEURO, (CASE WHEN ((SP.SCADATTPASS <> 0 AND SUBSTRING(SP.CODCLIFOR, 1, 1) <> 'C') OR
                      (SP.SCADATTPASS = 0 AND SUBSTRING(SP.CODCLIFOR, 1, 1) = 'C')) THEN (SP.TOTFATTEURO * - 1) ELSE SP.TOTFATTEURO END) 
                      AS TOTFATTURAEURO,
                      (CASE WHEN ((SP.SCADATTPASS = 0 AND SUBSTRING(SP.CODCLIFOR, 1, 1) <> 'C') OR
                      (SP.SCADATTPASS = 0 AND SUBSTRING(SP.CODCLIFOR, 1, 1) = 'C')) THEN (SP.IMPORTOSCVAL * - 1) ELSE SP.IMPORTOSCVAL END) 
                      AS IMPORTOSCVAL,
                      (CASE WHEN ((SP.SCADATTPASS = 0 AND SUBSTRING(SP.CODCLIFOR, 1, 1) <> 'C') OR
                      (SP.SCADATTPASS = 0 AND SUBSTRING(SP.CODCLIFOR, 1, 1) = 'C')) THEN (SP.IMPFATTVAL *  - 1) ELSE SP.IMPFATTVAL  END) 
                      AS IMPFATTVAL
FROM         SCADENZEPREVISIONALI SP
WHERE NUMSCAD<>-1

GO
GRANT SELECT
    ON OBJECT::[dbo].[BRIOVISTASCADENZEALL] TO [Metodo98]
    AS [dbo];

