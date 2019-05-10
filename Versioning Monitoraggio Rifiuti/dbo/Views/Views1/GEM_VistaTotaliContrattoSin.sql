
Create VIEW [dbo].[GEM_VistaTotaliContrattoSin]
AS
SELECT     TC.IDCONTRATTO, TC.CODCLIENTE, SC.SEZIONECONTRATTO, SC.DESCRIZIONESEZIONE, SC.CODDEST, SC.idTipologMezzo, SC.CodiceMezzo, 
                      SC.ImportoContrattoSezione, SC.ImportoVisita, SCDM.CodMezzo AS Articolo, SC.NrVisiteTot, SUM(isnull(SCDM.QUANTITA,1)) AS Quantita, 
                      SUM(isnull(SCDM.QUANTITA,1) * SCDM.IMPORTOAT1) AS TotaleImportoAT1, SUM(isnull(SCDM.QUANTITA,1) * SCDM.IMPORTOAT2) AS TotaleImportoAT2, 
                      SUM(isnull(SCDM.QUANTITA,1) * SCDM.IMPORTOAT3) AS TotaleImportoAT3, SUM(isnull(SCDM.QUANTITA,1) * SCDM.IMPORTOAT4) AS TotaleImportoAT4, 
                      SUM(isnull(SCDM.QUANTITA,1) * SCDM.IMPORTOAT5) AS TotaleImportoAT5
FROM         GEM_SEZIONICONTRATTODETTMEZZI AS SCDM LEFT OUTER JOIN
                      GEM_SEZIONICONTRATTO AS SC ON SCDM.IDCONTRATTO = SC.IDCONTRATTO AND 
                      SCDM.SEZIONECONTRATTO = SC.SEZIONECONTRATTO LEFT OUTER JOIN
                      GEM_TESTACONTRATTO AS TC ON SC.IDCONTRATTO = TC.IDCONTRATTO
WHERE    ((isnull(SCDM.ELIMINATO, '0') = '0') or SCDM.ELIMINATO='') 
and SC.Flag_SezAggr=0 
GROUP BY TC.IDCONTRATTO, TC.CODCLIENTE, SC.SEZIONECONTRATTO, SC.DESCRIZIONESEZIONE, SC.CODDEST, SC.idTipologMezzo, SC.CodiceMezzo, 
                      SC.ImportoContrattoSezione, SC.ImportoVisita, SCDM.CodMezzo, SC.NrVisiteTot

GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_VistaTotaliContrattoSin] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaTotaliContrattoSin] TO [Metodo98]
    AS [dbo];

