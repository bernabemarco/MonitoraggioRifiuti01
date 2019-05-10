
/****** Oggetto:  View [dbo].[GEM_VistaTotaliAttivita]    Data script: 03/21/2013 14:32:38 ******/
CREATE VIEW [dbo].[GEM_VistaTotaliAttivita]
AS
SELECT     SC_RDM.IDRAPPORTO, TC.IDCONTRATTO, TC.CODCLIENTE, SC.SEZIONECONTRATTO, SC.DESCRIZIONESEZIONE, SC.CODDEST, SC.idTipologMezzo, 
                      SC.CodiceMezzo, SC_RDM.CodMezzo AS Articolo, AnaArt.DESCRIZIONE AS DscArt, SC_RDM.StatoAttivita AS StAttivita, 
                      SUM(ISNULL(SC_RDM.QUANTITA, 1)) AS Quantita, 
SUM(CAST(isnull(SC_RDM.FLAGRICARICA, 0) AS smallint)) as SumFLAGRICARICA,
SUM(case when ISNULL(SC_RDM.FLAG_INST, 'N')='N' then 0 else 1 end)  as SumFlag_Inst,
(CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 1) = 1 THEN SUM(CAST(isnull(SC_RDM.flagat1, 0) AS smallint)) 
                      ELSE 0 END) AS TotCodMezziAT1, SUM(CAST(ISNULL(SC_RDM.FLAGAT1, 0) AS smallint)) AS SumFlagAt1, 
(CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 2) = 1 THEN SUM(CAST(isnull(SC_RDM.flagat2, 0) AS smallint)) 
                      ELSE 0 END) AS TotCodMezziAT2, SUM(CAST(ISNULL(SC_RDM.FLAGAT2, 0) AS smallint)) AS SumFlagAt2, 
(CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 3) = 1 THEN SUM(CAST(isnull(SC_RDM.flagat3, 0) AS smallint)) 
                      ELSE 0 END) AS TotCodMezziAT3, SUM(CAST(ISNULL(SC_RDM.FLAGAT3, 0) AS smallint)) AS SumFlagAt3, SC.REPARTO
FROM         GEM_SEZIONECONTRATTORAPPORTIMEZZI AS SC_RDM LEFT OUTER JOIN
                      ANAGRAFICAARTICOLI AS AnaArt ON SC_RDM.CodMezzo = AnaArt.CODICE LEFT OUTER JOIN
                      GEM_SEZIONICONTRATTO AS SC ON SC_RDM.IDCONTRATTO = SC.IDCONTRATTO AND 
                      SC_RDM.SEZIONECONTRATTO = SC.SEZIONECONTRATTO LEFT OUTER JOIN
                      GEM_TESTACONTRATTO AS TC ON SC.IDCONTRATTO = TC.IDCONTRATTO
WHERE    (isnull(SC_RDM.ELIMINATO,'0')='0' or isnull(SC_RDM.ELIMINATO,'0')='')
GROUP BY TC.IDCONTRATTO, TC.CODCLIENTE, SC.SEZIONECONTRATTO, SC.DESCRIZIONESEZIONE, SC.CODDEST, SC.idTipologMezzo, SC.CodiceMezzo, 
                      SC_RDM.CodMezzo, SC.REPARTO, AnaArt.DESCRIZIONE, SC_RDM.IDRAPPORTO, SC_RDM.StatoAttivita

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaTotaliAttivita] TO [Metodo98]
    AS [dbo];

