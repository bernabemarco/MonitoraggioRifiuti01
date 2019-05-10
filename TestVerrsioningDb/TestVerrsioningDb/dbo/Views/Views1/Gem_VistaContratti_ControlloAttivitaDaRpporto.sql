
create view Gem_VistaContratti_ControlloAttivitaDaRpporto
as
SELECT     SC.IDCONTRATTO, SC.SEZIONECONTRATTO, ISNULL(VistaRapp.ContegRapportiStatoED, 0) AS ContegRapportiStatoED
FROM         Gem_VistaContratti_ControlloAttivitaDaRapporto AS VistaRapp RIGHT OUTER JOIN
                      GEM_SEZIONICONTRATTO AS SC ON VistaRapp.IDCONTRATTO = SC.IDCONTRATTO AND VistaRapp.SEZIONECONTRATTO = SC.SEZIONECONTRATTO


GO
GRANT SELECT
    ON OBJECT::[dbo].[Gem_VistaContratti_ControlloAttivitaDaRpporto] TO [Metodo98]
    AS [dbo];

