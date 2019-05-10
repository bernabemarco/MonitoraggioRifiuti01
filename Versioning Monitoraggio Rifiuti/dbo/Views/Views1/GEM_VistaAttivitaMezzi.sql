CREATE VIEW [GEM_VistaAttivitaMezzi] AS
  SELECT  tma.idTipologMezzo, tm.descrizione as DescMezzo, tma.IdRiga,
          tma.idAttivita, a.Descrizione as DescAttivita, tma.Posizione, a.Primaria,
          -- Rif. Ns. SF TV1074052 del 10.01.2011 - Sviluppo Pacchetto 6 - N.13 bis
          tma.TipologiaAttivitaEseguita
  FROM GEMMADBG.dbo.GEM_T_TipologMezziAttivita tma
  INNER JOIN GEM_Vista_TipologMezzo tm on tma.idTipologMezzo=tm.IdTipologMezzo
  INNER JOIN [GEM_VistaAttivita] a on tma.idAttivita=a.IdAttivita

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaAttivitaMezzi] TO [Metodo98]
    AS [dbo];

