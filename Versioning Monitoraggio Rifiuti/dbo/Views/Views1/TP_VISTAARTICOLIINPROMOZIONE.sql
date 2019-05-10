
CREATE VIEW TP_VISTAARTICOLIINPROMOZIONE
AS
SELECT     progressivo AS NumeroPromozione, descrizione, CASE EAP.TIPO WHEN 0 THEN 'S' WHEN 1 THEN 'R' WHEN 2 THEN 'T' END AS TIPO, codice, data_inizio, data_fine, clifor, gruppoprezzicf, CODSETTORE, CODZONA, CODCATEGORIA
FROM         dbo.PROMOZIONI_ELENCOARTICOLI AS EAP
WHERE     (codice NOT IN
                          (SELECT     CodArt
                            FROM          dbo.TP_ExtraMag
                            WHERE      (TP_Espositore = 'x')))


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_VISTAARTICOLIINPROMOZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_VISTAARTICOLIINPROMOZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTAARTICOLIINPROMOZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_VISTAARTICOLIINPROMOZIONE] TO [Metodo98]
    AS [dbo];

