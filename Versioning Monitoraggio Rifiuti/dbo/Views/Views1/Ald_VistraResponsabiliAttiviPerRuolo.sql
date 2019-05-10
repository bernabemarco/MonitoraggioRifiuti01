
CREATE view [dbo].[Ald_VistraResponsabiliAttiviPerRuolo]
as
SELECT     TR.CODICE as IdResponsabile, TR.DESCRIZIONE, TR.UTENTEMODIFICA, TR.DATAMODIFICA, TR.emailResp, TR.TipolResp AS IdRuoloResponsabile, 
                      AldRuolo.DscResponsabile AS DscRuoloResponsabile, TR.Dismesso, TR.IdRespCid
FROM         TABRESPONSABILI AS TR INNER JOIN
                      Ald_TabRuoliResponsabili AS AldRuolo ON TR.TipolResp = AldRuolo.IdRuoloResp
WHERE     (TR.Dismesso = 0)


GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_VistraResponsabiliAttiviPerRuolo] TO [Metodo98]
    AS [dbo];

