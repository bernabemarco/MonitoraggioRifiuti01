CREATE VIEW dbo.GEM_24_GEMMADETTAGLIOVENDUTO
AS
SELECT     TC.IDCONTRATTO,TC.DATACONTRATTO,TC.DATAEFFICACIA, TC.CODCLIENTE,TC.CODAGENTE1,TC.CODAGENTE2,TC.CODAGENTE3, 
			SC.SEZIONECONTRATTO, SC.DESCRIZIONESEZIONE, SC.CODDEST, SC.idTipologMezzo, SC.CodiceMezzo, 
            SC.ImportoContrattoSezione, SC.ImportoVisita, SCDM.CodMezzo AS Articolo, SC.NrVisiteTot, SC.IdStrutturaOpPr, SC.Revisione, 
            SUM(SCDM.QUANTITA) AS Quantita, 
	      (CASE WHEN
            (SELECT     Primaria
             FROM          GEM_VistaAttivitaMezzi VAM
             WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 1) = 1 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT1) ELSE 0 END
           ) AS TotaleImportoAT1, 
		  (CASE WHEN
			  (SELECT     Primaria
				FROM          GEM_VistaAttivitaMezzi VAM
				WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 2) = 1 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT2) ELSE 0 END
		   ) AS TotaleImportoAT2, 
		   (CASE WHEN
			  (SELECT     Primaria
				FROM          GEM_VistaAttivitaMezzi VAM
				WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 3) = 1 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT3) ELSE 0 END
		   ) AS TotaleImportoAT3, 
		   (CASE WHEN
			  (SELECT     Primaria
				FROM          GEM_VistaAttivitaMezzi VAM
				WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 4) = 1 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT4) ELSE 0 END
			) AS TotaleImportoAT4, 
			(CASE WHEN
              (SELECT     Primaria
                FROM          GEM_VistaAttivitaMezzi VAM
                WHERE      VAM.idTipologMezzo = SC.idTipologMezzo AND VAM.Posizione = 5) = 1 THEN SUM(SCDM.QUANTITA * SCDM.IMPORTOAT5) ELSE 0 END
             ) AS TotaleImportoAT5, 
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
                            WHERE      VOP.idTipologMezzo = SC.idTipologMezzo AND VOP.IdStrutturaOpPr = SC.IdStrutturaOpPr AND VOP.Revisione = SC.Revisione) ELSE 0 END) 
                      AS TotImportoVisita, (CASE WHEN
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
                      * SC.NrVisiteTot ELSE 0 END
                 ) AS TotContratto
FROM         dbo.GEM_SEZIONICONTRATTODETTMEZZI AS SCDM LEFT OUTER JOIN
                      dbo.GEM_SEZIONICONTRATTO AS SC ON SCDM.IDCONTRATTO = SC.IDCONTRATTO AND SCDM.SEZIONECONTRATTO = SC.SEZIONECONTRATTO LEFT OUTER JOIN
                      dbo.GEM_TESTACONTRATTO AS TC ON SC.IDCONTRATTO = TC.IDCONTRATTO LEFT OUTER JOIN 
                      [GEMMADBG].[dbo].[GEM_T_ModalitaFatturazione] as MODFAT ON MODFAT.[idModFatt]= TC.idModFATT 
                     
WHERE     ((ISNULL(SCDM.ELIMINATO, '0') = '0') OR (SCDM.ELIMINATO = ''))  AND MODFAT.FatturaRateale=0 and TC.idStato <> 4  AND 
		  ((ISNULL(SC.FLAG_ELIMINATO, '0') = '0') OR (SC.FLAG_ELIMINATO = '')) AND 
		  ((ISNULL(TC.FLAG_ELIMINATO, '0') = '0') OR (TC.FLAG_ELIMINATO = '') OR (TC.FLAG_ELIMINATO = 'N')) 
GROUP BY TC.IDCONTRATTO,TC.DATACONTRATTO,TC.DATAEFFICACIA, TC.CODCLIENTE,TC.CODAGENTE1,TC.CODAGENTE2,TC.CODAGENTE3, SC.SEZIONECONTRATTO, SC.DESCRIZIONESEZIONE, SC.CODDEST, SC.idTipologMezzo, SC.CodiceMezzo, 
                      SC.ImportoContrattoSezione, SC.ImportoVisita, SCDM.CodMezzo, SC.NrVisiteTot, SC.IdStrutturaOpPr, SC.Revisione
UNION ALL
SELECT 
	TC.IDCONTRATTO,
	TC.DATACONTRATTO,
	TC.DATAEFFICACIA, 
	TC.CODCLIENTE,
	TC.CODAGENTE1,
	TC.CODAGENTE2,
	TC.CODAGENTE3,
	0 as SEZIONECONTRATTO, 
	'' as DESCRIZIONESEZIONE, 
	0 as CODDEST, 
	0 as idTipologMezzo, 
	'' as CodiceMezzo, 
    0 as ImportoContrattoSezione, 
    0 as ImportoVisita, 
    '' as  Articolo, 
    0 as NrVisiteTot, 
    0 as IdStrutturaOpPr, 
    0 as Revisione, 
    0 AS Quantita,
    0 as TotaleImportoAT1,
    0 as TotaleImportoAT2,
    0 as TotaleImportoAT3,
    0 as TotaleImportoAT4,
    0 as TotaleImportoAT5,
    TOTALE_CONTRATTO as TotImportoVisita,
    TOTALE_CONTRATTO as  TotContratto	
FROM dbo.GEM_TESTACONTRATTO AS TC  LEFT OUTER JOIN 
                      [GEMMADBG].[dbo].[GEM_T_ModalitaFatturazione] as MODFAT ON MODFAT.[idModFatt]= TC.idModFATT 
WHERE   MODFAT.FatturaRateale=1 and TC.idStato <> 4 and ((ISNULL(TC.FLAG_ELIMINATO, '0') = '0') OR (TC.FLAG_ELIMINATO = '') OR (TC.FLAG_ELIMINATO = 'N')) 

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[17] 4[19] 2[45] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'GEM_24_GEMMADETTAGLIOVENDUTO';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'GEM_24_GEMMADETTAGLIOVENDUTO';

