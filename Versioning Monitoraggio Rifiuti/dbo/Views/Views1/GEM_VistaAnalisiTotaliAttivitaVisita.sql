



/****** Oggetto:  View [dbo].[GEM_VistaAnalisiTotaliAttivitaVisita]    Data script: 03/21/2013 14:32:38 ******/
CREATE VIEW [dbo].[GEM_VistaAnalisiTotaliAttivitaVisita]
AS
SELECT     Rapp.DATA_EFF, Rapp.IDRAPPORTO, Rapp.TIPOLOGIARAPPORTO, Rapp.RIFCOMMCLI, Rapp.DA_FATT, TC.IDCONTRATTO, SC.idTipologMezzo, SC.CodiceMezzo, 
                       variante,
					   SUM(CASE WHEN isnull(scdm.FLAGAT1, '0') = '1' THEN 1 ELSE 0 END) AS SumAt1, 
                      SUM(CASE WHEN isnull(scdm.FLAGAT2, '0') = '1' THEN 1 ELSE 0 END) AS SumAt2, SUM(CASE WHEN isnull(scdm.FLAGAT3, '0') = '1' THEN 1 ELSE 0 END) 
                      AS SumAt3,
					  sum(OreLavorate) as TOreLavorate
FROM         GEM_SEZIONICONTRATTO AS SC RIGHT OUTER JOIN
                      Gem_Vista_DettMezziRapp_Varianti AS SCDM INNER JOIN
                      GEM_SEZIONECONTRATTORAPPORTI AS Rapp ON SCDM.IDRAPPORTO = Rapp.IDRAPPORTO ON SC.SEZIONECONTRATTO = Rapp.SEZIONECONTRATTO AND 
                      SC.IDCONTRATTO = Rapp.IDCONTRATTO LEFT OUTER JOIN
                      GEM_TESTACONTRATTO AS TC ON SC.IDCONTRATTO = TC.IDCONTRATTO
WHERE     (ISNULL(SCDM.ELIMINATO, '0') = '0') AND (Rapp.STATO IN ('E', 'F', 'V', 'D')) OR
                      (Rapp.STATO IN ('E', 'F', 'V', 'D')) AND (SCDM.ELIMINATO = '')
GROUP BY Rapp.DATA_EFF, Rapp.IDRAPPORTO, Rapp.TIPOLOGIARAPPORTO, Rapp.RIFCOMMCLI, Rapp.DA_FATT, TC.IDCONTRATTO, SC.idTipologMezzo, 
                      SC.CodiceMezzo,
					  Variante
HAVING      (SUM(CASE WHEN isnull(scdm.FLAGAT1, '0') = '1' THEN 1 ELSE 0 END) + SUM(CASE WHEN isnull(scdm.FLAGAT2, '0') = '1' THEN 1 ELSE 0 END) 
                      + SUM(CASE WHEN isnull(scdm.FLAGAT3, '0') = '1' THEN 1 ELSE 0 END) > 0)

					  --, 
                      --GEM_Vista_T_DeterminaAttivita.idAttivita






GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaAnalisiTotaliAttivitaVisita] TO [Metodo98]
    AS [dbo];

