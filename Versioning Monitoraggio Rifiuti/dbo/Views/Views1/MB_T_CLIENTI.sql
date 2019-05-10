CREATE VIEW dbo.[MB_T_CLIENTI]
AS
SELECT        acf.CODCONTO + '-0' AS COD_CLIENTE, acf.CODCONTO, 0 AS DEST_DIVERSA, acf.DSCCONTO1 AS RAGSOC_CLIENTE, acf.INDIRIZZO AS INDIRIZZO_CLIENTE, 
                         acf.PROVINCIA AS PROV_CLIENTE, acf.LOCALITA AS LOCALITA_CLIENTE, acf.TELEFONO AS TEL_CLIENTE, acf.FAX AS FAX_CLIENTE, 
                         acf.PARTITAIVA AS PIVA_CLIENTE, acf.CAP AS CAP_CLIENTE, arcf.CODSETTORE, arcf.CODZONA, arcf.STATOALTRO AS BLOCCO_CLIENTE, EA.CodiceComplesso, 
                         EA.CodSettoreGiriVisite
FROM            dbo.ANAGRAFICACF AS acf INNER JOIN
                         dbo.ANAGRAFICARISERVATICF AS arcf ON acf.CODCONTO = arcf.CODCONTO LEFT OUTER JOIN
                         dbo.TABZONE AS z ON arcf.CODZONA = z.CODICE INNER JOIN
                         dbo.EXTRACLIENTI AS EA ON acf.CODCONTO = EA.CODCONTO
WHERE        (arcf.ESERCIZIO = YEAR(GETDATE())) AND (acf.TIPOCONTO = 'C')

GO
GRANT SELECT
    ON OBJECT::[dbo].[MB_T_CLIENTI] TO [Metodo98]
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
         Begin Table = "acf"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 265
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "arcf"
            Begin Extent = 
               Top = 6
               Left = 303
               Bottom = 135
               Right = 537
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "z"
            Begin Extent = 
               Top = 6
               Left = 575
               Bottom = 135
               Right = 766
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EA"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 267
               Right = 270
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'MB_T_CLIENTI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'MB_T_CLIENTI';

