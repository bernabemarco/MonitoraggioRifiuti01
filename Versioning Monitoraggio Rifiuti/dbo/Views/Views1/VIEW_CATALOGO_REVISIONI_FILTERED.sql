
 CREATE VIEW [dbo].[VIEW_CATALOGO_REVISIONI_FILTERED]
 AS

 SELECT
     0 Id,
     0 IdList,
     '' Description,
     0 Active,
     GETDATE() ValidityStart,
     GETDATE() ValidityEnd,
     0 IsDefault,
     GETDATE() TimeIns,
     '' UserIns
 
GO
GRANT SELECT
    ON OBJECT::[dbo].[VIEW_CATALOGO_REVISIONI_FILTERED] TO [Metodo98]
    AS [dbo];

