
CREATE VIEW [dbo].[GEM_VistaDettMezziRapporto]
AS
SELECT     t.IDCONTRATTO, t.CODCLIENTE, t.CODCLIFAT, t.DATACONTRATTO, t.DATAEFFICACIA, t.DATAPVISITA, t.DURATA, t.FLAG_PROV, t.PAGAMENTO, t.NOTE, 
                      t.REFERENTE, t.TEL_REF, t.FLAG_ELIMINATO, t.TOTALE_CONTRATTO, t.RATA_CONTRATTO, t.PROVVIGIONE, t.DATASCADENZA, t.AZRIF, 
                      t.RINNOVOAUT, t.IdStato, t.DataIdStato, t.PCONTR, t.NOTA_DIS, t.DATA_DIS, t.DATABLOCCO, t.FLAGBLOCCO, t.RESP_MANU, t.RESP_CONTR, t.SCONTO,
                       t.DATARACC, t.DATAFLOPPY1, t.DATAFLOPPY2, t.CONTRORIG, t.MINISFS, t.PREAVVISOFAT, t.flgvendis, t.flg_mat_dafatt, t.FLG_RIC_SCA_AUTO, 
                      t.EMAIL_RESPONSABILE, t.RIN_PCONTR, t.STAGIONALE, t.CODCategoriaContratto, t.CODReferenteInternoGestione, t.RegistroOnLine, 
                      t.RichiestaAutorizzFattura, t.CollegatoAdAltriContratti, t.CondizioniParticolariCollegate, t.idModFatt, t.idTipoFatt, t.PubblicaGemmaPlus, t.DataPrimaRata, 
                      t.CadenzaRate, t.FLGUSAPRZGEMMA, t.PROVV_SEGNALATORE, ISNULL(t.CodAgente1, '') AS CodAgente1, ISNULL(age1.DSCAGENTE, '') 
                      AS DscAgente1, ISNULL(t.CodAgente2, '') AS CodAgente2, ISNULL(age2.DSCAGENTE, '') AS DscAgente2, ISNULL(t.CodAgente3, '') AS CodAgente3, 
                      ISNULL(age3.DSCAGENTE, '') AS DscAgente3, sc.SEZIONECONTRATTO, sc.OLD_RifSezioneGemma, sc.CODDEST, sc.DESCRIZIONESEZIONE, 
                      sc.idTipoFatt AS SEZ_idTipoFatt, sc.idTipologMezzo, tm.Descrizione AS DescTipologMezzo, sc.IdStrutturaOpPr, sc.Revisione, sc.CodiceMezzo, 
                      sc.CodTecnicoRisorsa, sc.PAGAMENTO AS SEZ_PAGAMENTO, sc.DATAPVISITA AS SEZ_DATAPVISITA, sc.FLG_OperDeroga, sc.NrOperazInDeroga, 
                      sc.CadenzeInDeroga, sc.NOTE AS SEZ_NOTE, sc.NOTE_TECNICO, sc.REFERENTE AS SEZ_REFERENTE, 
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
                            WHERE      i.CODCONTO = t .CODCLIENTE AND i.CODICE = sc.CODDEST) END AS SedeRagSoc, CASE isnull(sc.coddest, 0) WHEN 0 THEN
                          (SELECT     a.Indirizzo
                            FROM          dbo.GEM_TESTACONTRATTO cr INNER JOIN
                                                   anagraficaCF a ON cr.IDCONTRATTO = t .IDCONTRATTO AND cr.CODCLIENTE = a.codconto) ELSE
                          (SELECT     i.Indirizzo
                            FROM          destinazionidiverse i
                            WHERE      i.CODCONTO = t .CODCLIENTE AND i.CODICE = sc.CODDEST) END AS SedeIndirizzo, CASE isnull(sc.coddest, 0) WHEN 0 THEN
                          (SELECT     a.Localita
                            FROM          dbo.GEM_TESTACONTRATTO cr INNER JOIN
                                                   anagraficaCF a ON cr.IDCONTRATTO = t .IDCONTRATTO AND cr.CODCLIENTE = a.codconto) ELSE
                          (SELECT     i.Localita
                            FROM          destinazionidiverse i
                            WHERE      i.CODCONTO = t .CODCLIENTE AND i.CODICE = sc.CODDEST) END AS SedeLocalita, CASE isnull(sc.coddest, 0) WHEN 0 THEN
                          (SELECT     a.Provincia
                            FROM          dbo.GEM_TESTACONTRATTO cr INNER JOIN
                                                   anagraficaCF a ON cr.IDCONTRATTO = t .IDCONTRATTO AND cr.CODCLIENTE = a.codconto) ELSE
                          (SELECT     i.Provincia
                            FROM          destinazionidiverse i
                            WHERE      i.CODCONTO = t .CODCLIENTE AND i.CODICE = sc.CODDEST) END AS SedeProvincia, CASE isnull(sc.coddest, 0) WHEN 0 THEN
                          (SELECT     a.CAP
                            FROM          dbo.GEM_TESTACONTRATTO cr INNER JOIN
                                                   anagraficaCF a ON cr.IDCONTRATTO = t .IDCONTRATTO AND cr.CODCLIENTE = a.codconto) ELSE
                          (SELECT     i.CAP
                            FROM          destinazionidiverse i
                            WHERE      i.CODCONTO = t .CODCLIENTE AND i.CODICE = sc.CODDEST) END AS SedeCAP, dm.IdRigaMezzo, dm.CodMezzo AS CodMezzoDM, 
                      dm.DataInserimento, dm.DataEliminazione, dm.ELIMINATO AS EliminatoDM, dm.POSIZIONE, dm.SUBPOSIZIONE, dm.UBICAZIONE, dm.POSCLIENTE, 
                      dm.NOTE AS NOTE_DM, dm.ORDINE, dm.CarTesto1, dm.CarTesto2, dm.CarTesto3, dm.CarTesto4, dm.CarTesto5, dm.CarTesto6, dm.CarTesto7, 
                      dm.CarTesto8, dm.CarTesto9, dm.CodiceBarre, dm.OMOLOGATO, dm.ANNO, dm.FLAG_INST, dm.STATO, dm.POSQLIK, dm.QUANTITA, dm.TEMPO_MAN, 
                      dm.IMPORTOAT1, dm.IMPORTOAT2, dm.IMPORTOAT3, dm.IMPORTOAT4, dm.IMPORTOAT5, dm.SCONTOAT1, dm.SCONTOAT2, dm.SCONTOAT3, 
                      dm.SCONTOAT4, dm.SCONTOAT5, dm.PROV1AT1, dm.PROV1AT2, dm.PROV1AT3, dm.PROV1AT4, dm.PROV1AT5, dm.PROV2AT1, dm.PROV2AT2, 
                      dm.PROV2AT3, dm.PROV2AT4, dm.PROV2AT5, dm.PROV3AT1, dm.PROV3AT2, dm.PROV3AT3, dm.PROV3AT4, dm.PROV3AT5, dm.DATA_REV, 
                      dm.DATA_PREV, dm.DATA_COLL, dm.DATA_PCOLL, dm.StatoFuoriSede, dm.StatoAttivita, dm.FLAGAT1, dm.FLAGAT2, dm.FLAGAT3, dm.FLAGAT4, 
                      dm.FLAGAT5, dm.FLAGRICARICA, dm.IDRAPPORTO, rp.STATO AS STATO_rp, rp.DA_FATT, rp.ELIMINATO AS ELIMINATO_rp, rp.TECNICO_EFF, 
                      agetr.DSCAGENTE AS DescTecnicoEff, exAgTecnEff.TipoAgente, rp.DATA_EFF, rp.TECNICO_PREV, rp.TIPOLOGIARAPPORTO, rp.TIPO_RAPPORTO, 
                      a.DSCCONTO1 AS RagSocClienteFatt, vCli.DSCCONTO1 AS RagSocCliente, vCli.CODSETTORE, vCli.CODZONA
, dm.AnnotazioniTecnica
FROM         GEM_TESTACONTRATTO AS t INNER JOIN
                      GEM_SEZIONICONTRATTO AS sc ON t.IDCONTRATTO = sc.IDCONTRATTO INNER JOIN
                      GEM_Vista_TipologMezzo AS tm ON sc.idTipologMezzo = tm.idTipologMezzo INNER JOIN
                      GEM_SEZIONECONTRATTORAPPORTI AS rp ON sc.IDCONTRATTO = rp.IDCONTRATTO AND 
                      sc.SEZIONECONTRATTO = rp.SEZIONECONTRATTO LEFT OUTER JOIN
                      ANAGRAFICACF AS a ON t.CODCLIFAT = a.CODCONTO LEFT OUTER JOIN
                      VISTACLIENTI AS vCli ON t.CODCLIENTE = vCli.CODCONTO LEFT OUTER JOIN
                      ANAGRAFICAAGENTI AS age1 ON t.CodAgente1 = age1.CODAGENTE LEFT OUTER JOIN
                      ANAGRAFICAAGENTI AS age2 ON t.CodAgente2 = age2.CODAGENTE LEFT OUTER JOIN
                      ANAGRAFICAAGENTI AS age3 ON t.CodAgente3 = age3.CODAGENTE LEFT OUTER JOIN
                      EXTRAAGENTI AS exAgTecnEff ON rp.TECNICO_EFF = exAgTecnEff.CODAGENTE LEFT OUTER JOIN
                      ANAGRAFICAAGENTI AS agetr ON rp.TECNICO_EFF = agetr.CODAGENTE LEFT OUTER JOIN
                      GEM_SEZIONECONTRATTORAPPORTIMEZZI AS dm ON rp.SEZIONECONTRATTO = dm.SEZIONECONTRATTO AND 
                      rp.IDCONTRATTO = dm.IDCONTRATTO AND rp.IDRAPPORTO = dm.IDRAPPORTO

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaDettMezziRapporto] TO [Metodo98]
    AS [dbo];

