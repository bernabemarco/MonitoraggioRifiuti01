
 CREATE VIEW [dbo].[VIEW_CATALOGO_FORNITORI_FILTERED]
 AS
 SELECT 
    0 Id,
    '' Cod,
    '' Description,
    getdate() TimeIns,
    '' UserIns
 
GO
GRANT SELECT
    ON OBJECT::[dbo].[VIEW_CATALOGO_FORNITORI_FILTERED] TO [Metodo98]
    AS [dbo];

