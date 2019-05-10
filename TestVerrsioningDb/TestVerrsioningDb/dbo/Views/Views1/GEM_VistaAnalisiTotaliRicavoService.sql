


CREATE VIEW [dbo].[GEM_VistaAnalisiTotaliRicavoService]
AS
SELECT     Mastri.idOrFatt, OrigFatt.Descrizione AS DscOrFatt, AnaCF.CODMASTRO, Mastri.DESCRIZIONE AS DscMastro, ExCom.IdASA, RD.RIFCOMMCLI, 
TD.TIPODOC, 
                      TD.ESERCIZIO, TD.NUMERODOC, TD.BIS, TD.DATADOC, TD.NUMRIFDOC, TD.DATARIFDOC, TD.CODCFFATT, TD.SEGNO, GemRapp.IDRAPPORTO, 
                      ISNULL(GemRapp.TIPOLOGIARAPPORTO, 'O') AS TIPOLOGIARAPPORTO, 
					  ISNULL((CASE WHEN exrd.TipoFatturazione = 'Rateale' THEN 'R' ELSE
                          (SELECT     TOP (1) ISNULL(TipologiaElemento, 'O') AS nat
                            FROM          GEM_SEZIONE_CONTRATTO_RAPPORTI_ELEMENTI_DA_FATTURARE AS GRElFatt
                            WHERE      (IDRAPPORTO = GemRapp.IDRAPPORTO) AND (CodArticolo = RD.CODART)) END), 'O') AS NaturaFatturato, 
							ExRD.TipoFatturazione, ExRD.Validita, 
                      RD.CODART, AnaArt.DESCRIZIONE AS DscArticolo, RD.TOTNETTORIGAEURO * TD.SEGNO AS TNettoRigaEuro, RD.RIGACHIUSA, AnaArt.GRUPPO, 
					  AnaArt.CATEGORIA, 
                      AnaArt.CODCATEGORIASTAT, AnaArt.AGGIORNAMAG, RD.GENCONTROP, AnaGen.DSCCONTO1 AS DscGenControP, 
					  Mastri2.TIPO AS NaturaCPartita
FROM         dbo.ANAGRAFICAGENERICI AS AnaGen INNER JOIN
                      dbo.TABMASTRI AS Mastri2 ON AnaGen.CODMASTRO = Mastri2.CODICE INNER JOIN
                      dbo.TABMASTRI AS Mastri INNER JOIN
                      dbo.ANAGRAFICACF AS AnaCF ON Mastri.CODICE = AnaCF.CODMASTRO INNER JOIN
                      dbo.PARAMETRIDOC AS PDoc INNER JOIN
                      dbo.TESTEDOCUMENTI AS TD ON PDoc.CODICE = TD.TIPODOC INNER JOIN
                      dbo.RIGHEDOCUMENTI AS RD ON TD.PROGRESSIVO = RD.IDTESTA INNER JOIN
                      dbo.EXTRARIGHEDOC AS ExRD ON RD.IDTESTA = ExRD.IDTESTA AND RD.IDRIGA = ExRD.IDRIGA ON AnaCF.CODCONTO = TD.CODCFFATT INNER JOIN
                      dbo.Ald_VistaDistinzioneOrigineFatturati AS OrigFatt ON Mastri.idOrFatt = OrigFatt.idOrFatt INNER JOIN
                      dbo.ANAGRAFICAARTICOLI AS AnaArt ON RD.CODART = AnaArt.CODICE INNER JOIN
                      dbo.ExtraCommCli AS ExCom INNER JOIN
                      dbo.AnagraficaCommesse AS AnaCom ON ExCom.RifProgressivo = AnaCom.Progressivo ON RD.RIFCOMMCLI = AnaCom.RifComm ON 
                      AnaGen.CODCONTO = RD.GENCONTROP LEFT OUTER JOIN
                      dbo.GEM_SEZIONECONTRATTORAPPORTI AS GemRapp ON ExRD.IdRapportoGemma = GemRapp.IDRAPPORTO
WHERE     (RD.TIPORIGA = 'N') AND (ExCom.IdASA = '05')




GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaAnalisiTotaliRicavoService] TO [Metodo98]
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
         Begin Table = "AnaGen"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 215
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Mastri2"
            Begin Extent = 
               Top = 6
               Left = 253
               Bottom = 114
               Right = 432
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Mastri"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
               Right = 217
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AnaCF"
            Begin Extent = 
               Top = 114
               Left = 255
               Bottom = 222
               Right = 460
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PDoc"
            Begin Extent = 
               Top = 222
               Left = 38
               Bottom = 330
               Right = 268
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TD"
            Begin Extent = 
               Top = 330
               Left = 38
               Bottom = 438
               Right = 275
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RD"
            Begin Extent = 
               Top = 438
               Left = 38
               Bottom = 546
               Right = 265
            End
            DisplayFlags = 280
            TopCol', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'GEM_VistaAnalisiTotaliRicavoService';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'umn = 0
         End
         Begin Table = "ExRD"
            Begin Extent = 
               Top = 546
               Left = 38
               Bottom = 654
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrigFatt"
            Begin Extent = 
               Top = 438
               Left = 303
               Bottom = 546
               Right = 477
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AnaArt"
            Begin Extent = 
               Top = 654
               Left = 38
               Bottom = 762
               Right = 267
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ExCom"
            Begin Extent = 
               Top = 546
               Left = 260
               Bottom = 654
               Right = 459
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AnaCom"
            Begin Extent = 
               Top = 762
               Left = 38
               Bottom = 870
               Right = 265
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GemRapp"
            Begin Extent = 
               Top = 870
               Left = 38
               Bottom = 978
               Right = 272
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
         Column = 3195
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'GEM_VistaAnalisiTotaliRicavoService';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'GEM_VistaAnalisiTotaliRicavoService';

