CREATE VIEW dbo.ALD_Vista_TotPreventiviCommesse
AS
SELECT     dbo.TESTEFOGLICOMMCLI.PROGRESSIVO, dbo.TESTEFOGLICOMMCLI.ESERCIZIO, dbo.TESTEFOGLICOMMCLI.TIPO, 
                      dbo.TESTEFOGLICOMMCLI.NUMERO, dbo.TESTEFOGLICOMMCLI.REVISIONE, dbo.TESTEFOGLICOMMCLI.RIFERIMENTO AS RifPreventivo, 
                      dbo.TESTEFOGLICOMMCLI.STATO, dbo.TABSTATOPREVENTIVOCOMMCLI.DESCRIZIONE AS dscStato, dbo.TESTEFOGLICOMMCLI.OGGETTO, 
                      dbo.TESTEFOGLICOMMCLI.CODCLIENTE, dbo.TESTEFOGLICOMMCLI.CLIENTEFATT, dbo.TESTEFOGLICOMMCLI.RIFCOMMESSA, 
                      SUM(dbo.RIGHEPREVCOMMCLI.COSTOTOTALEPREVEURO) AS TotCostiPreventivoEuro, SUM(dbo.RIGHEPREVCOMMCLI.PREZZOFFERTATOTEURO) 
                      AS TotPrezziPreventivoEuro, dbo.TESTEFOGLICOMMCLI.DATAFINE AS dtEmissionePrev, dbo.RIGHEPREVCOMMCLI.TIPONODO, 
                      dbo.AnagraficaCommesse.DataEmissione AS dtEmissioneCommessa, CAST(ISNULL(dbo.AnagraficaCommesse.DataEmissione, 
                      ISNULL(dbo.TESTEFOGLICOMMCLI.DATAFINE, 0)) AS numeric) - CAST(ISNULL(dbo.TESTEFOGLICOMMCLI.DATAFINE, 0) AS numeric) AS DeltaGG
FROM         dbo.RIGHEPREVCOMMCLI INNER JOIN
                      dbo.TESTEFOGLICOMMCLI ON dbo.RIGHEPREVCOMMCLI.RIFPROGRESSIVO = dbo.TESTEFOGLICOMMCLI.PROGRESSIVO INNER JOIN
                      dbo.TABSTATOPREVENTIVOCOMMCLI ON dbo.TESTEFOGLICOMMCLI.STATO = dbo.TABSTATOPREVENTIVOCOMMCLI.CODICE LEFT OUTER JOIN
                      dbo.AnagraficaCommesse ON dbo.TESTEFOGLICOMMCLI.RIFCOMMESSA = dbo.AnagraficaCommesse.RifComm
WHERE     (dbo.RIGHEPREVCOMMCLI.TIPONODO = 1)
GROUP BY dbo.TESTEFOGLICOMMCLI.PROGRESSIVO, dbo.TESTEFOGLICOMMCLI.ESERCIZIO, dbo.TESTEFOGLICOMMCLI.TIPO, 
                      dbo.TESTEFOGLICOMMCLI.NUMERO, dbo.TESTEFOGLICOMMCLI.REVISIONE, dbo.TESTEFOGLICOMMCLI.RIFERIMENTO, 
                      dbo.TESTEFOGLICOMMCLI.STATO, dbo.TABSTATOPREVENTIVOCOMMCLI.DESCRIZIONE, dbo.TESTEFOGLICOMMCLI.OGGETTO, 
                      dbo.TESTEFOGLICOMMCLI.CODCLIENTE, dbo.TESTEFOGLICOMMCLI.CLIENTEFATT, dbo.TESTEFOGLICOMMCLI.RIFCOMMESSA, 
                      dbo.TESTEFOGLICOMMCLI.DATAFINE, dbo.RIGHEPREVCOMMCLI.TIPONODO, dbo.AnagraficaCommesse.DataEmissione, 
                      CAST(ISNULL(dbo.AnagraficaCommesse.DataEmissione, ISNULL(dbo.TESTEFOGLICOMMCLI.DATAFINE, 0)) AS numeric) 
                      - CAST(ISNULL(dbo.TESTEFOGLICOMMCLI.DATAFINE, 0) AS numeric)

GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_Vista_TotPreventiviCommesse] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_Vista_TotPreventiviCommesse] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_Vista_TotPreventiviCommesse] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_Vista_TotPreventiviCommesse] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_Vista_TotPreventiviCommesse] TO [Metodo98]
    AS [dbo];


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[24] 4[37] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
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
         Configuration = "(H (1 [56] 4 [18] 2))"
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
         Begin Table = "RIGHEPREVCOMMCLI"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 197
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "TESTEFOGLICOMMCLI"
            Begin Extent = 
               Top = 6
               Left = 282
               Bottom = 176
               Right = 483
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "TABSTATOPREVENTIVOCOMMCLI"
            Begin Extent = 
               Top = 6
               Left = 521
               Bottom = 114
               Right = 690
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AnagraficaCommesse"
            Begin Extent = 
               Top = 69
               Left = 762
               Bottom = 254
               Right = 981
            End
            DisplayFlags = 280
            TopColumn = 13
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 220
      Begin ColumnWidths = 19
         Width = 284
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'ALD_Vista_TotPreventiviCommesse';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N' = 10785
         Alias = 1860
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'ALD_Vista_TotPreventiviCommesse';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'ALD_Vista_TotPreventiviCommesse';

