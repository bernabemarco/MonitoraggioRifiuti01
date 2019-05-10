CREATE VIEW dbo.[MB_ModifAgenti]
AS
SELECT        dbo.ANAGRAFICACF.CODCONTO, dbo.ANAGRAFICACF.DSCCONTO1, dbo.ANAGRAFICACF.INDIRIZZO, dbo.ANAGRAFICARISERVATICF.CODSETTORE, 
                         dbo.ANAGRAFICARISERVATICF.CODZONA, dbo.ANAGRAFICARISERVATICF.CODCATEGORIA, dbo.ANAGRAFICARISERVATICF.ESERCIZIO, 
                         dbo.ANAGRAFICARISERVATICF.CODAGENTE1, dbo.ANAGRAFICACF.PROVINCIA, dbo.ANAGRAFICACF.LOCALITA, dbo.ANAGRAFICARISERVATICF.PROVV1, 
                         dbo.ANAGRAFICARISERVATICF.UTENTEMODIFICA, dbo.ANAGRAFICARISERVATICF.DATAMODIFICA
FROM            dbo.ANAGRAFICACF INNER JOIN
                         dbo.ANAGRAFICARISERVATICF ON dbo.ANAGRAFICACF.CODCONTO = dbo.ANAGRAFICARISERVATICF.CODCONTO
WHERE        (dbo.ANAGRAFICACF.CODCONTO IN ('C  4583', 'C  5050', 'C  5555', 'C  5856', 'C  7008', 'C  7053', 'C  7126', 'C  7195', 'C  7693', 'C  7761', 'C  7842', 
                         'C  7939', 'C  7956', 'C  8084', 'C  8119', 'C  8128', 'C  8460', 'C  9500', 'C  9680', 'C  9912', 'C 10970', 'C 11280', 'C 11296', 'C 11407', 'C 11427', 'C 11731', 
                         'C 11733', 'C 11812', 'C 15273', 'C 16075', 'C 16585', 'C 42603', 'C 43601', 'C 45071', 'C 46510', 'C 46627', 'C  1807', 'C  2108', 'C  3174', 'C  3218', 'C  3757', 
                         'C  4727', 'C  4781', 'C  5406', 'C  5813', 'C  5896', 'C  5917', 'C  7024', 'C  7176', 'C  7468', 'C 10932', 'C 10992', 'C 11359', 'C 11406', 'C 11411', 'C 11412', 
                         'C 11416', 'C 11483', 'C 11556', 'C 11637', 'C 11700', 'C 11704', 'C 11705', 'C 11706', 'C 11707', 'C 11708', 'C 11725', 'C 11738', 'C 11851', 'C 11888', 'C 11922', 
                         'C 12023', 'C 12027', 'C 12033', 'C 12038', 'C 12039', 'C 12064', 'C 12115', 'C 12130', 'C 12148', 'C 12207', 'C 12229', 'C 12230', 'C 12231', 'C 12259', 'C 12437', 
                         'C 12465', 'C 12503', 'C 12540', 'C 12549', 'C 12561', 'C 12646', 'C 12676', 'C 12687', 'C 12714', 'C 12768', 'C 12897', 'C 12903', 'C 12942', 'C 13006', 'C 13007', 
                         'C 13034', 'C 13043', 'C 13100', 'C 15983', 'C 16316', 'C 16383', 'C 16700', 'C 16884', 'C 42198', 'C 42624', 'C 42668', 'C 42936', 'C 42994', 'C 43032', 'C 43033', 
                         'C 43182', 'C 43202', 'C 43289', 'C 43337', 'C 43388', 'C 43470', 'C 43488', 'C 43496', 'C 43548', 'C 44179', 'C 44182', 'C 44862', 'C 44901', 'C 45233', 'C 45460', 
                         'C 46989', 'C  5612', 'C  6788', 'C  7959', 'C  9451', 'C 11183', 'C 11302', 'C 11505', 'C 11734', 'C 11861', 'C 11881', 'C 12329', 'C 12569', 'C 12722', 'C 15203', 
                         'C 16811', 'C 42139', 'C 42910', 'C 43222', 'C 43435', 'C 45041', 'C 45388', 'C 45400', 'C 45406', 'C 45407', 'C 45408', 'C 45499', 'C 45500', 'C 45504', 'C 45538', 
                         'C 45548', 'C 45577', 'C 45661', 'C 45932', 'C 46009', 'C 46175', 'C 46204', 'C 46327', 'C 46341', 'C 46415', 'C 46623', 'C 46857', 'C 46888', 'C 47001', 'C 47303')) AND 
                         (dbo.ANAGRAFICARISERVATICF.ESERCIZIO = 2018)

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[19] 4[26] 2[16] 3) )"
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
         Configuration = "(H (4[44] 2[26] 3) )"
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
         Begin Table = "ANAGRAFICACF"
            Begin Extent = 
               Top = 29
               Left = 46
               Bottom = 368
               Right = 387
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANAGRAFICARISERVATICF"
            Begin Extent = 
               Top = 1
               Left = 531
               Bottom = 315
               Right = 893
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
      Begin ColumnWidths = 14
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
         Table = 2805
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 4065
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'MB_ModifAgenti';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'MB_ModifAgenti';

