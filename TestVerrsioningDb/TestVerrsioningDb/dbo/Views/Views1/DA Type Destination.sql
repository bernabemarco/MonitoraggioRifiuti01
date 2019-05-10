
CREATE VIEW [dbo].[DA Type Destination] AS 

SELECT '' AS [timestamp]
      ,[Codice] AS [Code]
      ,[Descrizione] AS [Description]
      ,[Tipologia] AS [Typology]
      ,[Note] AS [Notes]
FROM CGesTipiDestinazione


GO
GRANT SELECT
    ON OBJECT::[dbo].[DA Type Destination] TO [Metodo98]
    AS [dbo];

