
 CREATE VIEW [dbo].[VIEW_CATALOGO_FORNITORI]
 AS
 SELECT
 0 Id,
 '' Cod,
 '' Description,
 GETDATE() TimeIns,
 '' UserIns
 
GO
GRANT SELECT
    ON OBJECT::[dbo].[VIEW_CATALOGO_FORNITORI] TO [Metodo98]
    AS [dbo];

