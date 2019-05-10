

CREATE VIEW [dbo].[View_Of_DocumentiPrelevati]
AS

SELECT 
    TD.* 
FROM 
    Tp_DocumentiPrelevati DP
INNER JOIN
    TESTEDOCUMENTI TD
ON
    TD.PROGRESSIVO = DP.Progressivo
    

GO
GRANT SELECT
    ON OBJECT::[dbo].[View_Of_DocumentiPrelevati] TO [Metodo98]
    AS [dbo];

