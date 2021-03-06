﻿CREATE VIEW dbo.Biri_MonitoraggioRifiuti
AS
SELECT        TESTEDOCUMENTI.PROGRESSIVO, TESTEDOCUMENTI.ESERCIZIO, TESTEDOCUMENTI.TIPODOC, TESTEDOCUMENTI.NUMERODOC, TESTEDOCUMENTI.DATADOC, TESTEDOCUMENTI.DOCCHIUSO, 
                         ANAGRAFICACF.CODCONTO, ANAGRAFICACF.DSCCONTO1, EXTRATESTEDOC.NOTEDOC, TSucc.ESERCIZIO AS EsercizioSucc, TSucc.TIPODOC AS TipodocSucc, TSucc.NUMERODOC AS NumerodocSucc, 
                         TSucc.DATADOC AS DataDocSucc, TESTEDOCUMENTI.RAGSOCDDM, TESTEDOCUMENTI.INDIRIZZODDM, TESTEDOCUMENTI.CAPDDM, TESTEDOCUMENTI.LOCALITADDM
FROM            TESTEDOCUMENTI AS TSucc INNER JOIN
                         RIGHEDOCUMENTI AS RSucc ON TSucc.PROGRESSIVO = RSucc.IDTESTA RIGHT OUTER JOIN
                         TESTEDOCUMENTI INNER JOIN
                         RIGHEDOCUMENTI ON TESTEDOCUMENTI.PROGRESSIVO = RIGHEDOCUMENTI.IDTESTA INNER JOIN
                         ANAGRAFICACF ON TESTEDOCUMENTI.CODCLIFOR = ANAGRAFICACF.CODCONTO INNER JOIN
                         EXTRATESTEDOC ON TESTEDOCUMENTI.PROGRESSIVO = EXTRATESTEDOC.IDTESTA ON RSucc.IDTESTARP = RIGHEDOCUMENTI.IDTESTA AND RSucc.IDRIGARP = RIGHEDOCUMENTI.IDRIGA
WHERE        (TESTEDOCUMENTI.PROGRESSIVO IN
                             (SELECT        RIGHEDOCUMENTI_1.IDTESTA
                               FROM            ANAGRAFICAARTICOLI INNER JOIN
                                                         RIGHEDOCUMENTI AS RIGHEDOCUMENTI_1 ON ANAGRAFICAARTICOLI.CODICE = RIGHEDOCUMENTI_1.CODART
                               WHERE        (ANAGRAFICAARTICOLI.GRUPPO = 81100) OR
                                                         (ANAGRAFICAARTICOLI.GRUPPO = 14000))) AND (TESTEDOCUMENTI.TIPODOC = 'ORS') AND (TESTEDOCUMENTI.DOCCHIUSO = 0) OR
                         (TESTEDOCUMENTI.PROGRESSIVO IN
                             (SELECT        RIGHEDOCUMENTI_1.IDTESTA
                               FROM            ANAGRAFICAARTICOLI AS ANAGRAFICAARTICOLI_1 INNER JOIN
                                                         RIGHEDOCUMENTI AS RIGHEDOCUMENTI_1 ON ANAGRAFICAARTICOLI_1.CODICE = RIGHEDOCUMENTI_1.CODART
                               WHERE        (ANAGRAFICAARTICOLI_1.GRUPPO = 81100) OR
                                                         (ANAGRAFICAARTICOLI_1.GRUPPO = 14000))) AND (TESTEDOCUMENTI.TIPODOC = 'ORS') AND (TESTEDOCUMENTI.DOCCHIUSO = 1) AND (TESTEDOCUMENTI.ESERCIZIO >= YEAR(GETDATE()) - 1)
GROUP BY TESTEDOCUMENTI.ESERCIZIO, TESTEDOCUMENTI.TIPODOC, TESTEDOCUMENTI.NUMERODOC, TESTEDOCUMENTI.DATADOC, TESTEDOCUMENTI.NUMRIFDOC, TESTEDOCUMENTI.DOCCHIUSO, 
                         ANAGRAFICACF.CODCONTO, ANAGRAFICACF.DSCCONTO1, EXTRATESTEDOC.NOTEDOC, TSucc.ESERCIZIO, TSucc.TIPODOC, TSucc.NUMERODOC, TSucc.DATADOC, TESTEDOCUMENTI.PROGRESSIVO, 
                         TESTEDOCUMENTI.RAGSOCDDM, TESTEDOCUMENTI.INDIRIZZODDM, TESTEDOCUMENTI.CAPDDM, TESTEDOCUMENTI.LOCALITADDM

UNION

SELECT        TESTEDOCUMENTI.PROGRESSIVO, TESTEDOCUMENTI.ESERCIZIO, TESTEDOCUMENTI.TIPODOC, TESTEDOCUMENTI.NUMERODOC, TESTEDOCUMENTI.DATADOC, TESTEDOCUMENTI.DOCCHIUSO, 
                         ANAGRAFICACF.CODCONTO, ANAGRAFICACF.DSCCONTO1, EXTRATESTEDOC.NOTEDOC, TSucc.ESERCIZIO AS EsercizioDocSucc, TSucc.TIPODOC AS TipodocSucc, TSucc.NUMERODOC AS NumerodocSucc, 
                         TSucc.DATADOC AS DataDocSucc, TESTEDOCUMENTI.RAGSOCDDM, TESTEDOCUMENTI.INDIRIZZODDM, TESTEDOCUMENTI.CAPDDM, TESTEDOCUMENTI.LOCALITADDM
FROM            RIGHEDOCUMENTI AS RSucc INNER JOIN
                         TESTEDOCUMENTI AS TSucc ON RSucc.IDTESTA = TSucc.PROGRESSIVO RIGHT OUTER JOIN
                         TESTEDOCUMENTI INNER JOIN
                         EXTRATESTEDOC ON TESTEDOCUMENTI.PROGRESSIVO = EXTRATESTEDOC.IDTESTA INNER JOIN
                         RIGHEDOCUMENTI ON TESTEDOCUMENTI.PROGRESSIVO = RIGHEDOCUMENTI.IDTESTA INNER JOIN
                         ANAGRAFICACF ON TESTEDOCUMENTI.CODCLIFOR = ANAGRAFICACF.CODCONTO INNER JOIN
                         EXTRAFORNITORI ON ANAGRAFICACF.CODCONTO = EXTRAFORNITORI.CODCONTO ON RSucc.IDTESTARP = RIGHEDOCUMENTI.IDTESTA AND RSucc.IDRIGARP = RIGHEDOCUMENTI.IDRIGA
WHERE        (TESTEDOCUMENTI.TIPODOC = '1OS') AND (EXTRAFORNITORI.IDTipoForn = '3') AND (TESTEDOCUMENTI.DOCCHIUSO = 0) OR
                         (TESTEDOCUMENTI.TIPODOC = '1OS') AND (TESTEDOCUMENTI.ESERCIZIO >= YEAR(GETDATE()) - 1) AND (EXTRAFORNITORI.IDTipoForn = '3') AND (TESTEDOCUMENTI.DOCCHIUSO = 1)

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
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
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
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Biri_MonitoraggioRifiuti';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Biri_MonitoraggioRifiuti';

