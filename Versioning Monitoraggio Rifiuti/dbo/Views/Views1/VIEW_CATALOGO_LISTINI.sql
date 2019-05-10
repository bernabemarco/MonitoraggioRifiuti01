

 CREATE VIEW [dbo].[VIEW_CATALOGO_LISTINI]
 AS

 SELECT DISTINCT
 0 Id,
 0 IdList,
 '' Description,
 0 IdCurrency,
 0 IsDefault,
 GetDate() TimeIns,
 '' UserIns
 
GO
GRANT SELECT
    ON OBJECT::[dbo].[VIEW_CATALOGO_LISTINI] TO [Metodo98]
    AS [dbo];

