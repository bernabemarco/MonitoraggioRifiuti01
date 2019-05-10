
 CREATE VIEW [dbo].[VIEW_CATALOGO_LISTINI_FORNITORI]
 AS
 SELECT DISTINCT
 0 Id,
 0 IdList,
 0 IdSupplier,
 '' Description,
 0 IdCurrency,
 0 IsDefault,
 GETDATE()TimeIns,
 '' UserIns
 
GO
GRANT SELECT
    ON OBJECT::[dbo].[VIEW_CATALOGO_LISTINI_FORNITORI] TO [Metodo98]
    AS [dbo];

