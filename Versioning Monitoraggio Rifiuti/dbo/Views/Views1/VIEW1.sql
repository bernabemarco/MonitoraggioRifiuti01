﻿CREATE VIEW dbo.VIEW1
AS
SELECT     dbo.ANAGRAFICACF.PARTITAIVA, SUM(dbo.TESTEDOCUMENTI.SEGNO * dbo.RIGHEDOCUMENTI.TOTNETTORIGAEURO) AS TotNettoDoc
FROM         dbo.RIGHEDOCUMENTI INNER JOIN
                      dbo.TESTEDOCUMENTI ON dbo.RIGHEDOCUMENTI.IDTESTA = dbo.TESTEDOCUMENTI.PROGRESSIVO INNER JOIN
                      dbo.PARAMETRIDOC ON dbo.TESTEDOCUMENTI.TIPODOC = dbo.PARAMETRIDOC.CODICE INNER JOIN
                      dbo.ANAGRAFICAARTICOLI ON dbo.RIGHEDOCUMENTI.CODART = dbo.ANAGRAFICAARTICOLI.CODICE INNER JOIN
                      dbo.TABGRUPPI ON dbo.ANAGRAFICAARTICOLI.GRUPPO = dbo.TABGRUPPI.CODICE INNER JOIN
                      dbo.ANAGRAFICARISERVATICF ON dbo.TESTEDOCUMENTI.ESERCIZIO = dbo.ANAGRAFICARISERVATICF.ESERCIZIO AND 
                      dbo.TESTEDOCUMENTI.CODCFFATT = dbo.ANAGRAFICARISERVATICF.CODCONTO INNER JOIN
                      dbo.ANAGRAFICACF ON dbo.TESTEDOCUMENTI.CODCLIFOR = dbo.ANAGRAFICACF.CODCONTO
WHERE     (dbo.PARAMETRIDOC.CLIFOR = 'C') AND (dbo.RIGHEDOCUMENTI.TIPORIGA = 'N') AND (dbo.PARAMETRIDOC.TIPO = 'F' OR
                      dbo.PARAMETRIDOC.TIPO = 'N') AND (dbo.TESTEDOCUMENTI.ESERCIZIO = 2006)
GROUP BY dbo.ANAGRAFICACF.PARTITAIVA
HAVING      (dbo.ANAGRAFICACF.PARTITAIVA = '1111')
