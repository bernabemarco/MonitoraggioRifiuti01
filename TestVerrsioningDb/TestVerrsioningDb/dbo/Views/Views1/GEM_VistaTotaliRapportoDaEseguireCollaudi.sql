

CREATE VIEW [dbo].GEM_VistaTotaliRapportoDaEseguireCollaudi
AS
SELECT     RAP.IDRAPPORTO,  --isnull(SCDM.UltimaAttivitaEseg,'N') as UlAttEseg,
 --isnull(year(SCDM.data_Prev),0), year(rap.DATA_PREV),
--SUM(SCDM.QUANTITA) AS nrMezziVisitaP, 
sum(case when year(SCDM.DATA_PCOLL)<=year(rap.DATA_PREV) then 1 else 0 end) as nrMezziVisitaS,
(case when year(SCDM.DATA_PCOLL)<=year(rap.DATA_PREV) then SUM(SCDM.IMPORTOAT3) else 0 end) as TotaleImportoSecondarie
FROM         GEM_SEZIONECONTRATTORAPPORTIMEZZI AS SCDM LEFT OUTER JOIN
                      GEM_SEZIONECONTRATTORAPPORTI AS RAP LEFT OUTER JOIN
                      GEM_SEZIONICONTRATTO AS SC ON RAP.SEZIONECONTRATTO = SC.SEZIONECONTRATTO AND RAP.IDCONTRATTO = SC.IDCONTRATTO LEFT OUTER JOIN
                      GEM_TESTACONTRATTO AS TC ON SC.IDCONTRATTO = TC.IDCONTRATTO ON SCDM.IDRAPPORTO = RAP.IDRAPPORTO
WHERE     (ISNULL(SCDM.ELIMINATO, '0') = '0') OR
                      (SCDM.ELIMINATO = '')
					  and isnull(year(SCDM.DATA_PCOLL),0)>0
GROUP BY RAP.IDRAPPORTO, year(SCDM.DATA_PCOLL), year(rap.DATA_PREV)


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_VistaTotaliRapportoDaEseguireCollaudi] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_VistaTotaliRapportoDaEseguireCollaudi] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_VistaTotaliRapportoDaEseguireCollaudi] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaTotaliRapportoDaEseguireCollaudi] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_VistaTotaliRapportoDaEseguireCollaudi] TO [Metodo98]
    AS [dbo];

