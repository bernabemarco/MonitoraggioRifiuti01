
CREATE VIEW [dbo].[DA Values Financial Ratios] AS 

SELECT '' AS [timestamp]
      ,(SELECT TOP 1 Codice FROM CGesFormuleBilancio WHERE Progressivo = [ProgressivoFormula]) AS [Code]
      ,[AnnoInizio] AS [Start Year]
      ,[MeseInizio] AS [Start Month]
      ,[AnnoFine] AS [End Year]
      ,[Ambiente] AS [Environment Code]
      ,[MeseFine] AS [End Month]
      ,[Nome] AS [Header]
      ,[Valore] AS [Value]
      ,[NumeroOrdine] AS [Order No_]
FROM CGesValoriFormuleBilancio


GO
GRANT SELECT
    ON OBJECT::[dbo].[DA Values Financial Ratios] TO [Metodo98]
    AS [dbo];

