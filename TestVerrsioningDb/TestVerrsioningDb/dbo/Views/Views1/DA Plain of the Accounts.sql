
CREATE VIEW [dbo].[DA Plain of the Accounts] AS 

SELECT '' AS [timestamp]
      ,[CodConto] AS [No_]
      ,[Descrizione] AS [Description]
      ,[Mastro] AS [Ledger Code]
      ,[ContoConguaglio] AS [Balance Account Code]
      ,[PercVariabilita] AS [% Variability]
      ,[Raggruppamento] AS [Group Code]
      ,[CoeffVariazione] AS [Coefficient of Variation Code]
      ,'' AS [Notes]
FROM CGesConti


GO
GRANT SELECT
    ON OBJECT::[dbo].[DA Plain of the Accounts] TO [Metodo98]
    AS [dbo];

