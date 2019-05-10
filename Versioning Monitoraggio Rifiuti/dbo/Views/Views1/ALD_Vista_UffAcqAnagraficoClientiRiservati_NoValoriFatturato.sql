


CREATE VIEW [dbo].[ALD_Vista_UffAcqAnagraficoClientiRiservati_NoValoriFatturato]
AS
SELECT     TABDITTE.DITTA, AnaCRiserv.ESERCIZIO, (CASE WHEN LEFT(isnull(anaC.PARTITAIVA, '00000000000'), 11) 
                      = '00000000000' THEN CASE WHEN LEFT(isnull(anaC.CODFISCALE, '00000000000'), 11) 
                      = '00000000000' THEN anaC.DSCCONTO1 ELSE anaC.CODFISCALE END ELSE anaC.PARTITAIVA END) AS CodRicerca, anaC.CODCONTO, anaC.DSCCONTO1, 
                      anaC.PARTITAIVA, anaC.CODFISCALE, AnaCRiserv.CODPAG, AnaCRiserv.UTENTEMODIFICA, AnaCRiserv.DATAMODIFICA, 
					  --SUM(ISNULL(RIGHEIVA.IMPONIBILEEURO, 
                      --0)) AS Fatturato, 
					  EXC.IdTrust, AnaCRiserv.CODAGENTE1,
                          --(SELECT     SUM(IMPORTOSCEURO) AS Expr1
                          --  FROM          TABSCADENZE
                          --  WHERE      (CODCLIFOR = anaC.CODCONTO) AND (ESITO = 3) AND (SCADATTPASS = 1)) AS INSOLUTO,
                         -- (SELECT     SUM(IMPORTOSCEURO) AS Expr1
                         --   FROM          TABSCADENZE AS TABSCADENZE_2
                         --   WHERE      (CODCLIFOR = anaC.CODCONTO) AND (ESITO IN (0, 1)) AND (SCADATTPASS = 1) AND (DATASCADENZA > GETDATE())) AS DaScadere,
                         -- (SELECT     SUM(IMPORTOSCEURO) AS Expr1
                         --   FROM          TABSCADENZE AS TABSCADENZE_1
                         --   WHERE      (CODCLIFOR = anaC.CODCONTO) AND (ESITO IN (0, 1)) AND (SCADATTPASS = 1) AND (DATASCADENZA <= GETDATE())) AS Scaduto,
                         -- (SELECT     SUM(IMPORTOSCEURO) AS Expr1
                         --   FROM          TABSCADENZE AS TABSCADENZE_1
                         --   WHERE      (CODCLIFOR = anaC.CODCONTO) AND (ESITO IN (0, 1, 3)) AND (SCADATTPASS = 0)) AS NoteAccr, 
							AnaCRiserv.CODCATEGORIA, 
                      CATEGORIECF.DSCCATEGORIA, AnaCRiserv.CODZONA, TABZONE.DESCRIZIONE AS DscZona, AnaCRiserv.CODSETTORE, 
                      TABSETTORI.DESCRIZIONE AS DscSettore
FROM         
                      RIGHEIVA RIGHT OUTER JOIN
                      ANAGRAFICACF AS anaC INNER JOIN
                      ANAGRAFICARISERVATICF AS AnaCRiserv ON anaC.CODCONTO = AnaCRiserv.CODCONTO INNER JOIN
                      TABZONE ON AnaCRiserv.CODZONA = TABZONE.CODICE INNER JOIN
                      TABSETTORI ON AnaCRiserv.CODSETTORE = TABSETTORI.CODICE LEFT OUTER JOIN
                      CATEGORIECF ON AnaCRiserv.CODCATEGORIA = CATEGORIECF.CODCATEGORIA LEFT OUTER JOIN
                      EXTRACLIENTI AS EXC ON anaC.CODCONTO = EXC.CODCONTO ON RIGHEIVA.ESERCIZIO = AnaCRiserv.ESERCIZIO AND 
                      RIGHEIVA.CONTO = AnaCRiserv.CODCONTO
					  CROSS JOIN
                      TABDITTE
WHERE     (anaC.TIPOCONTO = 'C')
GROUP BY TABDITTE.DITTA, AnaCRiserv.ESERCIZIO, anaC.CODCONTO, anaC.DSCCONTO1, anaC.PARTITAIVA, anaC.CODFISCALE, AnaCRiserv.CODPAG, 
                      AnaCRiserv.UTENTEMODIFICA, AnaCRiserv.DATAMODIFICA, EXC.IdTrust, AnaCRiserv.CODAGENTE1, AnaCRiserv.CODCATEGORIA, CATEGORIECF.DSCCATEGORIA, 
                      AnaCRiserv.CODZONA, TABZONE.DESCRIZIONE, AnaCRiserv.CODSETTORE, TABSETTORI.DESCRIZIONE

GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_Vista_UffAcqAnagraficoClientiRiservati_NoValoriFatturato] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_Vista_UffAcqAnagraficoClientiRiservati_NoValoriFatturato] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_Vista_UffAcqAnagraficoClientiRiservati_NoValoriFatturato] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_Vista_UffAcqAnagraficoClientiRiservati_NoValoriFatturato] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_Vista_UffAcqAnagraficoClientiRiservati_NoValoriFatturato] TO [Metodo98]
    AS [dbo];

