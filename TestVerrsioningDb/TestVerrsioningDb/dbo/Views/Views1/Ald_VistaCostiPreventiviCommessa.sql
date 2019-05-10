﻿CREATE VIEW [dbo].[Ald_VistaCostiPreventiviCommessa]
AS
SELECT     TESTEFOGLICOMMCLI.RIFCOMMESSA, TESTEFOGLICOMMCLI.PROGRESSIVO AS RifProgPreventivo, TESTEFOGLICOMMCLI.REVISIONE, 
                      TABREVISIONICOMMCLI.DESCRIZIONE AS DscRevisione, RIGHEPREVCOMMCLI.COSTOTOTALEPREVEURO, RIGHEPREVCOMMCLI.LIVS1
FROM         TESTEFOGLICOMMCLI INNER JOIN
                      RIGHEPREVCOMMCLI ON TESTEFOGLICOMMCLI.PROGRESSIVO = RIGHEPREVCOMMCLI.RIFPROGRESSIVO LEFT OUTER JOIN
                      TABREVISIONICOMMCLI ON TESTEFOGLICOMMCLI.REVISIONE = TABREVISIONICOMMCLI.CODICE
WHERE     (RIGHEPREVCOMMCLI.LIVS1 = 1)

GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_VistaCostiPreventiviCommessa] TO [Metodo98]
    AS [dbo];

