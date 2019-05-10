
CREATE VIEW [dbo].[DA Environment] AS 

SELECT '' AS [timestamp]
      ,[Codice] AS [Code]
      ,[Descrizione] AS [Description]
      ,[Tipo] AS [Type]
      ,[Note] AS [Notes]
FROM CGesAmbienti
  

GO
GRANT SELECT
    ON OBJECT::[dbo].[DA Environment] TO [Metodo98]
    AS [dbo];

