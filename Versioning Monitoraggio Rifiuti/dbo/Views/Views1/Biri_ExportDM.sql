
/*WHERE     (dbo.RIGHEDOCUMENTI.TIPODOC IN ('ORS', 'OR4', 'OR5')) AND (dbo.AnagraficaCommesse.RifComm LIKE 'IAS%.IAV%.IM1%.IMS%''ING%.RIA%')*/
CREATE VIEW [dbo].[Biri_ExportDM]
AS
SELECT        dbo.AnagraficaCommesse.StatoCommessa, ANAGRAFICACF_1.DSCCONTO1, dbo.ANAGRAFICAARTICOLI.CODICE, dbo.ANAGRAFICAARTICOLI.DESCRIZIONE, 
                         dbo.AnagraficaCommesse.Oggetto, dbo.AnagraficaCommesse.flgTIPOCOMM, dbo.ExtraCommCli.NoteCommessa, dbo.ExtraCommCli.DtRichiestaDM37, 
                         dbo.ExtraCommCli.DtConsegnaDM37, dbo.AnagraficaCommesse.RifComm, dbo.AnagraficaCommesse.DataEmissione, 
                         dbo.ALD_StatoDocsComm.Descrizione AS Expr1, CostiInterniPrev.CODART, CostiInterniPrev.DESCRIZIONEART, CostiInterniPrev.TOTOREPREV, 
                         CostiInterniExe.CODART AS Expr2, CostiInterniExe.DESCRIZIONEART AS Expr3, CostiInterniExe.TOTOREPREV AS Expr4
FROM            dbo.ANAGRAFICAARTICOLI RIGHT OUTER JOIN
                         dbo.ALD_StatoDocsComm INNER JOIN
                         dbo.ExtraCommCli ON dbo.ALD_StatoDocsComm.Codice = dbo.ExtraCommCli.StatoDocumentazione ON 
                         dbo.ANAGRAFICAARTICOLI.CODICE = dbo.ExtraCommCli.ResponsabileCommessa RIGHT OUTER JOIN
                         dbo.AnagraficaCommesse INNER JOIN
                         dbo.ANAGRAFICACF AS ANAGRAFICACF_1 ON dbo.AnagraficaCommesse.CliCommitt = ANAGRAFICACF_1.CODCONTO LEFT OUTER JOIN
                             (SELECT        RIGHEDOCUMENTI_1.RIFCOMMCLI, RIGHEDOCUMENTI_1.CODART, RIGHEDOCUMENTI_1.DESCRIZIONEART, SUM(RIGHEDOCUMENTI_1.QTAGEST) 
                                                         AS TOTOREPREV
                               FROM            dbo.RIGHEDOCUMENTI AS RIGHEDOCUMENTI_1 INNER JOIN
                                                         dbo.TESTEDOCUMENTI AS TESTEDOCUMENTI_2 ON RIGHEDOCUMENTI_1.IDTESTA = TESTEDOCUMENTI_2.PROGRESSIVO
                               WHERE        (RIGHEDOCUMENTI_1.CODART IN ('ZA00020')) AND (RIGHEDOCUMENTI_1.TIPODOC = '1MU')
                               GROUP BY RIGHEDOCUMENTI_1.RIFCOMMCLI, RIGHEDOCUMENTI_1.DESCRIZIONEART, RIGHEDOCUMENTI_1.CODART) AS CostiInterniExe ON 
                         dbo.AnagraficaCommesse.RifComm = CostiInterniExe.RIFCOMMCLI LEFT OUTER JOIN
                             (SELECT        RIGHEDOCUMENTI_1.RIFCOMMCLI, RIGHEDOCUMENTI_1.CODART, RIGHEDOCUMENTI_1.DESCRIZIONEART, SUM(RIGHEDOCUMENTI_1.QTAGEST) 
                                                         AS TOTOREPREV
                               FROM            dbo.RIGHEDOCUMENTI AS RIGHEDOCUMENTI_1 INNER JOIN
                                                         dbo.TESTEDOCUMENTI AS TESTEDOCUMENTI_2 ON RIGHEDOCUMENTI_1.IDTESTA = TESTEDOCUMENTI_2.PROGRESSIVO
                               WHERE        (RIGHEDOCUMENTI_1.CODART IN ('ZA00020')) AND (RIGHEDOCUMENTI_1.TIPODOC = '2MU')
                               GROUP BY RIGHEDOCUMENTI_1.RIFCOMMCLI, RIGHEDOCUMENTI_1.DESCRIZIONEART, RIGHEDOCUMENTI_1.CODART) AS CostiInterniPrev ON 
                         dbo.AnagraficaCommesse.RifComm = CostiInterniPrev.RIFCOMMCLI ON dbo.ExtraCommCli.RifProgressivo = dbo.AnagraficaCommesse.Progressivo
WHERE        (dbo.ExtraCommCli.StatoDocumentazione = 2)
GROUP BY dbo.AnagraficaCommesse.StatoCommessa, ANAGRAFICACF_1.DSCCONTO1, dbo.ANAGRAFICAARTICOLI.CODICE, dbo.ANAGRAFICAARTICOLI.DESCRIZIONE, 
                         dbo.AnagraficaCommesse.Oggetto, dbo.AnagraficaCommesse.flgTIPOCOMM, dbo.ExtraCommCli.NoteCommessa, dbo.ExtraCommCli.DtRichiestaDM37, 
                         dbo.ExtraCommCli.DtConsegnaDM37, dbo.AnagraficaCommesse.RifComm, dbo.AnagraficaCommesse.DataEmissione, dbo.ALD_StatoDocsComm.Descrizione, 
                         CostiInterniPrev.CODART, CostiInterniPrev.DESCRIZIONEART, CostiInterniPrev.TOTOREPREV, CostiInterniExe.CODART, CostiInterniExe.DESCRIZIONEART, 
                         CostiInterniExe.TOTOREPREV


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[14] 4[45] 2[19] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[40] 2[26] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4[30] 2[40] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[56] 3) )"
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
         Configuration = "(H (1[11] 4[63] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[41] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[38] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4[69] 2) )"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4) )"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2) )"
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
               Top = 381
               Left = 787
               Bottom = 621
               Right = 1039
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ALD_StatoDocsComm"
            Begin Extent = 
               Top = 20
               Left = 613
               Bottom = 149
               Right = 820
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ExtraCommCli"
            Begin Extent = 
               Top = 6
               Left = 352
               Bottom = 382
               Right = 569
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "AnagraficaCommesse"
            Begin Extent = 
               Top = 11
               Left = 29
               Bottom = 412
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANAGRAFICACF_1"
            Begin Extent = 
               Top = 450
               Left = 384
               Bottom = 699
               Right = 611
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CostiInterniExe"
            Begin Extent = 
               Top = 6
               Left = 1155
               Bottom = 135
               Right = 1362
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CostiInterniPrev"
            Begin Extent = 
               Top = 138
               Left = 1155
               Bottom = 267
           ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Biri_ExportDM';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'    Right = 1362
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
      Begin ColumnWidths = 178
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1875
         Width = 1770
         Width = 1500
         Width = 1980
         Width = 2985
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2640
         Width = 1500
         Width = 1500
         Width = 2145
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
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 150', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Biri_ExportDM';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane3', @value = N'0
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
      Begin ColumnWidths = 12
         Column = 4860
         Alias = 4485
         Table = 3345
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 10320
         Or = 4185
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Biri_ExportDM';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 3, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Biri_ExportDM';

