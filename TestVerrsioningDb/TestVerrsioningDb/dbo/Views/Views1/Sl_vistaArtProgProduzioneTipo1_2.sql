
CREATE VIEW dbo.Sl_vistaArtProgProduzioneTipo1_2
AS
SELECT     NOMEPIANIF, CODART AS CArtProg
FROM         dbo.PROGPRODUZIONE
WHERE     (TIPO = 1) OR
                      (TIPO = 2)
GROUP BY NOMEPIANIF, CODART


GO
GRANT DELETE
    ON OBJECT::[dbo].[Sl_vistaArtProgProduzioneTipo1_2] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Sl_vistaArtProgProduzioneTipo1_2] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Sl_vistaArtProgProduzioneTipo1_2] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Sl_vistaArtProgProduzioneTipo1_2] TO [Metodo98]
    AS [dbo];

