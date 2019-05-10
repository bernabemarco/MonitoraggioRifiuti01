CREATE VIEW dbo.Biri_ExportPrj
AS
SELECT        TOP (1000000) dbo.RIGHEDOCUMENTI.ESERCIZIO, dbo.RIGHEDOCUMENTI.TIPODOC, dbo.RIGHEDOCUMENTI.NUMERODOC, 
                         TESTEDOCUMENTI_1.DATADOC AS DATADOC, TESTEDOCUMENTI_1.CODCLIFOR AS CodiceCliente, ANAGRAFICACF_1.DSCCONTO1 AS RagioneSociale, 
                         dbo.AnagraficaCommesse.Oggetto, CASE WHEN ROW_NUMBER() OVER (PARTITION BY TESTEDOCUMENTI_1.PROGRESSIVO
ORDER BY TESTEDOCUMENTI_1.PROGRESSIVO) > 1 THEN '' ELSE CAST(TESTEDOCUMENTI_1.TOTDOCUMENTO AS MONEY) END AS ImportoTotale, 
dbo.AnagraficaCommesse.RifComm, dbo.ANAGRAFICAARTICOLI.DESCRIZIONE AS RespCommessa, dbo.AnagraficaCommesse.DataConsegnaPrev AS DataRichiestaProgetto, 
dbo.AnagraficaCommesse.DataConsegnaSched AS DataConsegnaProgetto, CASE WHEN ROW_NUMBER() OVER (PARTITION BY TESTEDOCUMENTI_1.PROGRESSIVO
ORDER BY TESTEDOCUMENTI_1.PROGRESSIVO) > 1 THEN '' ELSE CAST(dbo.ExtraCommCli.NoteCommessa AS VARCHAR) END AS Notecommessa, 
dbo.AnagraficaCommesse.StatoCommessa, CostiInterni.TIPODOC AS DocCostiInt, CostiInterni.NUMERODOC AS NumDocCostiInt, CostiInterni.DATADOC AS DataDocCostiInt, 
CostiInterni.DESCRIZIONEART AS DescrizioneCostiInt, CASE WHEN ROW_NUMBER() OVER (PARTITION BY ChiaveCostiInterni
ORDER BY ChiaveCostiInterni) > 1 THEN '' ELSE CAST(CostiInterni.TOTOREPREV AS INTEGER) END AS TotOrePreviste, CostiEsterni.TIPODOC AS DocCostiExt, 
CostiEsterni.NUMERODOC AS NumDocCostiExt, CostiEsterni.DATADOC AS DataDocCostiExt, CostiEsterni.DESCRIZIONEART AS DescrizioneCostiExt, 
CASE WHEN ROW_NUMBER() OVER (PARTITION BY ChiaveCostiEsterni
ORDER BY ChiaveCostiEsterni) > 1 THEN '' ELSE CAST(CostiEsterni.TotRigaCostiExt AS MONEY) END AS TotaleCostiEsterni, OrdiniServizio.TIPODOC AS OrdineServizio, 
OrdiniServizio.NUMERODOC AS NumeroOrdineServizio, OrdiniServizio.DATADOC AS DataOrdineServizio, OrdiniServizio.DESCRIZIONEART AS DescrizioneServizio, 
CASE WHEN ROW_NUMBER() OVER (PARTITION BY ChiaveOrdiniServizio
ORDER BY ChiaveOrdiniServizio) > 1 THEN '' ELSE CAST(OrdiniServizio.Expr1 AS MONEY) END AS TotaleNettoRigaServizio, ServizioEsterno.TIPODOC AS ServizioEsterno, 
ServizioEsterno.NUMERODOC AS NumeroDocServizioEsterno, ServizioEsterno.DATADOC AS DataDocServizioEsterno, CASE WHEN ROW_NUMBER() OVER (PARTITION BY 
ChiaveServizioEsterno
ORDER BY ChiaveServizioEsterno) > 1 THEN '' ELSE CAST(TotaleRigaServizioEsterno AS MONEY) END AS TotaleImponibileServizioEsterno, 
ServizioEsterno.CODCONTO AS CodiceFornitoreEsterno, ServizioEsterno.DSCCONTO1 AS DescrizioneFornitoreEsterno
FROM            /* Selezione Servizio Esterno con mantenimento idTesta ed Idriga per Rowqcount ed esclusione valori doppi */ (SELECT        CONCAT(RIGHEDOCUMENTI_1.IDTESTA, 
                                                                                                                                                                                                                                                                                                    RIGHEDOCUMENTI_1.IDRIGA) 
                                                                                                                                                                                                                                                                                                    AS ChiaveServizioEsterno, 
                                                                                                                                                                                                                                                                                                    RIGHEDOCUMENTI_1.TIPODOC, 
                                                                                                                                                                                                                                                                                                    RIGHEDOCUMENTI_1.NUMERODOC, 
                                                                                                                                                                                                                                                                                                    TESTEDOCUMENTI_2.DATADOC, 
                                                                                                                                                                                                                                                                                                    RIGHEDOCUMENTI_1.RIFCOMMCLI, 
                                                                                                                                                                                                                                                                                                    SUM(RIGHEDOCUMENTI_1.TOTNETTORIGAEURO)
                                                                                                                                                                                                                                                                                                     AS TotaleRigaServizioEsterno, 
                                                                                                                                                                                                                                                                                                    dbo.ANAGRAFICACF.CODCONTO, 
                                                                                                                                                                                                                                                                                                    dbo.ANAGRAFICACF.DSCCONTO1
                                                                                                                                                                                                                                                                           FROM            dbo.RIGHEDOCUMENTI AS RIGHEDOCUMENTI_1
                                                                                                                                                                                                                                                                                                     INNER JOIN
                                                                                                                                                                                                                                                                                                    dbo.TESTEDOCUMENTI AS TESTEDOCUMENTI_2
                                                                                                                                                                                                                                                                                                     ON 
                                                                                                                                                                                                                                                                                                    RIGHEDOCUMENTI_1.IDTESTA = TESTEDOCUMENTI_2.PROGRESSIVO
                                                                                                                                                                                                                                                                                                     INNER JOIN
                                                                                                                                                                                                                                                                                                    dbo.ANAGRAFICACF ON 
                                                                                                                                                                                                                                                                                                    TESTEDOCUMENTI_2.CODCLIFOR = dbo.ANAGRAFICACF.CODCONTO
                                                                                                                                                                                                                                                                           WHERE        (RIGHEDOCUMENTI_1.CODART IN ('ZB00130',
                                                                                                                                                                                                                                                                                                     'ZB00131', 'ZB01#15', 'ZB05#15', 
                                                                                                                                                                                                                                                                                                    'ZB06#15', 'ZB01#16')) AND 
                                                                                                                                                                                                                                                                                                    (RIGHEDOCUMENTI_1.TIPODOC = '2SE')
                                                                                                                                                                                                                                                                           GROUP BY RIGHEDOCUMENTI_1.IDTESTA, 
                                                                                                                                                                                                                                                                                                    RIGHEDOCUMENTI_1.IDRIGA, 
                                                                                                                                                                                                                                                                                                    RIGHEDOCUMENTI_1.TIPODOC, 
                                                                                                                                                                                                                                                                                                    RIGHEDOCUMENTI_1.NUMERODOC, 
                                                                                                                                                                                                                                                                                                    RIGHEDOCUMENTI_1.RIFCOMMCLI, 
                                                                                                                                                                                                                                                                                                    TESTEDOCUMENTI_2.DATADOC, 
                                                                                                                                                                                                                                                                                                    dbo.ANAGRAFICACF.CODCONTO, 
                                                                                                                                                                                                                                                                                                    dbo.ANAGRAFICACF.DSCCONTO1, 
                                                                                                                                                                                                                                                                                                    RIGHEDOCUMENTI_1.TOTNETTORIGAEURO)
                          AS ServizioEsterno RIGHT OUTER JOIN
                         dbo.AnagraficaCommesse ON ServizioEsterno.RIFCOMMCLI = dbo.AnagraficaCommesse.RifComm LEFT OUTER JOIN
                             /* Selezione Ordini di Servizio con mantenimento idTesta ed Idriga per Rowqcount ed esclusione valori doppi */ (SELECT        CONCAT(RIGHEDOCUMENTI_1.IDTESTA,
                                                                                                                                                                                                                                                                                                            RIGHEDOCUMENTI_1.IDRIGA) 
                                                                                                                                                                                                                                                                                                           AS ChiaveOrdiniServizio, 
                                                                                                                                                                                                                                                                                                           RIGHEDOCUMENTI_1.TIPODOC, 
                                                                                                                                                                                                                                                                                                           RIGHEDOCUMENTI_1.NUMERODOC, 
                                                                                                                                                                                                                                                                                                           TESTEDOCUMENTI_2.DATADOC, 
                                                                                                                                                                                                                                                                                                           RIGHEDOCUMENTI_1.RIFCOMMCLI, 
                                                                                                                                                                                                                                                                                                           RIGHEDOCUMENTI_1.DESCRIZIONEART,
                                                                                                                                                                                                                                                                                                            SUM(RIGHEDOCUMENTI_1.TOTNETTORIGAEURO)
                                                                                                                                                                                                                                                                                                            AS Expr1
                                                                                                                                                                                                                                                                                 FROM            dbo.RIGHEDOCUMENTI AS RIGHEDOCUMENTI_1
                                                                                                                                                                                                                                                                                                            INNER JOIN
                                                                                                                                                                                                                                                                                                           dbo.TESTEDOCUMENTI AS TESTEDOCUMENTI_2
                                                                                                                                                                                                                                                                                                            ON 
                                                                                                                                                                                                                                                                                                           RIGHEDOCUMENTI_1.IDTESTA = TESTEDOCUMENTI_2.PROGRESSIVO
                                                                                                                                                                                                                                                                                 WHERE        (RIGHEDOCUMENTI_1.CODART IN ('ZB00130',
                                                                                                                                                                                                                                                                                                            'ZB00131', 'ZB01#15', 'ZB05#15', 
                                                                                                                                                                                                                                                                                                           'ZB06#15', 'ZB01#16')) AND 
                                                                                                                                                                                                                                                                                                           (RIGHEDOCUMENTI_1.TIPODOC = '1OS')
                                                                                                                                                                                                                                                                                 GROUP BY RIGHEDOCUMENTI_1.TIPODOC, 
                                                                                                                                                                                                                                                                                                           RIGHEDOCUMENTI_1.NUMERODOC, 
                                                                                                                                                                                                                                                                                                           RIGHEDOCUMENTI_1.RIFCOMMCLI, 
                                                                                                                                                                                                                                                                                                           TESTEDOCUMENTI_2.DATADOC, 
                                                                                                                                                                                                                                                                                                           RIGHEDOCUMENTI_1.DESCRIZIONEART,
                                                                                                                                                                                                                                                                                                            RIGHEDOCUMENTI_1.IDTESTA, 
                                                                                                                                                                                                                                                                                                           RIGHEDOCUMENTI_1.IDRIGA) 
                         AS OrdiniServizio ON dbo.AnagraficaCommesse.RifComm = OrdiniServizio.RIFCOMMCLI LEFT OUTER JOIN
                             /* Selezione Costi Esterni con mantenimento idTesta ed Idriga per Rowqcount ed esclusione valori doppi */ (SELECT        CONCAT(RIGHEDOCUMENTI_2.IDTESTA, 
                                                                                                                                                                                                                                                                                                 RIGHEDOCUMENTI_2.IDRIGA) 
                                                                                                                                                                                                                                                                                                 AS ChiaveCostiEsterni, 
                                                                                                                                                                                                                                                                                                 RIGHEDOCUMENTI_2.TIPODOC, 
                                                                                                                                                                                                                                                                                                 RIGHEDOCUMENTI_2.NUMERODOC, 
                                                                                                                                                                                                                                                                                                 dbo.TESTEDOCUMENTI.DATADOC, 
                                                                                                                                                                                                                                                                                                 RIGHEDOCUMENTI_2.RIFCOMMCLI, 
                                                                                                                                                                                                                                                                                                 RIGHEDOCUMENTI_2.DESCRIZIONEART, 
                                                                                                                                                                                                                                                                                                 SUM(RIGHEDOCUMENTI_2.TOTNETTORIGAEURO)
                                                                                                                                                                                                                                                                                                  AS TotRigaCostiExt
                                                                                                                                                                                                                                                                       FROM            dbo.RIGHEDOCUMENTI AS RIGHEDOCUMENTI_2
                                                                                                                                                                                                                                                                                                  INNER JOIN
                                                                                                                                                                                                                                                                                                 dbo.TESTEDOCUMENTI ON 
                                                                                                                                                                                                                                                                                                 RIGHEDOCUMENTI_2.IDTESTA = dbo.TESTEDOCUMENTI.PROGRESSIVO
                                                                                                                                                                                                                                                                       WHERE        (RIGHEDOCUMENTI_2.CODART IN ('ZB00130',
                                                                                                                                                                                                                                                                                                  'ZB00131', 'ZB01#15', 'ZB05#15', 
                                                                                                                                                                                                                                                                                                 'ZB06#15', 'ZB01#16')) AND 
                                                                                                                                                                                                                                                                                                 (RIGHEDOCUMENTI_2.TIPODOC = '1SE')
                                                                                                                                                                                                                                                                       GROUP BY RIGHEDOCUMENTI_2.IDTESTA, 
                                                                                                                                                                                                                                                                                                 RIGHEDOCUMENTI_2.IDRIGA, 
                                                                                                                                                                                                                                                                                                 RIGHEDOCUMENTI_2.TIPODOC, 
                                                                                                                                                                                                                                                                                                 RIGHEDOCUMENTI_2.NUMERODOC, 
                                                                                                                                                                                                                                                                                                 RIGHEDOCUMENTI_2.RIFCOMMCLI, 
                                                                                                                                                                                                                                                                                                 dbo.TESTEDOCUMENTI.DATADOC, 
                                                                                                                                                                                                                                                                                                 RIGHEDOCUMENTI_2.DESCRIZIONEART) 
                         AS CostiEsterni ON dbo.AnagraficaCommesse.RifComm = CostiEsterni.RIFCOMMCLI LEFT OUTER JOIN
                             /* Selezione Costi Interni con mantenimento idTesta ed Idriga per Rowqcount ed esclusione valori doppi */ (SELECT        CONCAT(RIGHEDOCUMENTI_1.IDTESTA, 
                                                                                                                                                                                                                                                                                               RIGHEDOCUMENTI_1.IDRIGA) 
                                                                                                                                                                                                                                                                                               AS ChiaveCostiInterni, 
                                                                                                                                                                                                                                                                                               RIGHEDOCUMENTI_1.TIPODOC, 
                                                                                                                                                                                                                                                                                               RIGHEDOCUMENTI_1.NUMERODOC, 
                                                                                                                                                                                                                                                                                               TESTEDOCUMENTI_2.DATADOC, 
                                                                                                                                                                                                                                                                                               RIGHEDOCUMENTI_1.RIFCOMMCLI, 
                                                                                                                                                                                                                                                                                               RIGHEDOCUMENTI_1.DESCRIZIONEART, 
                                                                                                                                                                                                                                                                                               SUM(RIGHEDOCUMENTI_1.QTAGEST) 
                                                                                                                                                                                                                                                                                               AS TotOrePrev
                                                                                                                                                                                                                                                                      FROM            dbo.RIGHEDOCUMENTI AS RIGHEDOCUMENTI_1
                                                                                                                                                                                                                                                                                                INNER JOIN
                                                                                                                                                                                                                                                                                               dbo.TESTEDOCUMENTI AS TESTEDOCUMENTI_2
                                                                                                                                                                                                                                                                                                ON 
                                                                                                                                                                                                                                                                                               RIGHEDOCUMENTI_1.IDTESTA = TESTEDOCUMENTI_2.PROGRESSIVO
                                                                                                                                                                                                                                                                      WHERE        (RIGHEDOCUMENTI_1.CODART IN ('ZA00015',
                                                                                                                                                                                                                                                                                                'ZA00010')) AND 
                                                                                                                                                                                                                                                                                               (RIGHEDOCUMENTI_1.TIPODOC = '1MU')
                                                                                                                                                                                                                                                                      GROUP BY RIGHEDOCUMENTI_1.IDTESTA, 
                                                                                                                                                                                                                                                                                               RIGHEDOCUMENTI_1.IDRIGA, 
                                                                                                                                                                                                                                                                                               RIGHEDOCUMENTI_1.TIPODOC, 
                                                                                                                                                                                                                                                                                               RIGHEDOCUMENTI_1.NUMERODOC, 
                                                                                                                                                                                                                                                                                               RIGHEDOCUMENTI_1.RIFCOMMCLI, 
                                                                                                                                                                                                                                                                                               TESTEDOCUMENTI_2.DATADOC, 
                                                                                                                                                                                                                                                                                               RIGHEDOCUMENTI_1.DESCRIZIONEART, 
                                                                                                                                                                                                                                                                                               RIGHEDOCUMENTI_1.IDRIGA) 
                         AS CostiInterni ON dbo.AnagraficaCommesse.RifComm = CostiInterni.RIFCOMMCLI LEFT OUTER JOIN
                         dbo.TESTEDOCUMENTI AS TESTEDOCUMENTI_1 INNER JOIN
                         dbo.RIGHEDOCUMENTI ON TESTEDOCUMENTI_1.PROGRESSIVO = dbo.RIGHEDOCUMENTI.IDTESTA INNER JOIN
                         dbo.ANAGRAFICACF AS ANAGRAFICACF_1 ON TESTEDOCUMENTI_1.CODCLIFOR = ANAGRAFICACF_1.CODCONTO ON 
                         dbo.AnagraficaCommesse.RifComm = dbo.RIGHEDOCUMENTI.RIFCOMMCLI LEFT OUTER JOIN
                         dbo.ANAGRAFICAARTICOLI RIGHT OUTER JOIN
                         dbo.ExtraCommCli ON dbo.ANAGRAFICAARTICOLI.CODICE = dbo.ExtraCommCli.ResponsabileCommessa ON 
                         dbo.AnagraficaCommesse.Progressivo = dbo.ExtraCommCli.RifProgressivo
WHERE        (dbo.RIGHEDOCUMENTI.TIPORIGA = 'N') AND (dbo.RIGHEDOCUMENTI.ESERCIZIO >= 2016) AND (dbo.RIGHEDOCUMENTI.TIPODOC IN ('ORS', 'OR4', 'OR5')) AND 
                         (dbo.AnagraficaCommesse.RifComm LIKE 'IM1%' OR
                         dbo.AnagraficaCommesse.RifComm LIKE 'IAS%' OR
                         dbo.AnagraficaCommesse.RifComm LIKE 'IAV%' OR
                         dbo.AnagraficaCommesse.RifComm LIKE 'IMS%' OR
                         dbo.AnagraficaCommesse.RifComm LIKE 'ING%' OR
dbo.AnagraficaCommesse.RifComm LIKE 'ISA%' OR
dbo.AnagraficaCommesse.RifComm LIKE 'RSY%' OR
                         dbo.AnagraficaCommesse.RifComm LIKE 'RIA%')
GROUP BY dbo.RIGHEDOCUMENTI.ESERCIZIO, dbo.RIGHEDOCUMENTI.TIPODOC, dbo.RIGHEDOCUMENTI.NUMERODOC, TESTEDOCUMENTI_1.DATADOC, 
                         TESTEDOCUMENTI_1.CODCLIFOR, ANAGRAFICACF_1.DSCCONTO1, dbo.AnagraficaCommesse.Oggetto, TESTEDOCUMENTI_1.TOTDOCUMENTO, 
                         dbo.AnagraficaCommesse.RifComm, dbo.ANAGRAFICAARTICOLI.DESCRIZIONE, dbo.AnagraficaCommesse.DataConsegnaPrev, 
                         dbo.AnagraficaCommesse.DataConsegnaSched, dbo.ExtraCommCli.NoteCommessa, dbo.AnagraficaCommesse.StatoCommessa, CostiInterni.TIPODOC, 
                         CostiInterni.NUMERODOC, CostiInterni.DATADOC, CostiInterni.DESCRIZIONEART, CostiInterni.TOTOREPREV, CostiEsterni.TIPODOC, CostiEsterni.NUMERODOC, 
                         CostiEsterni.DATADOC, CostiEsterni.DESCRIZIONEART, OrdiniServizio.TIPODOC, OrdiniServizio.NUMERODOC, OrdiniServizio.DATADOC, 
                         OrdiniServizio.DESCRIZIONEART, OrdiniServizio.Expr1, ServizioEsterno.TIPODOC, ServizioEsterno.NUMERODOC, ServizioEsterno.DATADOC, 
                         ServizioEsterno.CODCONTO, ServizioEsterno.DSCCONTO1, TotRigaCostiExt, ChiaveCostiInterni, ChiaveServizioEsterno, TotaleRigaServizioEsterno, 
                         ChiaveOrdiniServizio, TESTEDOCUMENTI_1.PROGRESSIVO, ChiaveCostiEsterni
ORDER BY rifcomm, ChiaveCostiInterni, ChiaveServizioEsterno, ChiaveCostiEsterni

GO
GRANT SELECT
    ON OBJECT::[dbo].[Biri_ExportPrj] TO [tes04]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Biri_ExportPrj] TO [mbernabe]
    AS [dbo];


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[7] 4[24] 2[9] 3) )"
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
         Configuration = "(H (4[22] 2[51] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[56] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2[52] 3) )"
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
         Configuration = "(H (1[35] 4[40] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[40] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[72] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4[48] 2) )"
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
         Width =', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Biri_ExportPrj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N' 1500
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
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 15855
         Alias = 4485
         Table = 3345
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 2850
         Filter = 6855
         Or = 4185
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Biri_ExportPrj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Biri_ExportPrj';

