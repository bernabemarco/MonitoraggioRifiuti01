
CREATE VIEW [dbo].[GEM_VistaTEMP_STP_AnalisiConsistenze1]
AS
SELECT     TC.IDCONTRATTO, TC.CODCLIENTE, SC.SEZIONECONTRATTO, SC.DESCRIZIONESEZIONE, SC.CODDEST, SC.idTipologMezzo, SC.CodiceMezzo, 
                      SC.ImportoContrattoSezione, SC.ImportoVisita, SCDM.CodMezzo AS Articolo, SC.NrVisiteTot, SC.IdStrutturaOpPr, SC.Revisione, SUM(SCDM.QUANTITA) 
                      AS Quantita, (CASE WHEN
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
                      * SC.NrVisiteTot ELSE 0 END) AS TotContratto, tempAC.UTENTEMODIFICA
FROM         GEM_SEZIONICONTRATTODETTMEZZI AS SCDM INNER JOIN
                      GEM_TEMP_STP_AnalisiConsistenze1 tempAC ON SCDM.IDCONTRATTO = tempAC.IDCONTRATTO AND 
                      SCDM.SEZIONECONTRATTO = tempAC.SEZIONECONTRATTO AND 
                      SCDM.IdRigaMezzo = tempAC.IdRigaMezzo LEFT OUTER JOIN
                      GEM_SEZIONICONTRATTO AS SC ON SCDM.IDCONTRATTO = SC.IDCONTRATTO AND 
                      SCDM.SEZIONECONTRATTO = SC.SEZIONECONTRATTO LEFT OUTER JOIN
                      GEM_TESTACONTRATTO AS TC ON SC.IDCONTRATTO = TC.IDCONTRATTO
GROUP BY TC.IDCONTRATTO, TC.CODCLIENTE, SC.SEZIONECONTRATTO, SC.DESCRIZIONESEZIONE, SC.CODDEST, SC.idTipologMezzo, SC.CodiceMezzo, 
                      SC.ImportoContrattoSezione, SC.ImportoVisita, SCDM.CodMezzo, SC.NrVisiteTot, SC.IdStrutturaOpPr, SC.Revisione, 
                      tempAC.UTENTEMODIFICA

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaTEMP_STP_AnalisiConsistenze1] TO [Metodo98]
    AS [dbo];

