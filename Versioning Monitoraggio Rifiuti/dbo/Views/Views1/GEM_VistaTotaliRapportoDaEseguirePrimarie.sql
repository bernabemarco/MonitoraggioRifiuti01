


CREATE VIEW [dbo].[GEM_VistaTotaliRapportoDaEseguirePrimarie]
AS
SELECT     RAP.IDRAPPORTO,  isnull(SCDM.UltimaAttivitaEseg,'N') as UlAttEseg,

SUM(SCDM.QUANTITA) AS nrMezziVisitaP, 
(case when rap.DA_FATT='S' 
		then
			(case when isnull(SCDM.UltimaAttivitaEseg,'N')='V' 
				then SUM(SCDM.QUANTITA * SCDM.IMPORTOAT2) 
				else SUM(SCDM.QUANTITA * SCDM.IMPORTOAT1)
				end) 
		else	
			0
		end)
		as TotaleImportoPrimarie
FROM         GEM_SEZIONECONTRATTORAPPORTIMEZZI AS SCDM LEFT OUTER JOIN
                      GEM_SEZIONECONTRATTORAPPORTI AS RAP LEFT OUTER JOIN
                      GEM_SEZIONICONTRATTO AS SC ON RAP.SEZIONECONTRATTO = SC.SEZIONECONTRATTO AND RAP.IDCONTRATTO = SC.IDCONTRATTO LEFT OUTER JOIN
                      GEM_TESTACONTRATTO AS TC ON SC.IDCONTRATTO = TC.IDCONTRATTO ON SCDM.IDRAPPORTO = RAP.IDRAPPORTO
WHERE     (ISNULL(SCDM.ELIMINATO, '0') = '0') OR
                      (SCDM.ELIMINATO = '')
GROUP BY RAP.IDRAPPORTO, isnull(SCDM.UltimaAttivitaEseg,'N'), rap.DA_FATT



GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_VistaTotaliRapportoDaEseguirePrimarie] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_VistaTotaliRapportoDaEseguirePrimarie] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_VistaTotaliRapportoDaEseguirePrimarie] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaTotaliRapportoDaEseguirePrimarie] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_VistaTotaliRapportoDaEseguirePrimarie] TO [Metodo98]
    AS [dbo];

