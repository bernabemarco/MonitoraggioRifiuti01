CREATE VIEW [dbo].[GEM_VistaControlloNrRapportiVSNrVisiteTotali]
AS
select idcontratto, SEZIONECONTRATTO, NrVisiteTot,
(select count(idrapporto) as NrRapp from GEM_SEZIONECONTRATTORAPPORTI rap
where TIPOLOGIARAPPORTO='O' and rap.idcontratto=GEM_SEZIONICONTRATTO.idcontratto
and rap.SEZIONECONTRATTO=GEM_SEZIONICONTRATTO.SEZIONECONTRATTO 
and rap.Stato<>'A' and isnull(rap.eliminato,'N')<>'S'
group by rap.idcontratto, rap.SEZIONECONTRATTO) as NrRapp
from GEM_SEZIONICONTRATTO


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaControlloNrRapportiVSNrVisiteTotali] TO [Metodo98]
    AS [dbo];

