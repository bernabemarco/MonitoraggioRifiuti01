
CREATE VIEW [dbo].[DA Unity of Measure] AS 

SELECT '' AS [timestamp]
      ,[Codice] AS [Code]
      ,[Descrizione] AS [Description]
      ,[Tipologia] AS [Typology]
      ,[Note] AS [Notes]
FROM CGesUnitaMisura


GO
GRANT SELECT
    ON OBJECT::[dbo].[DA Unity of Measure] TO [Metodo98]
    AS [dbo];

