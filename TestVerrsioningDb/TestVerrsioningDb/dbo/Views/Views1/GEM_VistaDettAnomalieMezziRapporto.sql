CREATE VIEW dbo.GEM_VistaDettAnomalieMezziRapporto
AS
SELECT        t.IDCONTRATTO, t.CODCLIENTE, t.CODCLIFAT, t.DATACONTRATTO, t.DATAEFFICACIA, t.DATAPVISITA, t.DURATA, t.FLAG_PROV, t.PAGAMENTO, t.NOTE, t.REFERENTE, 
                         t.TEL_REF, t.FLAG_ELIMINATO, t.TOTALE_CONTRATTO, t.RATA_CONTRATTO, t.PROVVIGIONE, t.DATASCADENZA, t.AZRIF, t.RINNOVOAUT, t.IdStato, t.DataIdStato, 
                         t.PCONTR, t.NOTA_DIS, t.DATA_DIS, t.DATABLOCCO, t.FLAGBLOCCO, t.RESP_MANU, t.RESP_CONTR, t.SCONTO, t.DATARACC, t.DATAFLOPPY1, t.DATAFLOPPY2, 
                         t.CONTRORIG, t.MINISFS, t.PREAVVISOFAT, t.flgvendis, t.flg_mat_dafatt, t.FLG_RIC_SCA_AUTO, t.EMAIL_RESPONSABILE, t.RIN_PCONTR, t.STAGIONALE, 
                         t.CODCategoriaContratto, t.CODReferenteInternoGestione, t.RegistroOnLine, t.RichiestaAutorizzFattura, t.CollegatoAdAltriContratti, t.CondizioniParticolariCollegate, 
                         t.idModFatt, t.idTipoFatt, t.PubblicaGemmaPlus, t.DataPrimaRata, t.CadenzaRate, t.FLGUSAPRZGEMMA, t.PROVV_SEGNALATORE, ISNULL(t.CodAgente1, '') 
                         AS CodAgente1, ISNULL(age1.DSCAGENTE, '') AS DscAgente1, ISNULL(t.CodAgente2, '') AS CodAgente2, ISNULL(age2.DSCAGENTE, '') AS DscAgente2, 
                         ISNULL(t.CodAgente3, '') AS CodAgente3, ISNULL(age3.DSCAGENTE, '') AS DscAgente3, sc.SEZIONECONTRATTO, sc.OLD_RifSezioneGemma, sc.CODDEST, 
                         sc.DESCRIZIONESEZIONE, sc.idTipoFatt AS SEZ_idTipoFatt, sc.idTipologMezzo, tm.Descrizione AS DescTipologMezzo, sc.IdStrutturaOpPr, sc.Revisione, 
                         sc.CodiceMezzo, sc.CodTecnicoRisorsa, sc.PAGAMENTO AS SEZ_PAGAMENTO, sc.DATAPVISITA AS SEZ_DATAPVISITA, sc.FLG_OperDeroga, sc.NrOperazInDeroga, 
                         sc.CadenzeInDeroga, sc.NOTE AS SEZ_NOTE, sc.NOTE_TECNICO, sc.REFERENTE AS SEZ_REFERENTE, sc.FLAG_ELIMINATO AS SEZ_FLAG_ELIMINATO, 
                         sc.DATAEliminato, sc.RESP_MANU AS SEZ_RESP_MANU, sc.RESP_CONTR AS SEZ_RESP_CONTR, sc.TIPO_PIATTAFORMA, sc.REPARTO, sc.ORE_INT, 
                         sc.GIORNI_PIATT, sc.flg_mat_dafatt AS SEZ_flg_mat_dafatt, sc.FLG_RIC_SCA_AUTO AS SEZ_FLG_RIC_SCA_AUTO, sc.RIFCLIENTE, 
                         sc.FLGUSAPRZGEMMA AS SEZ_FLGUSAPRZGEMMA, sc.idGListinoContr, sc.FLAG_PROV AS SEZ_FLAG_PROV, sc.CodSezioniAggregate, sc.SezioneAggrPrimaria, 
                         sc.ImportoContrattoSezione, sc.Provvigione1, CASE isnull(sc.coddest, 0) WHEN 0 THEN
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
                               WHERE        i.CODCONTO = t .CODCLIENTE AND i.CODICE = sc.CODDEST) END AS SedeProvincia, CASE isnull(sc.coddest, 0) WHEN 0 THEN
                             (SELECT        a.CAP
                               FROM            dbo.GEM_TESTACONTRATTO cr INNER JOIN
                                                         anagraficaCF a ON cr.IDCONTRATTO = t .IDCONTRATTO AND cr.CODCLIENTE = a.codconto) ELSE
                             (SELECT        i.CAP
                               FROM            destinazionidiverse i
                               WHERE        i.CODCONTO = t .CODCLIENTE AND i.CODICE = sc.CODDEST) END AS SedeCAP, dm.IdRigaMezzo, dm.CodMezzo AS CodMezzoDM, 
                         AnaArt.DESCRIZIONE AS DscCodMezzoDM, dm.DataInserimento, dm.DataEliminazione, dm.ELIMINATO AS EliminatoDM, dm.POSIZIONE, dm.SUBPOSIZIONE, 
                         dm.UBICAZIONE, dm.POSCLIENTE, dm.NOTE AS NOTE_DM, dm.ORDINE, dm.CarTesto1, dm.CarTesto2, dm.CarTesto3, dm.CarTesto4, dm.CarTesto5, dm.CarTesto6, 
                         dm.CarTesto7, dm.CarTesto8, dm.CarTesto9, dm.CodiceBarre, dm.OMOLOGATO, dm.ANNO, dm.FLAG_INST, dm.STATO, dm.POSQLIK, dm.QUANTITA, 
                         dm.TEMPO_MAN, dm.IMPORTOAT1, dm.IMPORTOAT2, dm.IMPORTOAT3, dm.IMPORTOAT4, dm.IMPORTOAT5, dm.SCONTOAT1, dm.SCONTOAT2, dm.SCONTOAT3, 
                         dm.SCONTOAT4, dm.SCONTOAT5, dm.PROV1AT1, dm.PROV1AT2, dm.PROV1AT3, dm.PROV1AT4, dm.PROV1AT5, dm.PROV2AT1, dm.PROV2AT2, dm.PROV2AT3, 
                         dm.PROV2AT4, dm.PROV2AT5, dm.PROV3AT1, dm.PROV3AT2, dm.PROV3AT3, dm.PROV3AT4, dm.PROV3AT5, dm.DATA_REV, dm.DATA_PREV, dm.DATA_COLL, 
                         dm.DATA_PCOLL, dm.StatoFuoriSede, dm.StatoAttivita, dm.FLAGAT1, dm.FLAGAT2, dm.FLAGAT3, dm.FLAGAT4, dm.FLAGAT5, dm.FLAGRICARICA, dm.IDRAPPORTO, 
                         rp.STATO AS STATO_rp, rp.DA_FATT, rp.ELIMINATO AS ELIMINATO_rp, rp.TECNICO_EFF, agetr.DSCAGENTE AS DescTecnicoEff, exAgTecnEff.TipoAgente, 
                         rp.DATA_EFF, rp.TECNICO_PREV, rp.TIPOLOGIARAPPORTO, rp.TIPO_RAPPORTO, a.DSCCONTO1 AS RagSocClienteFatt, vCli.DSCCONTO1 AS RagSocCliente, 
                         vCli.CODSETTORE, vCli.CODZONA, dm.AnnotazioniTecnica, DM_Anomalie.IdRigaAnomalia, DM_Anomalie.idAnomalia, 
                         TTabAnomalie.DscAnomalia AS TTabDscAnomalie, TTabAnomalie.idLivelloRischio, TTabLivelloRischio.DscLivelloRischio, TTabLivelloRischio.Allert, 
                         TTabLivelloRischio.Colore, DM_Anomalie.Semaforo, DM_Anomalie.Note AS DM_AnomalieNote, DM_Anomalie.idStatoAnomalia, 
                         TStAnomalia.DESCRIZIONE AS DscStatoAnomalia, DM_Anomalie.DataApertura, DM_Anomalie.IdRapportoChiusura, DM_Anomalie.DataChiusura, 
                         TStAnomalia.FLGCHIUDI, DM_Anomalie.Eliminato, DM_Anomalie.DataEliminazione AS DM_AnomalieDtEliminata, DM_Anomalie.UTENTEMODIFICA, 
                         DM_Anomalie.DATAMODIFICA
FROM            dbo.EXTRAAGENTI AS exAgTecnEff RIGHT OUTER JOIN
                         dbo.ANAGRAFICAAGENTI AS age3 RIGHT OUTER JOIN
                         dbo.ANAGRAFICAAGENTI AS age1 RIGHT OUTER JOIN
                         dbo.GEM_T_TAB_ANOMALIE AS TTabAnomalie INNER JOIN
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
                         dbo.GEM_T_TAB_STATOAnomalie AS TStAnomalia ON DM_Anomalie.idStatoAnomalia = TStAnomalia.CODICE LEFT OUTER JOIN
                         dbo.GEM_T_TAB_LivelloRischio AS TTabLivelloRischio ON TTabAnomalie.idLivelloRischio = TTabLivelloRischio.idLivelloRischio LEFT OUTER JOIN
                         dbo.ANAGRAFICACF AS a ON t.CODCLIFAT = a.CODCONTO LEFT OUTER JOIN
                         dbo.VISTACLIENTI AS vCli ON t.CODCLIENTE = vCli.CODCONTO ON age1.CODAGENTE = t.CodAgente1 LEFT OUTER JOIN
                         dbo.ANAGRAFICAAGENTI AS age2 ON t.CodAgente2 = age2.CODAGENTE ON age3.CODAGENTE = t.CodAgente3 ON 
                         exAgTecnEff.CODAGENTE = rp.TECNICO_EFF LEFT OUTER JOIN
                         dbo.ANAGRAFICAAGENTI AS agetr ON rp.TECNICO_EFF = agetr.CODAGENTE

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaDettAnomalieMezziRapporto] TO [Metodo98]
    AS [dbo];


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[66] 4[3] 2[13] 3) )"
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
         Configuration = "(H (1[56] 3) )"
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
         Top = -288
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TTabAnomalie"
            Begin Extent = 
               Top = 327
               Left = 1512
               Bottom = 456
               Right = 1703
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DM_Anomalie"
            Begin Extent = 
               Top = 57
               Left = 1269
               Bottom = 413
               Right = 1475
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dm"
            Begin Extent = 
               Top = 592
               Left = 391
               Bottom = 721
               Right = 621
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 38
               Left = 707
               Bottom = 418
               Right = 959
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sc"
            Begin Extent = 
               Top = 45
               Left = 410
               Bottom = 788
               Right = 644
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tm"
            Begin Extent = 
               Top = 146
               Left = 697
               Bottom = 275
               Right = 920
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "rp"
            Begin Extent = 
               Top = 22
               Left = 36
               Bottom = 515
               Right = 293
            End
            DisplayFlags = 280
         ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'GEM_VistaDettAnomalieMezziRapporto';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'   TopColumn = 0
         End
         Begin Table = "AnaArt"
            Begin Extent = 
               Top = 559
               Left = 1001
               Bottom = 688
               Right = 1253
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "TStAnomalia"
            Begin Extent = 
               Top = 157
               Left = 1550
               Bottom = 286
               Right = 1741
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TTabLivelloRischio"
            Begin Extent = 
               Top = 979
               Left = 1422
               Bottom = 1235
               Right = 1613
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vCli"
            Begin Extent = 
               Top = 23
               Left = 1014
               Bottom = 388
               Right = 1240
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "agetr"
            Begin Extent = 
               Top = 608
               Left = 729
               Bottom = 737
               Right = 944
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "exAgTecnEff"
            Begin Extent = 
               Top = 390
               Left = 997
               Bottom = 519
               Right = 1243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "age3"
            Begin Extent = 
               Top = 420
               Left = 682
               Bottom = 549
               Right = 897
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "age1"
            Begin Extent = 
               Top = 516
               Left = 38
               Bottom = 645
               Right = 253
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 648
               Left = 38
               Bottom = 777
               Right = 265
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "age2"
            Begin Extent = 
               Top = 690
               Left = 982
               Bottom = 819
               Right = 1197
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
      Begin ColumnWidths = 11
         Column = 4440
         Alias = 3435
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'GEM_VistaDettAnomalieMezziRapporto';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'GEM_VistaDettAnomalieMezziRapporto';

