CREATE VIEW dbo.[MB_Export_Service_Ritardi]
AS
SELECT        DATEDIFF(month, dbo.GEM_SEZIONECONTRATTORAPPORTI.DATA_PREV, dbo.GEM_SEZIONECONTRATTORAPPORTI.DATA_EFF) AS MesiScostamento, 
                         DATEPART(month, dbo.GEM_SEZIONECONTRATTORAPPORTI.DATA_PREV) AS MesePrevisto, DATEPART(month, 
                         dbo.GEM_SEZIONECONTRATTORAPPORTI.DATA_EFF) AS MeseEffettivo, dbo.EXTRAAGENTI.IdResponsabile, 
                         dbo.Ald_VistraResponsabiliAttiviPerRuolo.DESCRIZIONE AS Responsabile, ANAGRAFICAAGENTI_1.CODAGENTE, 
                         ANAGRAFICAAGENTI_1.DSCAGENTE AS [Tecnico Effettivo], dbo.GEM_SEZIONECONTRATTORAPPORTI.DATA_PREV, 
                         dbo.GEM_SEZIONECONTRATTORAPPORTI.DATA_EFF, dbo.GEM_SEZIONECONTRATTORAPPORTI.DATA_Riprogrammazione, 
                         dbo.GEM_SEZIONECONTRATTORAPPORTI.OreIntPreviste, dbo.GEM_SEZIONECONTRATTORAPPORTI.DataSync, 
                         dbo.GEM_SEZIONECONTRATTORAPPORTI.DATAMODIFICA, dbo.GEM_SEZIONECONTRATTORAPPORTI.NOTE_GestioneRapporto, 
                         dbo.GEM_SEZIONECONTRATTORAPPORTI.MOTIVAZIONE_ANN, dbo.Biri_T_CLIENTI.CODCONTO, dbo.Biri_T_CLIENTI.DEST_DIVERSA, 
                         dbo.Biri_T_CLIENTI.RAGSOC_CLIENTE, dbo.Biri_T_CLIENTI.INDIRIZZO_CLIENTE, dbo.Biri_T_CLIENTI.PROV_CLIENTE, dbo.Biri_T_CLIENTI.LOCALITA_CLIENTE, 
                         dbo.ANAGRAFICAARTICOLI.DESCRIZIONE, dbo.GEM_SEZIONECONTRATTORAPPORTI.STATO, dbo.GEM_SEZIONECONTRATTORAPPORTI.IDRAPPORTO, 
                         dbo.GEM_SEZIONECONTRATTORAPPORTI.IDCONTRATTO, dbo.GEM_SEZIONECONTRATTORAPPORTI.TIPOLOGIARAPPORTO, 
                         dbo.GEM_SEZIONECONTRATTORAPPORTI.ELIMINATO, dbo.GEM_TESTACONTRATTO.CODCategoriaContratto, dbo.GEM_TESTACONTRATTO.STAGIONALE, 
                         dbo.GEM_SEZIONECONTRATTORAPPORTI.TECNICO_PREV, dbo.ANAGRAFICAAGENTI.DSCAGENTE, dbo.GEM_VISTA_Sezioni_MezziAttivi.NrMezziAttivi
FROM            dbo.ANAGRAFICAARTICOLI INNER JOIN
                         dbo.GEM_SEZIONECONTRATTORAPPORTI INNER JOIN
                         dbo.GEM_SEZIONICONTRATTO ON dbo.GEM_SEZIONECONTRATTORAPPORTI.IDCONTRATTO = dbo.GEM_SEZIONICONTRATTO.IDCONTRATTO AND 
                         dbo.GEM_SEZIONECONTRATTORAPPORTI.SEZIONECONTRATTO = dbo.GEM_SEZIONICONTRATTO.SEZIONECONTRATTO INNER JOIN
                         dbo.GEM_TESTACONTRATTO ON dbo.GEM_SEZIONICONTRATTO.IDCONTRATTO = dbo.GEM_TESTACONTRATTO.IDCONTRATTO INNER JOIN
                         dbo.ANAGRAFICAAGENTI ON dbo.GEM_SEZIONECONTRATTORAPPORTI.TECNICO_PREV = dbo.ANAGRAFICAAGENTI.CODAGENTE INNER JOIN
                         dbo.ANAGRAFICAAGENTI AS ANAGRAFICAAGENTI_1 INNER JOIN
                         dbo.EXTRAAGENTI ON ANAGRAFICAAGENTI_1.CODAGENTE = dbo.EXTRAAGENTI.CODAGENTE ON 
                         dbo.GEM_SEZIONECONTRATTORAPPORTI.TECNICO_EFF = ANAGRAFICAAGENTI_1.CODAGENTE ON 
                         dbo.ANAGRAFICAARTICOLI.CODICE = dbo.GEM_SEZIONICONTRATTO.CodiceMezzo INNER JOIN
                         dbo.Biri_T_CLIENTI ON dbo.GEM_SEZIONICONTRATTO.CODDEST = dbo.Biri_T_CLIENTI.DEST_DIVERSA AND 
                         dbo.GEM_TESTACONTRATTO.CODCLIENTE = dbo.Biri_T_CLIENTI.CODCONTO INNER JOIN
                         dbo.Ald_VistraResponsabiliAttiviPerRuolo ON dbo.EXTRAAGENTI.IdResponsabile = dbo.Ald_VistraResponsabiliAttiviPerRuolo.IdResponsabile INNER JOIN
                         dbo.GEM_VISTA_Sezioni_MezziAttivi ON dbo.GEM_SEZIONICONTRATTO.IDCONTRATTO = dbo.GEM_VISTA_Sezioni_MezziAttivi.IDCONTRATTO AND 
                         dbo.GEM_SEZIONICONTRATTO.SEZIONECONTRATTO = dbo.GEM_VISTA_Sezioni_MezziAttivi.SEZIONECONTRATTO
WHERE        (dbo.EXTRAAGENTI.TipoAgente <> '15') AND (dbo.EXTRAAGENTI.TipoAgente <> '20') AND 
                         (dbo.GEM_SEZIONECONTRATTORAPPORTI.DATA_PREV >= CONVERT(DATETIME, '2017-01-01 00:00:00', 102))

GO
GRANT SELECT
    ON OBJECT::[dbo].[MB_Export_Service_Ritardi] TO [Metodo98]
    AS [dbo];


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "ANAGRAFICAARTICOLI"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 290
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GEM_SEZIONECONTRATTORAPPORTI"
            Begin Extent = 
               Top = 6
               Left = 328
               Bottom = 135
               Right = 585
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GEM_SEZIONICONTRATTO"
            Begin Extent = 
               Top = 6
               Left = 623
               Bottom = 135
               Right = 857
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GEM_TESTACONTRATTO"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 267
               Right = 287
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANAGRAFICAAGENTI"
            Begin Extent = 
               Top = 138
               Left = 325
               Bottom = 267
               Right = 540
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANAGRAFICAAGENTI_1"
            Begin Extent = 
               Top = 138
               Left = 578
               Bottom = 267
               Right = 793
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EXTRAAGENTI"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 399', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'MB_Export_Service_Ritardi';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'
               Right = 284
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Biri_T_CLIENTI"
            Begin Extent = 
               Top = 270
               Left = 322
               Bottom = 331
               Right = 513
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Ald_VistraResponsabiliAttiviPerRuolo"
            Begin Extent = 
               Top = 270
               Left = 551
               Bottom = 399
               Right = 759
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GEM_VISTA_Sezioni_MezziAttivi"
            Begin Extent = 
               Top = 336
               Left = 322
               Bottom = 465
               Right = 528
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2355
         Alias = 1575
         Table = 3510
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'MB_Export_Service_Ritardi';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'MB_Export_Service_Ritardi';

