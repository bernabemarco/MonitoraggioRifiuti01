CREATE VIEW dbo.Biri_AnalisiAnomalieRDO
AS
SELECT        sc.SEZIONECONTRATTO, sc.CodiceMezzo, sc.REPARTO, CASE isnull(sc.coddest, 0) WHEN 0 THEN
                             (SELECT        a.dscconto1
                               FROM            dbo.GEM_TESTACONTRATTO cr INNER JOIN
                                                         anagraficaCF a ON cr.IDCONTRATTO = t .IDCONTRATTO AND cr.CODCLIENTE = a.codconto) ELSE
                             (SELECT        i.ragioneSociale
                               FROM            destinazionidiverse i
                               WHERE        i.CODCONTO = t .CODCLIENTE AND i.CODICE = sc.CODDEST) END AS SedeRagSoc, CASE isnull(sc.coddest, 0) WHEN 0 THEN
                             (SELECT        a.Indirizzo
                               FROM            dbo.GEM_TESTACONTRATTO cr INNER JOIN
                                                         anagraficaCF a ON cr.IDCONTRATTO = t .IDCONTRATTO AND cr.CODCLIENTE = a.codconto) ELSE
                             (SELECT        i.Indirizzo
                               FROM            destinazionidiverse i
                               WHERE        i.CODCONTO = t .CODCLIENTE AND i.CODICE = sc.CODDEST) END AS SedeIndirizzo, CASE isnull(sc.coddest, 0) WHEN 0 THEN
                             (SELECT        a.Localita
                               FROM            dbo.GEM_TESTACONTRATTO cr INNER JOIN
                                                         anagraficaCF a ON cr.IDCONTRATTO = t .IDCONTRATTO AND cr.CODCLIENTE = a.codconto) ELSE
                             (SELECT        i.Localita
                               FROM            destinazionidiverse i
                               WHERE        i.CODCONTO = t .CODCLIENTE AND i.CODICE = sc.CODDEST) END AS SedeLocalita, CASE isnull(sc.coddest, 0) WHEN 0 THEN
                             (SELECT        a.Provincia
                               FROM            dbo.GEM_TESTACONTRATTO cr INNER JOIN
                                                         anagraficaCF a ON cr.IDCONTRATTO = t .IDCONTRATTO AND cr.CODCLIENTE = a.codconto) ELSE
                             (SELECT        i.Provincia
                               FROM            destinazionidiverse i
                               WHERE        i.CODCONTO = t .CODCLIENTE AND i.CODICE = sc.CODDEST) END AS SedeProvincia, dm.IdRigaMezzo, AnaArt.DESCRIZIONE AS DscCodMezzoDM, 
                         dm.UBICAZIONE, dm.POSCLIENTE, dm.NOTE AS NOTE_DM, dm.CarTesto7, dm.IDRAPPORTO, agetr.DSCAGENTE AS DescTecnicoEff, rp.DATA_EFF, 
                         TTabAnomalie.DscAnomalia AS TTabDscAnomalie, TTabLivelloRischio.DscLivelloRischio, DM_Anomalie.Note AS DM_AnomalieNote, 
                         TStAnomalia.DESCRIZIONE AS DscStatoAnomalia, DM_Anomalie.DataApertura, DM_Anomalie.Eliminato, RDO.ID AS IDRDOTECNICO, 
                         RDO.SOLUZIONE AS SOLUZIONEPROPOSTA
FROM            dbo.GEM_T_TAB_ANOMALIE AS TTabAnomalie INNER JOIN
                         dbo.GEM_SEZIONECONTRATTORAPPORTIMEZZI_Anomalie AS DM_Anomalie ON TTabAnomalie.idAnomalia = DM_Anomalie.idAnomalia INNER JOIN
                         dbo.GEM_SEZIONECONTRATTORAPPORTIMEZZI AS dm ON DM_Anomalie.IDCONTRATTO = dm.IDCONTRATTO AND 
                         DM_Anomalie.SEZIONECONTRATTO = dm.SEZIONECONTRATTO AND DM_Anomalie.IdRapporto = dm.IDRAPPORTO AND 
                         DM_Anomalie.IdRigaMezzo = dm.IdRigaMezzo INNER JOIN
                         dbo.GEM_TESTACONTRATTO AS t INNER JOIN
                         dbo.GEM_SEZIONICONTRATTO AS sc ON t.IDCONTRATTO = sc.IDCONTRATTO INNER JOIN
                         dbo.GEM_Vista_TipologMezzo AS tm ON sc.idTipologMezzo = tm.idTipologMezzo INNER JOIN
                         dbo.GEM_SEZIONECONTRATTORAPPORTI AS rp ON sc.IDCONTRATTO = rp.IDCONTRATTO AND sc.SEZIONECONTRATTO = rp.SEZIONECONTRATTO ON 
                         dm.SEZIONECONTRATTO = rp.SEZIONECONTRATTO AND dm.IDCONTRATTO = rp.IDCONTRATTO AND dm.IDRAPPORTO = rp.IDRAPPORTO INNER JOIN
                         dbo.ANAGRAFICAARTICOLI AS AnaArt ON dm.CodMezzo = AnaArt.CODICE LEFT OUTER JOIN
                             (SELECT        ID, ID_RAPPORTO, ID_CONTRATTO, SEZIONE_CONTRATTO, AZRIF, PROGRESSIVO, ID_RIGA_MEZZO, ANOMALIA, SOLUZIONE, FLG_AUTOMEZZO, 
                                                         FLG_MULETTO, FLG_SCARICO, FLG_SMALTIMENTO, FLG_CERTIFICAZIONE, FLG_PIATTAFORMA, GG_PIATTAFORMA, NOTA_PIATTAFORMA, STATO, 
                                                         ELIMINATO, UTENTE_MODIFICA, DATA_MODIFICA, DATA_CREAZIONE, DATA_SYNC, DATA_PROCESS, NOTA_PROCESS, DATA_PIANIFICAZIONE, 
                                                         DURATA_ESECUZIONE, DATA_CHIUSURA
                               FROM            GEMMASYNC.dbo.RDO_RICHIESTA) AS RDO ON dm.IDCONTRATTO = RDO.ID_CONTRATTO COLLATE SQL_Latin1_General_CP1_CI_AS AND 
                         dm.SEZIONECONTRATTO = RDO.SEZIONE_CONTRATTO AND dm.IDRAPPORTO = RDO.ID_RAPPORTO COLLATE SQL_Latin1_General_CP1_CI_AS AND 
                         dm.IdRigaMezzo = RDO.ID_RIGA_MEZZO LEFT OUTER JOIN
                         dbo.GEM_T_TAB_STATOAnomalie AS TStAnomalia ON DM_Anomalie.idStatoAnomalia = TStAnomalia.CODICE LEFT OUTER JOIN
                         dbo.GEM_T_TAB_LivelloRischio AS TTabLivelloRischio ON TTabAnomalie.idLivelloRischio = TTabLivelloRischio.idLivelloRischio LEFT OUTER JOIN
                         dbo.VISTACLIENTI AS vCli ON t.CODCLIENTE = vCli.CODCONTO LEFT OUTER JOIN
                         dbo.ANAGRAFICAAGENTI AS agetr ON rp.TECNICO_EFF = agetr.CODAGENTE
WHERE        (DM_Anomalie.idStatoAnomalia = '2') AND (MONTH(rp.DATA_EFF) = MONTH(GETDATE()) - 1) AND (YEAR(rp.DATA_EFF) = YEAR(GETDATE()))

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[28] 4[33] 2[14] 3) )"
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
         Configuration = "(H (4[30] 2[40] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2[66] 3) )"
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
      ActivePaneConfig = 5
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TTabAnomalie"
            Begin Extent = 
               Top = 6
               Left = 828
               Bottom = 135
               Right = 1019
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DM_Anomalie"
            Begin Extent = 
               Top = 6
               Left = 1057
               Bottom = 135
               Right = 1263
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dm"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 267
               Right = 268
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 138
               Left = 306
               Bottom = 267
               Right = 555
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "sc"
            Begin Extent = 
               Top = 138
               Left = 593
               Bottom = 267
               Right = 827
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tm"
            Begin Extent = 
               Top = 138
               Left = 865
               Bottom = 267
               Right = 1088
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "rp"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 399
               Right = 295
            End
            DisplayFlag', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Biri_AnalisiAnomalieRDO';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N's = 280
            TopColumn = 0
         End
         Begin Table = "AnaArt"
            Begin Extent = 
               Top = 270
               Left = 333
               Bottom = 399
               Right = 585
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "RDO"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TStAnomalia"
            Begin Extent = 
               Top = 138
               Left = 1126
               Bottom = 267
               Right = 1317
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TTabLivelloRischio"
            Begin Extent = 
               Top = 270
               Left = 623
               Bottom = 399
               Right = 814
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vCli"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 531
               Right = 264
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "agetr"
            Begin Extent = 
               Top = 6
               Left = 322
               Bottom = 135
               Right = 537
            End
            DisplayFlags = 280
            TopColumn = 0
         End
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
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 3630
         Alias = 3450
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 4740
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Biri_AnalisiAnomalieRDO';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Biri_AnalisiAnomalieRDO';

