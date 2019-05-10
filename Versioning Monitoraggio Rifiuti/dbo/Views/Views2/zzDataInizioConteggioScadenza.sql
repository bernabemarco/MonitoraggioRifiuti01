
CREATE VIEW [dbo].[zzDataInizioConteggioScadenza]
AS
SELECT     PROGRESSIVO,
                          (SELECT     TOP (1) FINEMESE
                            FROM          dbo.TABRATEPAG
                            WHERE      (CODICE = dbo.TABSCADENZE.CODPAG)) AS Expr1, CASE WHEN
                          (SELECT     TOP 1 finemese
                            FROM          tabratepag
                            WHERE      codice = tabscadenze.codpag) = 1 THEN DATEADD(d, - 1, DATEADD(m, 1, CONVERT(datetime, '01/' + CONVERT(varchar, 
                      month(datafattura)) + '/' + CONVERT(varchar, year(datafattura)), 105))) WHEN
                          (SELECT     TOP 1 finemese
                            FROM          tabratepag
                            WHERE      codice = tabscadenze.codpag) = 0 THEN datafattura END AS DataOK
FROM         dbo.TABSCADENZE

GO
GRANT SELECT
    ON OBJECT::[dbo].[zzDataInizioConteggioScadenza] TO [Metodo98]
    AS [dbo];

