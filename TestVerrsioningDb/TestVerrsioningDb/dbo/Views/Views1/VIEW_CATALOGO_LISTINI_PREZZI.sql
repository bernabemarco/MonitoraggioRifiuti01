
 CREATE VIEW [dbo].[VIEW_CATALOGO_LISTINI_PREZZI]
 AS
 SELECT
 0 Price,
 0 ID,
 '' Fornitore,
 0 IDC,
 0 IDITEM,
 '' Catalogo,
 0  IDR,
 '' Revisione,
 '' CodeItem,
 '' Description
 
GO
GRANT SELECT
    ON OBJECT::[dbo].[VIEW_CATALOGO_LISTINI_PREZZI] TO [Metodo98]
    AS [dbo];

