
CREATE VIEW [dbo].[GEM_VistaConteggioRecRappOreLavInt]
AS
SELECT     IDRAPPORTO, COUNT(idRiga) AS CountIdRiga
FROM         GEM_SEZIONECONTRATTORAPPORTI_OreLavoroINTERNE
GROUP BY IDRAPPORTO

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaConteggioRecRappOreLavInt] TO [Metodo98]
    AS [dbo];

