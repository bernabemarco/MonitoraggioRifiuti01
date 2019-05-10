
CREATE VIEW [dbo].[DA Summary Sheet] AS 

SELECT '' AS [timestamp]
      ,[Codice] AS [Code]
      ,[NumFoglio] AS [Sheet Number]
      ,[Descrizione] AS [Description]
      ,[TipoRiclassificazione] AS [Type Refiling Code]
      ,[DesColonna01] AS [Column 1 Description]
      ,[DesColonna02] AS [Column 2 Description]
      ,[DesColonna03] AS [Column 3 Description]
      ,[DesColonna04] AS [Column 4 Description]
      ,[DesColonna05] AS [Column 5 Description]
      ,[DesColonna06] AS [Column 6 Description]
      ,[DesColonna07] AS [Column 7 Description]
      ,[DesColonna08] AS [Column 8 Description]
      ,[DesColonna09] AS [Column 9 Description]
      ,[DesColonna10] AS [Column 10 Description]
      ,[DesColonna11] AS [Column 11 Description]
      ,[DesColonna12] AS [Column 12 Description]
      ,[DesColonnaTot] AS [Column Total Description]
      ,[DesIndice] AS [Rate Description]
      ,[DesTitolo] AS [Title Description]
      ,[DesPiede01] AS [Foot 1 Description]
      ,[DesPiede02] AS [Foot 2 Description]
      ,[DesPiede03] AS [Foot 3 Description]
      ,[DesPiede04] AS [Foot 4 Description]
      ,[DesPiede05] AS [Foot 5 Description]
      ,[DesPiede06] AS [Foot 6 Description]
      ,[DesPiede07] AS [Foot 7 Description]
      ,[DesPiede08] AS [Foot 8 Description]
FROM CGesFoglioRiepilogo
  

GO
GRANT SELECT
    ON OBJECT::[dbo].[DA Summary Sheet] TO [Metodo98]
    AS [dbo];

