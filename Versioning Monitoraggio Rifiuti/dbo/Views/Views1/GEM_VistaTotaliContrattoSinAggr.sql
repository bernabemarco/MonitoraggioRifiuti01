
CREATE VIEW [dbo].[GEM_VistaTotaliContrattoSinAggr]
AS
SELECT     TC.IDCONTRATTO, TC.CODCLIENTE, sc.CodSezioniAggregate, SC.CODDEST,
             sum(SC.ImportoContrattoSezione) as TotImpContr, sum(SC.NrVisiteTot) as NrVisiteTot
FROM         GEM_SEZIONICONTRATTODETTMEZZI AS SCDM LEFT OUTER JOIN
                      GEM_SEZIONICONTRATTO AS SC ON SCDM.IDCONTRATTO = SC.IDCONTRATTO AND 
                      SCDM.SEZIONECONTRATTO = SC.SEZIONECONTRATTO LEFT OUTER JOIN
                      GEM_TESTACONTRATTO AS TC ON SC.IDCONTRATTO = TC.IDCONTRATTO
WHERE    ((isnull(SCDM.ELIMINATO, '0') = '0') or SCDM.ELIMINATO='') and SC.Flag_SezAggr=1 
GROUP BY TC.IDCONTRATTO, TC.CODCLIENTE, sc.CodSezioniAggregate, SC.CODDEST

GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_VistaTotaliContrattoSinAggr] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaTotaliContrattoSinAggr] TO [Metodo98]
    AS [dbo];

