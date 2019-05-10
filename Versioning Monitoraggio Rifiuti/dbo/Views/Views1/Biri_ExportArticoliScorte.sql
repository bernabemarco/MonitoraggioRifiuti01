CREATE VIEW dbo.Biri_ExportArticoliScorte
AS
SELECT        dbo.ANAGRAFICAARTICOLI.CODICE, dbo.ANAGRAFICAARTICOLI.DESCRIZIONE, dbo.ANAGRAFICAARTICOLI.GRUPPO, dbo.PARAMETRIRIORDXDEPOSITO.DEPOSITO, 
                         dbo.PARAMETRIRIORDXDEPOSITO.SCORTAMIN, dbo.PARAMETRIRIORDXDEPOSITO.LIVRIORDINO, dbo.PARAMETRIRIORDXDEPOSITO.LOTTORIORDINO, 
                         dbo.ANAGRAFICAARTICOLIPROD.TIPOGESTIONE, dbo.ANAGRAFICAARTICOLIPROD.FORNPREFACQ, dbo.VISTAULTIMOPREZZOACQUISTO.CODCLIFOR, 
                         dbo.VISTAULTIMOPREZZOACQUISTO.PREZZOEURO
FROM            dbo.ANAGRAFICAARTICOLI INNER JOIN
                         dbo.ANAGRAFICAARTICOLIPROD ON dbo.ANAGRAFICAARTICOLI.CODICE = dbo.ANAGRAFICAARTICOLIPROD.CODICEART LEFT OUTER JOIN
                         dbo.VISTAULTIMOPREZZOACQUISTO ON dbo.ANAGRAFICAARTICOLIPROD.CODICEART = dbo.VISTAULTIMOPREZZOACQUISTO.CODARTICOLO LEFT OUTER JOIN
                         dbo.PARAMETRIRIORDXDEPOSITO ON dbo.ANAGRAFICAARTICOLIPROD.ESERCIZIO = dbo.PARAMETRIRIORDXDEPOSITO.ESERCIZIO AND 
                         dbo.ANAGRAFICAARTICOLIPROD.CODICEART = dbo.PARAMETRIRIORDXDEPOSITO.CODART
WHERE        (dbo.ANAGRAFICAARTICOLIPROD.ESERCIZIO = 2018) AND (dbo.ANAGRAFICAARTICOLI.GRUPPO <> 9999)

GO
GRANT ALTER
    ON OBJECT::[dbo].[Biri_ExportArticoliScorte] TO [Profiler]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[Biri_ExportArticoliScorte] TO [Profiler]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[Biri_ExportArticoliScorte] TO [Profiler]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Biri_ExportArticoliScorte] TO [Profiler]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Biri_ExportArticoliScorte] TO [Profiler]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Biri_ExportArticoliScorte] TO [Profiler]
    AS [dbo];


GO
GRANT TAKE OWNERSHIP
    ON OBJECT::[dbo].[Biri_ExportArticoliScorte] TO [Profiler]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Biri_ExportArticoliScorte] TO [Profiler]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[Biri_ExportArticoliScorte] TO [Profiler]
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
               Bottom = 332
               Right = 266
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANAGRAFICAARTICOLIPROD"
            Begin Extent = 
               Top = 1
               Left = 322
               Bottom = 317
               Right = 608
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PARAMETRIRIORDXDEPOSITO"
            Begin Extent = 
               Top = 98
               Left = 694
               Bottom = 418
               Right = 921
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VISTAULTIMOPREZZOACQUISTO"
            Begin Extent = 
               Top = 6
               Left = 1144
               Bottom = 305
               Right = 1335
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
      Begin ColumnWidths = 12
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
         SortOrder ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Biri_ExportArticoliScorte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'= 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Biri_ExportArticoliScorte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Biri_ExportArticoliScorte';

