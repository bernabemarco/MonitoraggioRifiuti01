
CREATE VIEW [dbo].[GEM_VistaTotaliContrattoCollaudi]
AS
SELECT     TC.IDCONTRATTO, SCDM.SEZIONECONTRATTO, TC.CODCLIENTE, SC.idTipologMezzo, SC.CodiceMezzo, SCDM.CodMezzo AS Articolo, SC.NrVisiteTot, 
                      SC.IdStrutturaOpPr, SC.Revisione, SCDM.DATA_PCOLL AS Data_Prev, SUM(SCDM.QUANTITA) AS Quantita, (CASE WHEN
                          (SELECT     isnull(NrOperazioniTotali, 1)
                            FROM          GEM_Vista_T_TabStruttureOperazioniPrimarie VOP
                            WHERE      VOP.idTipologMezzo = SC.idTipologMezzo AND VOP.IdStrutturaOpPr = SC.IdStrutturaOpPr AND VOP.Revisione = SC.Revisione) 
                      > 0 THEN ((CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 3) = 0 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT3) ELSE 0 END))
                       /
                          (SELECT     isnull(NrOperazioniTotali, 1)
                            FROM          GEM_Vista_T_TabStruttureOperazioniPrimarie VOP
                            WHERE      VOP.idTipologMezzo = SC.idTipologMezzo AND VOP.IdStrutturaOpPr = SC.IdStrutturaOpPr AND VOP.Revisione = SC.Revisione) 
                      ELSE 0 END) AS TotImportoVisita
, 
(CASE WHEN
                          (SELECT     isnull(NrOperazioniTotali, 1)
                            FROM          GEM_Vista_T_TabStruttureOperazioniPrimarie VOP
                            WHERE      VOP.idTipologMezzo = SC.idTipologMezzo AND VOP.IdStrutturaOpPr = SC.IdStrutturaOpPr AND VOP.Revisione = SC.Revisione) 
                      > 0 THEN ((CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 3) = 0 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT3 * ISNULL(SCDM.PROV1AT3,0)/100) ELSE 0 END))
                       /
                          (SELECT     isnull(NrOperazioniTotali,1)
                            FROM          GEM_Vista_T_TabStruttureOperazioniPrimarie VOP
                            WHERE      VOP.idTipologMezzo = SC.idTipologMezzo AND VOP.IdStrutturaOpPr = SC.IdStrutturaOpPr AND VOP.Revisione = SC.Revisione) 
                      ELSE 0 END) AS TotProvvVisita
FROM         GEM_SEZIONICONTRATTODETTMEZZI AS SCDM LEFT OUTER JOIN
                      GEM_SEZIONICONTRATTO AS SC ON SCDM.IDCONTRATTO = SC.IDCONTRATTO AND 
                      SCDM.SEZIONECONTRATTO = SC.SEZIONECONTRATTO LEFT OUTER JOIN
                      GEM_TESTACONTRATTO AS TC ON SC.IDCONTRATTO = TC.IDCONTRATTO
WHERE     (ISNULL(SCDM.ELIMINATO, '0') = '0') AND (CAST(SCDM.DATA_PCOLL AS decimal(18, 5)) > 0) OR
                      (CAST(SCDM.DATA_PCOLL AS decimal(18, 5)) > 0) AND (SCDM.ELIMINATO = '')
GROUP BY TC.IDCONTRATTO, TC.CODCLIENTE, SC.idTipologMezzo, SC.CodiceMezzo, SCDM.CodMezzo, SC.NrVisiteTot, SC.IdStrutturaOpPr, SC.Revisione, 
                      SCDM.DATA_PCOLL, SCDM.SEZIONECONTRATTO

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaTotaliContrattoCollaudi] TO [Metodo98]
    AS [dbo];

