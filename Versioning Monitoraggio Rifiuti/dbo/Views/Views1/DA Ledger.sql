
CREATE VIEW [dbo].[DA Ledger] AS 

SELECT '' AS [timestamp]
      ,[Codice] AS [Code]
      ,[Descrizione] AS [Description]
      ,[Segno] AS [Sign]
      ,[Tipologia] AS [Typology]
      ,[Note] AS [Notes]
FROM CGesMastri


GO
GRANT SELECT
    ON OBJECT::[dbo].[DA Ledger] TO [Metodo98]
    AS [dbo];

