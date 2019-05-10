
 CREATE VIEW [dbo].[VIEW_CATALOGO_PRODOTTI]
 AS
 SELECT
 0 ID,
 '' Fornitore,
 0 IDC,
 0 IDITEM,
 '' Catalogo,
 0 IDR,
 '' Revisione,
 '' CodeItem,
 '' Description
 
GO
GRANT SELECT
    ON OBJECT::[dbo].[VIEW_CATALOGO_PRODOTTI] TO [Metodo98]
    AS [dbo];

