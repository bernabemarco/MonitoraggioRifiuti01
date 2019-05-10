
CREATE VIEW [dbo].[GEM_VistaTotaliContrattoComplProvvigioni]
AS
SELECT     TC.IDCONTRATTO, TC.CODCLIENTE, SC.SEZIONECONTRATTO, SC.DESCRIZIONESEZIONE, SC.CODDEST, SC.idTipologMezzo, SC.CodiceMezzo, 
                      SC.ImportoContrattoSezione, SC.ImportoVisita, SCDM.CodMezzo AS Articolo, SC.NrVisiteTot, SC.IdStrutturaOpPr, SC.Revisione, SUM(SCDM.QUANTITA) 
                      AS Quantita, 
 (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 1) = 1 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT1) ELSE 0 END) 
                      AS TotaleImportoAT1, (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 2) = 1 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT2) ELSE 0 END) 
                      AS TotaleImportoAT2, (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 3) = 1 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT3) ELSE 0 END) 
                      AS TotaleImportoAT3, (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 4) = 1 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT4) ELSE 0 END) 
                      AS TotaleImportoAT4, (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 5) = 1 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT5) ELSE 0 END) 
                      AS TotaleImportoAT5, (CASE WHEN
                          (SELECT     isnull(NrOperazioniTotali, 1)
                            FROM          GEM_Vista_T_TabStruttureOperazioniPrimarie VOP
                            WHERE      VOP.idTipologMezzo = SC.idTipologMezzo AND VOP.IdStrutturaOpPr = SC.IdStrutturaOpPr AND VOP.Revisione = SC.Revisione) 
                      > 0 THEN ((CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 1) = 1 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT1) ELSE 0 END) 
                      + (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 2) = 1 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT2) ELSE 0 END) 
                      + (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 3) = 1 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT3) ELSE 0 END) 
                      + (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 4) = 1 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT4) ELSE 0 END) 
                      + (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 5) = 1 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT5) ELSE 0 END))
                       /
                          (SELECT     isnull(NrOperazioniTotali, 1)
                            FROM          GEM_Vista_T_TabStruttureOperazioniPrimarie VOP
                            WHERE      VOP.idTipologMezzo = SC.idTipologMezzo AND VOP.IdStrutturaOpPr = SC.IdStrutturaOpPr AND VOP.Revisione = SC.Revisione) 
                      ELSE 0 END) AS TotImportoVisita, (CASE WHEN
                          (SELECT     isnull(NrOperazioniTotali, 1)
                            FROM          GEM_Vista_T_TabStruttureOperazioniPrimarie VOP
                            WHERE      VOP.idTipologMezzo = SC.idTipologMezzo AND VOP.IdStrutturaOpPr = SC.IdStrutturaOpPr AND VOP.Revisione = SC.Revisione) 
                      > 0 THEN ((CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 1) = 1 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT1) ELSE 0 END) 
                      + (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 2) = 1 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT2) ELSE 0 END) 
                      + (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 3) = 1 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT3) ELSE 0 END) 
                      + (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 4) = 1 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT4) ELSE 0 END) 
                      + (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 5) = 1 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT5) ELSE 0 END))
                       /
                          (SELECT     isnull(NrOperazioniTotali, 1)
                            FROM          GEM_Vista_T_TabStruttureOperazioniPrimarie VOP
                            WHERE      VOP.idTipologMezzo = SC.idTipologMezzo AND VOP.IdStrutturaOpPr = SC.IdStrutturaOpPr AND VOP.Revisione = SC.Revisione) 
                      * SC.NrVisiteTot ELSE 0 END) AS TotContratto,
--SCONTOAT1
--PROV1AT1
(CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 1) = 1 THEN SUM((SCDM.QUANTITA * SCDM.IMPORTOAT1*(100-isnull(SCDM.SCONTOAT1,0))/100)*isnull(SCDM.PROV1AT1,0)/100) ELSE 0 END) 
                      AS TotaleProvvigioneAT1, (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 2) = 1 THEN SUM((SCDM.QUANTITA * SCDM.IMPORTOAT2*(100-isnull(SCDM.SCONTOAT2,0))/100)*isnull(SCDM.PROV1AT2,0)/100) ELSE 0 END) 
                      AS TotaleProvvigioneAT2, (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 3) = 1 THEN SUM((SCDM.QUANTITA * SCDM.IMPORTOAT3*(100-isnull(SCDM.SCONTOAT3,0))/100)*isnull(SCDM.PROV1AT3,0)/100) ELSE 0 END) 
                      AS TotaleProvvigioneAT3, (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 4) = 1 THEN SUM((SCDM.QUANTITA * SCDM.IMPORTOAT4*(100-isnull(SCDM.SCONTOAT4,0))/100)*isnull(SCDM.PROV1AT4,0)/100) ELSE 0 END) 
                      AS TotaleProvvigioneAT4, (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 5) = 1 THEN SUM((SCDM.QUANTITA * SCDM.IMPORTOAT5*(100-isnull(SCDM.SCONTOAT5,0))/100)*isnull(SCDM.PROV1AT5,0)/100) ELSE 0 END) 
                      AS TotaleProvvigioneAT5, (CASE WHEN
                          (SELECT     isnull(NrOperazioniTotali, 1)
                            FROM          GEM_Vista_T_TabStruttureOperazioniPrimarie VOP
                            WHERE      VOP.idTipologMezzo = SC.idTipologMezzo AND VOP.IdStrutturaOpPr = SC.IdStrutturaOpPr AND VOP.Revisione = SC.Revisione) 
                      > 0 THEN ((CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 1) = 1 THEN SUM((SCDM.QUANTITA * SCDM.IMPORTOAT1*(100-isnull(SCDM.SCONTOAT1,0))/100)*isnull(SCDM.PROV1AT1,0)/100) ELSE 0 END) 
                      + (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 2) = 1 THEN SUM((SCDM.QUANTITA * SCDM.IMPORTOAT2*(100-isnull(SCDM.SCONTOAT2,0))/100)*isnull(SCDM.PROV1AT2,0)/100) ELSE 0 END) 
                      + (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 3) = 1 THEN SUM((SCDM.QUANTITA * SCDM.IMPORTOAT3*(100-isnull(SCDM.SCONTOAT3,0))/100)*isnull(SCDM.PROV1AT3,0)/100) ELSE 0 END) 
                      + (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 4) = 1 THEN SUM((SCDM.QUANTITA * SCDM.IMPORTOAT4*(100-isnull(SCDM.SCONTOAT4,0))/100)*isnull(SCDM.PROV1AT4,0)/100) ELSE 0 END) 
                      + (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 5) = 1 THEN SUM((SCDM.QUANTITA * SCDM.IMPORTOAT5*(100-isnull(SCDM.SCONTOAT5,0))/100)*isnull(SCDM.PROV1AT5,0)/100) ELSE 0 END))
                       /
                          (SELECT     isnull(NrOperazioniTotali, 1)
                            FROM          GEM_Vista_T_TabStruttureOperazioniPrimarie VOP
                            WHERE      VOP.idTipologMezzo = SC.idTipologMezzo AND VOP.IdStrutturaOpPr = SC.IdStrutturaOpPr AND VOP.Revisione = SC.Revisione) 
                      ELSE 0 END) AS TotProvvigioneVisita, (CASE WHEN
                          (SELECT     isnull(NrOperazioniTotali, 1)
                            FROM          GEM_Vista_T_TabStruttureOperazioniPrimarie VOP
                            WHERE      VOP.idTipologMezzo = SC.idTipologMezzo AND VOP.IdStrutturaOpPr = SC.IdStrutturaOpPr AND VOP.Revisione = SC.Revisione) 
                      > 0 THEN ((CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 1) = 1 THEN SUM((SCDM.QUANTITA * SCDM.IMPORTOAT1*(100-isnull(SCDM.SCONTOAT1,0))/100)*isnull(SCDM.PROV1AT1,0)/100) ELSE 0 END) 
                      + (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 2) = 1 THEN SUM((SCDM.QUANTITA * SCDM.IMPORTOAT2*(100-isnull(SCDM.SCONTOAT2,0))/100)*isnull(SCDM.PROV1AT2,0)/100) ELSE 0 END) 
                      + (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 3) = 1 THEN SUM((SCDM.QUANTITA * SCDM.IMPORTOAT3*(100-isnull(SCDM.SCONTOAT3,0))/100)*isnull(SCDM.PROV1AT3,0)/100) ELSE 0 END) 
                      + (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 4) = 1 THEN SUM((SCDM.QUANTITA * SCDM.IMPORTOAT4*(100-isnull(SCDM.SCONTOAT4,0))/100)*isnull(SCDM.PROV1AT4,0)/100) ELSE 0 END) 
                      + (CASE WHEN
                          (SELECT     Primaria
                            FROM          GEM_VistaAttivitaMezzi VAM
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 5) = 1 THEN SUM((SCDM.QUANTITA * SCDM.IMPORTOAT5*(100-isnull(SCDM.SCONTOAT5,0))/100)*isnull(SCDM.PROV1AT5,0)/100) ELSE 0 END))
                       /
                          (SELECT     isnull(NrOperazioniTotali, 1)
                            FROM          GEM_Vista_T_TabStruttureOperazioniPrimarie VOP
                            WHERE      VOP.idTipologMezzo = SC.idTipologMezzo AND VOP.IdStrutturaOpPr = SC.IdStrutturaOpPr AND VOP.Revisione = SC.Revisione) 
                      * SC.NrVisiteTot ELSE 0 END) AS TotProvvivioneContratto
FROM         dbo.GEM_SEZIONICONTRATTODETTMEZZI AS SCDM LEFT OUTER JOIN
                      dbo.GEM_SEZIONICONTRATTO AS SC ON SCDM.IDCONTRATTO = SC.IDCONTRATTO AND 
                      SCDM.SEZIONECONTRATTO = SC.SEZIONECONTRATTO LEFT OUTER JOIN
                      dbo.GEM_TESTACONTRATTO AS TC ON SC.IDCONTRATTO = TC.IDCONTRATTO
WHERE     ((isnull(SCDM.ELIMINATO, '0') = '0') or SCDM.ELIMINATO='')
GROUP BY TC.IDCONTRATTO, TC.CODCLIENTE, SC.SEZIONECONTRATTO, SC.DESCRIZIONESEZIONE, SC.CODDEST, SC.idTipologMezzo, SC.CodiceMezzo, 
                      SC.ImportoContrattoSezione, SC.ImportoVisita, SCDM.CodMezzo, SC.NrVisiteTot, SC.IdStrutturaOpPr, SC.Revisione

GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_VistaTotaliContrattoComplProvvigioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_VistaTotaliContrattoComplProvvigioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_VistaTotaliContrattoComplProvvigioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaTotaliContrattoComplProvvigioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_VistaTotaliContrattoComplProvvigioni] TO [Metodo98]
    AS [dbo];

