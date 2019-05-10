





CREATE VIEW [dbo].[GEM_Vista_CalcoloValoriContratti]
AS
SELECT     year(tc.DATAPVISITA) PrimoEserciziocontratto, 
tc.DATAPVISITA, tc.DURATA, TC.IDCONTRATTO,  TC.DATACONTRATTO, TC.DATAEFFICACIA,
tc.CODCategoriaContratto,
TC.DATASCADENZA,
TC.RINNOVOAUT,
 TC.CODCLIENTE, TC.IdStato, tc.DataIdStato, TC.CodAgente1, TC.CodAgente2, TC.CodAgente3, SC.SEZIONECONTRATTO, 
                      SC.DESCRIZIONESEZIONE, SC.CODDEST, SC.idTipologMezzo, SC.CodiceMezzo, 
					  SC.ImportoContrattoSezione, SC.ImportoVisita, SCDM.CodMezzo AS Articolo, 
                      SC.NrVisiteTot, SC.IdStrutturaOpPr, SC.Revisione, SUM(SCDM.QUANTITA) AS Quantita, (CASE WHEN
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
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 5) = 1 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT5) ELSE 0 END)) /
                          (SELECT     isnull(NrOperazioniTotali, 1)
                            FROM          GEM_Vista_T_TabStruttureOperazioniPrimarie VOP
                            WHERE      VOP.idTipologMezzo = SC.idTipologMezzo AND VOP.IdStrutturaOpPr = SC.IdStrutturaOpPr AND VOP.Revisione = SC.Revisione) ELSE 0 END) 
                      AS TotImportoVisita, 
					  (CASE WHEN
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
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 5) = 1 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT5) ELSE 0 END)) /
                          (SELECT     isnull(NrOperazioniTotali, 1)
                            FROM          GEM_Vista_T_TabStruttureOperazioniPrimarie VOP
                            WHERE      VOP.idTipologMezzo = SC.idTipologMezzo AND VOP.IdStrutturaOpPr = SC.IdStrutturaOpPr AND VOP.Revisione = SC.Revisione) 
                      * SC.NrVisiteTot ELSE 0 END) AS TotContratto, 
					  (CASE WHEN
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
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 5) = 1 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT5) ELSE 0 END)) /
                          (SELECT     isnull(NrOperazioniTotali, 1)
                            FROM          GEM_Vista_T_TabStruttureOperazioniPrimarie VOP
                            WHERE      VOP.idTipologMezzo = SC.idTipologMezzo AND VOP.IdStrutturaOpPr = SC.IdStrutturaOpPr AND VOP.Revisione = SC.Revisione) 
                      * SC.NrVisiteTot ELSE 0 END)/tc.DURATA AS
					  ValoreRateoMensile,
					  (case when 
					  (tc.DURATA>=12) -- condizione inserita per i contratti inferiore ai 12 mesi --
					  then
					  (
					  (13-month(tc.DATAPVISITA))
					  *
					  --valore contratto -- 
					  (CASE WHEN
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
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 5) = 1 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT5) ELSE 0 END)) /
                          (SELECT     isnull(NrOperazioniTotali, 1)
                            FROM          GEM_Vista_T_TabStruttureOperazioniPrimarie VOP
                            WHERE      VOP.idTipologMezzo = SC.idTipologMezzo AND VOP.IdStrutturaOpPr = SC.IdStrutturaOpPr AND VOP.Revisione = SC.Revisione) 
                      * SC.NrVisiteTot ELSE 0 END)
					  /
					  tc.DURATA
					  )
					  else
					  					  --valore contratto -- 
					  (CASE WHEN
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
                            WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 5) = 1 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT5) ELSE 0 END)) /
                          (SELECT     isnull(NrOperazioniTotali, 1)
                            FROM          GEM_Vista_T_TabStruttureOperazioniPrimarie VOP
                            WHERE      VOP.idTipologMezzo = SC.idTipologMezzo AND VOP.IdStrutturaOpPr = SC.IdStrutturaOpPr AND VOP.Revisione = SC.Revisione) 
                      * SC.NrVisiteTot ELSE 0 END)
					  --* tc.DURATA
					  end
					  )
					  as ValoreRateoPrimoEsercizio,
					  MAX(GEM_Vista_PrimoContrattoManutenzione.NuovoCli) AS NuovoContratto,
					  tc.PCONTR, tc.CONTRORIG, tc.RIN_PCONTR,
					  -- OrigineCommContratto old --
					  --(CASE WHEN (MAX(GEM_Vista_PrimoContrattoManutenzione.NuovoCli))=0 
					  --then 
					--		(case when (len(PCONTR)+len(CONTRORIG)+len(RIN_PCONTR))=0 
						--	Then 'I'
						--	else 'R'
						--	end)
					 -- else
						--'N'
					 -- end)
					  --AS OrigineCommContratto
					  ------------------------------
					  -- OrigineCommContratto new 16.01.2018 --
					  (case when (len(PCONTR)+len(CONTRORIG)+len(RIN_PCONTR))=0 
					  then (CASE WHEN (MAX(GEM_Vista_PrimoContrattoManutenzione.NuovoCli))=0 
							then 'I'
							else 'N'
							end)
					  else
							'R'
					 end) AS OrigineCommContratto
FROM         GEM_Vista_PrimoContrattoManutenzione RIGHT OUTER JOIN
                      GEM_TESTACONTRATTO AS TC ON GEM_Vista_PrimoContrattoManutenzione.IDCONTRATTO = TC.IDCONTRATTO RIGHT OUTER JOIN
                      GEM_SEZIONICONTRATTODETTMEZZI AS SCDM LEFT OUTER JOIN
                      GEM_SEZIONICONTRATTO AS SC ON SCDM.IDCONTRATTO = SC.IDCONTRATTO AND SCDM.SEZIONECONTRATTO = SC.SEZIONECONTRATTO ON 
                      TC.IDCONTRATTO = SC.IDCONTRATTO LEFT OUTER JOIN
                      GEMMADBG.dbo.GEM_T_ModalitaFatturazione AS MODFAT ON MODFAT.idModFatt = TC.idModFatt

WHERE  tc.durata<>0
and    (ISNULL(SCDM.ELIMINATO, '0') = '0') AND (MODFAT.FatturaRateale = 0) 
--AND (TC.IdStato <> 4) 
AND (ISNULL(SC.FLAG_ELIMINATO, '0') in ('', '0', 'N')) AND 
                      (ISNULL(TC.FLAG_ELIMINATO, '0') = '0') OR
                      (MODFAT.FatturaRateale = 0) 
					  --AND (TC.IdStato <> 4) 
					  AND (ISNULL(SC.FLAG_ELIMINATO, '0') = '0') AND (ISNULL(TC.FLAG_ELIMINATO, '0') = '0') AND 
                      (SCDM.ELIMINATO = '') OR
                      (ISNULL(SCDM.ELIMINATO, '0') = '0') AND (MODFAT.FatturaRateale = 0) 
					  --AND (TC.IdStato <> 4) 
					  AND (ISNULL(TC.FLAG_ELIMINATO, '0') = '0') AND 
                      (SC.FLAG_ELIMINATO = '') OR
                      (MODFAT.FatturaRateale = 0) --AND (TC.IdStato <> 4) 
					  AND (ISNULL(TC.FLAG_ELIMINATO, '0') = '0') AND (SCDM.ELIMINATO = '') AND (SC.FLAG_ELIMINATO = '') OR
                      (ISNULL(SCDM.ELIMINATO, '0') = '0') AND (MODFAT.FatturaRateale = 0) AND (TC.IdStato <> 4) AND (ISNULL(SC.FLAG_ELIMINATO, '0') = '0') AND 
                      (TC.FLAG_ELIMINATO = '') OR
                      (MODFAT.FatturaRateale = 0) --AND (TC.IdStato <> 4) 
					  AND (ISNULL(SC.FLAG_ELIMINATO, '0') = '0') AND (SCDM.ELIMINATO = '') AND (TC.FLAG_ELIMINATO = '') OR
                      (ISNULL(SCDM.ELIMINATO, '0') = '0') AND (MODFAT.FatturaRateale = 0) 
					  --AND (TC.IdStato <> 4) 
					  AND (SC.FLAG_ELIMINATO = '') AND (TC.FLAG_ELIMINATO = '') OR
                      (MODFAT.FatturaRateale = 0) 
					  --AND (TC.IdStato <> 4) 
					  AND (SCDM.ELIMINATO = '') AND (SC.FLAG_ELIMINATO = '') AND (TC.FLAG_ELIMINATO = '') OR
                      (ISNULL(SCDM.ELIMINATO, '0') = '0') AND (MODFAT.FatturaRateale = 0) 
					  --AND (TC.IdStato <> 4) 
					  AND (ISNULL(SC.FLAG_ELIMINATO, '0') = '0') AND 
                      (TC.FLAG_ELIMINATO = 'N') OR
                      (MODFAT.FatturaRateale = 0) 
					  --AND (TC.IdStato <> 4) 
					  AND (ISNULL(SC.FLAG_ELIMINATO, '0') = '0') AND (SCDM.ELIMINATO = '') AND (TC.FLAG_ELIMINATO = 'N') OR
                      (ISNULL(SCDM.ELIMINATO, '0') = '0') AND (MODFAT.FatturaRateale = 0) 
					  --AND (TC.IdStato <> 4) 
					  AND (SC.FLAG_ELIMINATO = '') AND (TC.FLAG_ELIMINATO = 'N') OR
                      (MODFAT.FatturaRateale = 0) 
					  --AND (TC.IdStato <> 4) 
					  AND (SCDM.ELIMINATO = '') AND (SC.FLAG_ELIMINATO = '') AND (TC.FLAG_ELIMINATO = 'N')


GROUP BY tc.DATAPVISITA, TC.IDCONTRATTO, 

TC.DATACONTRATTO, TC.DATAEFFICACIA, tc.CODCategoriaContratto,
TC.DATASCADENZA, TC.RINNOVOAUT,
 TC.CODCLIENTE, TC.IdStato, tc.DataIdStato, TC.CodAgente1, TC.CodAgente2, TC.CodAgente3, 
                      SC.SEZIONECONTRATTO, SC.DESCRIZIONESEZIONE, SC.CODDEST, SC.idTipologMezzo, SC.CodiceMezzo, SC.ImportoContrattoSezione, SC.ImportoVisita, 
                      SCDM.CodMezzo, SC.NrVisiteTot, SC.IdStrutturaOpPr, SC.Revisione
					  ,tc.DURATA,
					  tc.PCONTR, tc.CONTRORIG, tc.RIN_PCONTR
UNION ALL
SELECT    year(tc.DATAPVISITA) PrimoEserciziocontratto
,tc.DATAPVISITA, tc.DURATA, TC.IDCONTRATTO,

TC.DATACONTRATTO, TC.DATAEFFICACIA, tc.CODCategoriaContratto, 
TC.DATASCADENZA, TC.RINNOVOAUT,
TC.CODCLIENTE,
 
TC.IdStato, tc.DataIdStato, TC.CodAgente1, TC.CodAgente2, TC.CodAgente3, 
                      0 AS SEZIONECONTRATTO, '' AS DESCRIZIONESEZIONE, 0 AS CODDEST, 0 AS idTipologMezzo, '' AS CodiceMezzo, 0 AS ImportoContrattoSezione, 0 AS ImportoVisita, 
                      GEM_ContrPFatturazione.CodiceFatturazione AS Articolo, 0 AS NrVisiteTot, 0 AS IdStrutturaOpPr, 0 AS Revisione, 0 AS Quantita, 0 AS TotaleImportoAT1, 
                      0 AS TotaleImportoAT2, 0 AS TotaleImportoAT3, 0 AS TotaleImportoAT4, 0 AS TotaleImportoAT5, SUM(TC_Rate.IMPRATASFS) AS TotImportoVisita, 
                      SUM(TC_Rate.IMPRATASFS) AS TotContratto, 
					  SUM(TC_Rate.IMPRATASFS)/tc.Durata
					  AS
					  ValoreRateoMensile,
					  (case when 
					  (tc.DURATA>=12) -- condizione inserita per i contratti inferiore ai 12 mesi --
					  then
					  (
					  (12-month(tc.DATAPVISITA))
					  *
					  SUM(TC_Rate.IMPRATASFS)
					  /
					  tc.DURATA)
					  else
					  (SUM(TC_Rate.IMPRATASFS))
					  end
					  )
					  as ValoreRateoPrimoEsercizio,
					  MAX(GEM_Vista_PrimoContrattoManutenzione.NuovoCli) AS NuovoContratto,
					  tc.PCONTR, tc.CONTRORIG, tc.RIN_PCONTR,
					  -- OrigineCommContratto old --
					  --(CASE WHEN (MAX(GEM_Vista_PrimoContrattoManutenzione.NuovoCli))=0 
					  --then 
					--		(case when (len(PCONTR)+len(CONTRORIG)+len(RIN_PCONTR))=0 
						--	Then 'I'
						--	else 'R'
						--	end)
					 -- else
						--'N'
					 -- end)
					  --AS OrigineCommContratto
					  ------------------------------
					  -- OrigineCommContratto new 16.01.2018 --
					  (case when (len(PCONTR)+len(CONTRORIG)+len(RIN_PCONTR))=0 
					  then (CASE WHEN (MAX(GEM_Vista_PrimoContrattoManutenzione.NuovoCli))=0 
							then 'I'
							else 'N'
							end)
					  else
							'R'
					 end) AS OrigineCommContratto
FROM         GEM_TESTACONTRATTO AS TC INNER JOIN
                      GEM_SEZIONECONTRATTO_RATE AS TC_Rate ON TC.IDCONTRATTO = TC_Rate.IDCONTRATTO INNER JOIN
                      GEM_ContrPFatturazione ON TC.idModFatt = GEM_ContrPFatturazione.idModFatt LEFT OUTER JOIN
                      GEM_Vista_PrimoContrattoManutenzione ON TC.IDCONTRATTO = GEM_Vista_PrimoContrattoManutenzione.IDCONTRATTO LEFT OUTER JOIN
                      GEMMADBG.dbo.GEM_T_ModalitaFatturazione AS MODFAT ON MODFAT.idModFatt = TC.idModFatt
WHERE     (MODFAT.FatturaRateale = 1) 
AND (TC_Rate.STATO <> 'A') 
AND (ISNULL(TC_Rate.ELIMINATO, '0') = '0') 
-- includiamo tutti i contratti a prescindere in questa vista di calcolo 
--AND (TC.IdStato = 4) 
and TC.DURATA<>0
--and VC.CODCategoriaContratto<>50
AND (ISNULL(TC.FLAG_ELIMINATO, '0') 
                     = '0') 
--	and (ISNULL(SC.FLAG_ELIMINATO, '0') in ('', '0', 'N'))				  
					  OR
                      (MODFAT.FatturaRateale = 1) --AND (TC.IdStato <> 4)
					   AND (TC.FLAG_ELIMINATO = '') OR
                      (MODFAT.FatturaRateale = 1) --AND (TC.IdStato <> 4) 
					  AND (TC.FLAG_ELIMINATO = 'N')
GROUP BY tc.DATAPVISITA, 

TC.IDCONTRATTO, TC.DATACONTRATTO, TC.DATAEFFICACIA, tc.CODCategoriaContratto, 
TC.DATASCADENZA, TC.RINNOVOAUT,
TC.CODCLIENTE, TC.IdStato, tc.DataIdStato, TC.CodAgente1, TC.CodAgente2, TC.CodAgente3, 
                      GEM_ContrPFatturazione.CodiceFatturazione, tc.DURATA,
					  tc.PCONTR, tc.CONTRORIG, tc.RIN_PCONTR









GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_Vista_CalcoloValoriContratti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_Vista_CalcoloValoriContratti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_Vista_CalcoloValoriContratti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_CalcoloValoriContratti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_Vista_CalcoloValoriContratti] TO [Metodo98]
    AS [dbo];

