
 CREATE VIEW [dbo].[VIEW_CATALOGO_CATALOGHI]
 AS
 SELECT 0 Id
 ,0 IdSupplier
 ,'' Cod
 ,'' Description
 ,0 IsDefault
 ,GETDATE() TimeIns
 ,'' UserIns
 
GO
GRANT SELECT
    ON OBJECT::[dbo].[VIEW_CATALOGO_CATALOGHI] TO [Metodo98]
    AS [dbo];

