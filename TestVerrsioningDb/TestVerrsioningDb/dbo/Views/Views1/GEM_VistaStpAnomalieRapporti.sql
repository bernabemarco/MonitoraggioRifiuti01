
CREATE VIEW [dbo].[GEM_VistaStpAnomalieRapporti]
AS
SELECT     IDRAPPORTO, COUNT(IdRigaMezzo) AS CountAnomalieMezzi
FROM         dbo.GEM_SEZIONECONTRATTORAPPORTIMEZZI
WHERE     (NOT (NOTE IS NULL OR
                      NOTE = '')) AND (ELIMINATO <> '1')
GROUP BY IDRAPPORTO
HAVING      (COUNT(IdRigaMezzo) > 0)

GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_VistaStpAnomalieRapporti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_VistaStpAnomalieRapporti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_VistaStpAnomalieRapporti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaStpAnomalieRapporti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_VistaStpAnomalieRapporti] TO [Metodo98]
    AS [dbo];

