﻿
 CREATE VIEW [dbo].[VIEW_CATALOGO_DIFFERENZA_PREZZI]
 AS

 SELECT
 '' CODICEMETODO,
 '' DESCRIZIONE,
 '' DESCRESTESA,
 '' CODFORNITORE,
 '' GRUPPO,
 '' CATEGORIA,
 '' CODCATEGORIASTAT,
 '' ARTTIPOLOGIA,
 '' VARESPLICITE,
 1 NRLISTINOMETODO,
 0 PREZZO_CATALOGO,
 0 PREZZO_METODO ,
 '' UM
 
GO
GRANT SELECT
    ON OBJECT::[dbo].[VIEW_CATALOGO_DIFFERENZA_PREZZI] TO [Metodo98]
    AS [dbo];
