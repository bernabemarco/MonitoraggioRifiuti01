
CREATE VIEW [dbo].[DA Type Refiling] AS 

SELECT '' AS [timestamp]
      ,[Codice] AS [Code]
      ,[Descrizione] AS [Description]
      ,[Tipologia] AS [Typology]
      ,[Attivita] AS [Assets]
      ,[Costo] AS [Cost]
      ,[Reddito] AS [Income]
      ,[Patrimoniale] AS [Property]
      ,[Note] AS [Notes]
FROM CGesTipiRiclassificazioni


GO
GRANT SELECT
    ON OBJECT::[dbo].[DA Type Refiling] TO [Metodo98]
    AS [dbo];

