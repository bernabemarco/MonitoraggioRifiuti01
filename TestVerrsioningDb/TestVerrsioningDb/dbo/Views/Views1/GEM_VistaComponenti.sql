CREATE VIEW [dbo].[GEM_VistaComponenti]
AS
SELECT     t.IDCONTRATTO, t.CODCLIENTE, t.CODCLIFAT, t.DATACONTRATTO, t.DATAEFFICACIA, t.DATAPVISITA, t.DURATA, t.FLAG_PROV, t.PAGAMENTO, 
                      t.REFERENTE, t.TEL_REF, t.FLAG_ELIMINATO, t.TOTALE_CONTRATTO, t.RATA_CONTRATTO, t.PROVVIGIONE, t.DATASCADENZA, t.AZRIF, 
                      t.RINNOVOAUT, t.IdStato, t.DataIdStato, t.PCONTR, t.NOTA_DIS, t.DATA_DIS, t.DATABLOCCO, t.FLAGBLOCCO, t.RESP_MANU, t.RESP_CONTR, t.SCONTO,
                       t.DATARACC, t.DATAFLOPPY1, t.DATAFLOPPY2, t.CONTRORIG, t.MINISFS, t.PREAVVISOFAT, t.flgvendis, t.flg_mat_dafatt, t.FLG_RIC_SCA_AUTO, 
                      t.EMAIL_RESPONSABILE, t.RIN_PCONTR, t.STAGIONALE, t.CODCategoriaContratto, t.CODReferenteInternoGestione, t.RegistroOnLine, 
                      t.RichiestaAutorizzFattura, t.CollegatoAdAltriContratti, t.CondizioniParticolariCollegate, t.idModFatt, t.idTipoFatt, t.PubblicaGemmaPlus, t.DataPrimaRata, 
                      t.CadenzaRate, t.FLGUSAPRZGEMMA, t.PROVV_SEGNALATORE, ISNULL(t.CodAgente1, '') AS CodAgente1, ISNULL(age1.DSCAGENTE, '') 
                      AS DscAgente1, ISNULL(t.CodAgente2, '') AS CodAgente2, ISNULL(age2.DSCAGENTE, '') AS DscAgente2, ISNULL(t.CodAgente3, '') AS CodAgente3, 
                      ISNULL(age3.DSCAGENTE, '') AS DscAgente3, sc.SEZIONECONTRATTO, sc.OLD_RifSezioneGemma, sc.CODDEST, sc.DESCRIZIONESEZIONE, 
                      sc.idTipoFatt AS SEZ_idTipoFatt, sc.idTipologMezzo, tm.Descrizione AS DescTipologMezzo, sc.IdStrutturaOpPr, sc.Revisione, sc.CodiceMezzo, 
                      sc.CodTecnicoRisorsa, agetr.DSCAGENTE AS DescTecnicoRisorsa, sc.PAGAMENTO AS SEZ_PAGAMENTO, sc.DATAPVISITA AS SEZ_DATAPVISITA, 
                      sc.FLG_OperDeroga, sc.NrOperazInDeroga, sc.CadenzeInDeroga, sc.REFERENTE AS SEZ_REFERENTE, 
                      sc.FLAG_ELIMINATO AS SEZ_FLAG_ELIMINATO, sc.DATAEliminato, sc.RESP_MANU AS SEZ_RESP_MANU, sc.RESP_CONTR AS SEZ_RESP_CONTR, 
                      sc.TIPO_PIATTAFORMA, sc.REPARTO, sc.ORE_INT, sc.GIORNI_PIATT, sc.flg_mat_dafatt AS SEZ_flg_mat_dafatt, 
                      sc.FLG_RIC_SCA_AUTO AS SEZ_FLG_RIC_SCA_AUTO, sc.RIFCLIENTE, sc.FLGUSAPRZGEMMA AS SEZ_FLGUSAPRZGEMMA, sc.idGListinoContr, 
                      sc.FLAG_PROV AS SEZ_FLAG_PROV, sc.CodSezioniAggregate, sc.SezioneAggrPrimaria, sc.ImportoContrattoSezione, sc.Provvigione1, 
                      CASE isnull(sc.coddest, 0) WHEN 0 THEN
                          (SELECT     a.dscconto1
                            FROM          dbo.GEM_TESTACONTRATTO cr INNER JOIN
                                                   anagraficaCF a ON cr.IDCONTRATTO = t .IDCONTRATTO AND cr.CODCLIENTE = a.codconto) ELSE
                          (SELECT     i.ragioneSociale
                            FROM          destinazionidiverse i
                            WHERE      i.CODCONTO = t .CODCLIENTE AND i.CODICE = sc.CODDEST) END AS SedeRagSoc, CASE isnull(coddest, 0) WHEN 0 THEN
                          (SELECT     a.Indirizzo
                            FROM          dbo.GEM_TESTACONTRATTO cr INNER JOIN
                                                   anagraficaCF a ON cr.IDCONTRATTO = t .IDCONTRATTO AND cr.CODCLIENTE = a.codconto) ELSE
                          (SELECT     i.Indirizzo
                            FROM          destinazionidiverse i
                            WHERE      i.CODCONTO = t .CODCLIENTE AND i.CODICE = sc.CODDEST) END AS SedeIndirizzo, CASE isnull(coddest, 0) WHEN 0 THEN
                          (SELECT     a.Localita
                            FROM          dbo.GEM_TESTACONTRATTO cr INNER JOIN
                                                   anagraficaCF a ON cr.IDCONTRATTO = t .IDCONTRATTO AND cr.CODCLIENTE = a.codconto) ELSE
                          (SELECT     i.Localita
                            FROM          destinazionidiverse i
                            WHERE      i.CODCONTO = t .CODCLIENTE AND i.CODICE = sc.CODDEST) END AS SedeLocalita, CASE isnull(coddest, 0) WHEN 0 THEN
                          (SELECT     a.Provincia
                            FROM          dbo.GEM_TESTACONTRATTO cr INNER JOIN
                                                   anagraficaCF a ON cr.IDCONTRATTO = t .IDCONTRATTO AND cr.CODCLIENTE = a.codconto) ELSE
                          (SELECT     i.Provincia
                            FROM          destinazionidiverse i
                            WHERE      i.CODCONTO = t .CODCLIENTE AND i.CODICE = sc.CODDEST) END AS SedeProvincia, CASE isnull(coddest, 0) WHEN 0 THEN
                          (SELECT     a.CAP
                            FROM          dbo.GEM_TESTACONTRATTO cr INNER JOIN
                                                   anagraficaCF a ON cr.IDCONTRATTO = t .IDCONTRATTO AND cr.CODCLIENTE = a.codconto) ELSE
                          (SELECT     i.CAP
                            FROM          destinazionidiverse i
                            WHERE      i.CODCONTO = t .CODCLIENTE AND i.CODICE = sc.CODDEST) END AS SedeCAP, a.TELEFONO, a.FAX, a.TELEX, SComp.IdRigaMezzo, 
                      SComp.POSIZIONE, SComp.IdApparato, SComp.IdSottoTipoApparato, SComp.MARCA, SComp.MODELLO, SComp.QUANTITA, 
                      SComp.IMPORTO_UNITARIO, SComp.ELIMINATO, SComp.SEGNALATO, SComp.NOTE, GEM_Vista_Apparati.DESCRIZIONE AS DscApparato, 
                      GEM_Vista_SottoTipoApparato.DESCRIZIONE AS DscSottotipApparato
FROM         GEM_TESTACONTRATTO AS t INNER JOIN
                      ANAGRAFICACF AS a ON t.CODCLIENTE = a.CODCONTO LEFT OUTER JOIN
                      ANAGRAFICAAGENTI AS age1 ON t.CodAgente1 = age1.CODAGENTE LEFT OUTER JOIN
                      ANAGRAFICAAGENTI AS age2 ON t.CodAgente2 = age2.CODAGENTE LEFT OUTER JOIN
                      ANAGRAFICAAGENTI AS age3 ON t.CodAgente3 = age3.CODAGENTE INNER JOIN
                      GEM_SEZIONICONTRATTO AS sc ON t.IDCONTRATTO = sc.IDCONTRATTO INNER JOIN
                      GEM_Vista_TipologMezzo AS tm ON sc.idTipologMezzo = tm.idTipologMezzo INNER JOIN
                      GEM_SEZIONI_Componenti AS SComp ON sc.IDCONTRATTO = SComp.IDCONTRATTO AND 
                      sc.SEZIONECONTRATTO = SComp.SEZIONECONTRATTO LEFT OUTER JOIN
                      GEM_Vista_Apparati ON SComp.IdApparato = GEM_Vista_Apparati.IdApparato COLLATE SQL_Latin1_General_CP1_CI_AS LEFT OUTER JOIN
                      GEM_Vista_SottoTipoApparato ON SComp.IdApparato = GEM_Vista_SottoTipoApparato.IdApparato COLLATE SQL_Latin1_General_CP1_CI_AS AND 
                      SComp.IdSottoTipoApparato = GEM_Vista_SottoTipoApparato.IdSottoTipoApparato COLLATE SQL_Latin1_General_CP1_CI_AS LEFT OUTER JOIN
                      ANAGRAFICAAGENTI AS agetr ON sc.CodTecnicoRisorsa = agetr.CODAGENTE

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaComponenti] TO [Metodo98]
    AS [dbo];

