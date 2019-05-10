
CREATE VIEW [dbo].[GEM_VistaConsuntivoAttivitaEseguite]
AS
SELECT     SC_RDM.IDRAPPORTO, TC.IDCONTRATTO, TC.CODCLIENTE, SC.SEZIONECONTRATTO, SC.DESCRIZIONESEZIONE, SC.CODDEST, SC.idTipologMezzo, 
                      SC.CodiceMezzo, ISNULL(SC_RDM.StatoAttivita, 0) AS StAttivita, SUM(ISNULL(SC_RDM.QUANTITA, 1)) AS Quantita, (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 1) = 1 THEN SUM(CAST(isnull(SC_RDM.flagat1, 0) AS smallint)) 
                      ELSE 0 END) AS TotCodMezziAT1, SUM(CAST(ISNULL(SC_RDM.FLAGAT1, 0) AS smallint)) AS SumFlagAt1, (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 2) = 1 THEN SUM(CAST(isnull(SC_RDM.flagat2, 0) AS smallint)) 
                      ELSE 0 END) AS TotCodMezziAT2, SUM(CAST(ISNULL(SC_RDM.FLAGAT2, 0) AS smallint)) AS SumFlagAt2, (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 3) = 1 THEN SUM(CAST(isnull(SC_RDM.flagat3, 0) AS smallint)) 
                      ELSE 0 END) AS TotCodMezziAT3, SUM(CAST(ISNULL(SC_RDM.FLAGAT3, 0) AS smallint)) AS SumFlagAt3, SC.REPARTO
FROM         GEM_SEZIONECONTRATTORAPPORTIMEZZI AS SC_RDM LEFT OUTER JOIN
                      ANAGRAFICAARTICOLI AS AnaArt ON SC_RDM.CodMezzo = AnaArt.CODICE LEFT OUTER JOIN
                      GEM_SEZIONICONTRATTO AS SC ON SC_RDM.IDCONTRATTO = SC.IDCONTRATTO AND 
                      SC_RDM.SEZIONECONTRATTO = SC.SEZIONECONTRATTO LEFT OUTER JOIN
                      GEM_TESTACONTRATTO AS TC ON SC.IDCONTRATTO = TC.IDCONTRATTO
WHERE     (ISNULL(SC_RDM.ELIMINATO, '0') = '0') OR
                      (ISNULL(SC_RDM.ELIMINATO, '0') = '')
GROUP BY TC.IDCONTRATTO, TC.CODCLIENTE, SC.SEZIONECONTRATTO, SC.DESCRIZIONESEZIONE, SC.CODDEST, SC.idTipologMezzo, SC.CodiceMezzo, 
                      SC.REPARTO, SC_RDM.IDRAPPORTO, ISNULL(SC_RDM.StatoAttivita, 0)
HAVING      (ISNULL(SC_RDM.StatoAttivita, 0) = 1)

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaConsuntivoAttivitaEseguite] TO [Metodo98]
    AS [dbo];

