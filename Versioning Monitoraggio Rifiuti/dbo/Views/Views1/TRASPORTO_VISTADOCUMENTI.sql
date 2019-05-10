﻿

CREATE VIEW [dbo].[TRASPORTO_VISTADOCUMENTI]
  AS 
	SELECT DISTINCT
	TD.PROGRESSIVO,
	TD.ESERCIZIO,
	TD.TIPODOC,
	TD.NUMERODOC,
	TD.BIS,
	TD.DATADOC,
	TD.DOCCHIUSO,
	TD.SEGNO,
	TD.NUMRIFDOC,
	TD.DATARIFDOC,
	TD.CODLISTINO,
	TD.CODCAMBIO,
	TD.VALCAMBIO,
	TD.ADDSPESEDOCUM,
	TD.ADDSPESEEFFETTO,
	TD.ADDSPESETRASPORTO,
	TD.ADDSPESEIMBALLO,
	TD.CODLINGUA,
	ISNULL(TD.CODAGENTE1,'')CODAGENTE1 ,
	TD.PRCPROVVAG1,
	TD.PRCPROVVFINALEAG1,
	TD.TOTPROVVAG1,
	TD.TOTPROVVAGEURO1,
	TD.TOTPROVVAG1RES,
	TD.TOTPROVVAGEURO1RES,
	ISNULL(TD.CODAGENTE2,'') CODAGENTE2,
	TD.PRCPROVVAG2,
	TD.PRCPROVVFINALEAG2,
	TD.TOTPROVVAG2,
	TD.TOTPROVVAGEURO2,
	TD.TOTPROVVAG2RES,
	TD.TOTPROVVAGEURO2RES,
	ISNULL(TD.CODAGENTE3,'') CODAGENTE3,
	TD.PRCPROVVAG3,
	TD.PRCPROVVFINALEAG3,
	TD.TOTPROVVAG3,
	TD.TOTPROVVAGEURO3,
	TD.TOTPROVVAG3RES,
	TD.TOTPROVVAGEURO3RES,
	TD.NUMDESTDIVERSACORR,
	TD.NUMDESTDIVERSAMERCI,
	TD.RAGSOCDDM,
	TD.INDIRIZZODDM,
	TD.CAPDDM,
	TD.LOCALITADDM,
	TD.PROVINCIADDM,
	TD.SCONTOFINALE,
	TD.CODBANCAINCASSO,
	TD.CODBANCAAPPOGGIO,
	TD.CODPAGAMENTO,
	TD.CODIVASPTRASP,
	TD.DATACONSEGNA,
	TD.DATAMOVMAGAZZINO,
	TD.TRASPACURA,
	TD.CAUSALETRASP,
	TD.DATAINIZIOTRASP,
	TD.ORAINIZIOTRASP,
	TD.MODOTRASP,
	TD.ASPETTOBENI,
	TD.ASPETTOBENIINLINGUA,
	TD.PORTO,
	TD.NUMCOLLI,
	TD.ANNOTAZIONI,
	TD.NATURATRANS,
	TD.CONDCONSINTRA,
	TD.ORIGINEINTRACEE,
	TD.DESTINAZIONE,
	TD.VALSTATCEE,
	TD.VALSTATCEEEURO,
	TD.NUMLETTERACREDITO,
	TD.DATALETTERACREDITO,
	TD.DATADEC,
	TD.BLOCCATO,
	TD.FLAGCONT,
	TD.RIVIVAOMAGGI,
	TD.MESELIQUIDAZ,
	TD.ANNOLIQUIDAZ,
	TD.IMPORTIPRELEVATI,
	TD.MESEPLAFOND,
	TD.ANNOPLAFOND,
	TD.flgImpExp,
	TD.Legame,
	TD.SPESERIPMAG,
	TD.SPESERIPMAGEURO,
	TD.DOCREPLICATO,
	TD.Stagione,
	TD.AnnoStagione,
	TD.PROGRESSIVOCTR,
	TD.RifTransferOrder,
	TD.RIFDOCPERIFERIA,
	TD.ESISTEPROMOTOTALE,
	TD.VALORESCONTOPROMOTOTALE,
	TD.NOTEMAG,
	TD.NOTECOMM,
	TD.NOTEALTRO,
	TD.RIFTESTAPL,
	TD.NUMCOLLIPL,
	TD.TIPOORDINE,
	TD.RifBollaDoganale,
	TD.NumColliDoganale,
	TD.PesoSpedDoganale,
	TD.SpuntaDocCarico,
	TD.COMMITTENTELOGISTICA,
	TD.FLGBLACKLIST,
	TD.CODICECIG,
	TD.CODICECUP,
	RD.IDTESTA,
	RD.IDRIGA,
	RD.POSIZIONE,
	RD.TIPORIGA,
	RD.CODART,
	RD.IDARTBASE,
	RD.CODARTBASE,
	RD.VARIANTI,
	AA.DESCRIZIONE AS DESCRIZIONEART,
	RD.NUMLISTINO,
	RD.UMGEST,
	RD.UMPREZZO,
	RD.NRRIFPARTITA,
	RD.CODIVA,
	RD.RIGACHIUSA,
	RD.SCONTIESTESI,
	RD.PREZZOUNITLORDOEURO,
	RD.PREZZOUNITNETTOEURO,
	RD.QTAGEST,
	RD.PROVVAG1,
	RD.PROVVAG2,
	RD.PROVVAG3,
	RD.GENCONTROP,
	RD.VERSIONEDIBA,
	RD.NRPEZZIIMBALLO,
	RD.CODIMBALLO,
	RD.NOMENCLCOMBINATA,
	RD.CONTOCDC,
	RD.CONTOCDCMOVCOLL,
	RD.ANNOINIZIOCOMP,
	RD.ANNOFINECOMP,
	RD.MESEINIZIOCOMP,
	RD.MESEFINECOMP,
	RD.RIGAPRELEVABILE,
	RD.RIFGPSCONTO,
	RD.RIFGPPREZZO,
	RD.CAUSALEMAG,
	RD.CODDEPOSITO,
	RD.CAUSALEMAGCOLL,
	RD.CODDEPOSITOCOLL,
	RD.CAUSALEMAGCOMP,
	RD.CODDEPCOMP,
	RD.CAUSALEMAGCOMPCOLL,
	RD.CODDEPCOMPCOLL,
	RD.RIFCOMMCLI,
	RD.NOMECOMMESSAPROD,
	RD.PROVENIENZAINTRA,
	RD.IDTESTARP,
	RD.IDRIGARP,
	RD.RIGABLOCCATA,
	RD.FLAGS,
	RD.UBICAZIONE,
	RD.UBICAZIONECOLL,
	RD.UBICAZIONECOMP,
	RD.UBICAZIONECOMPCOLL,
	RD.IDCONSEGNA,
	RD.RifRelazioneCF,
	RD.FLAGNETTIFICAMPS,
	RD.ORIGINEINTRA,
	RD.RiportaDescPL,
	RD.NomeStampaConf,
	RD.ANNOBOLLACLF,
	RD.NUMEROBOLLACLF,
	RD.OPERAZIONECLF,
	RD.IMPTOTPROVVRIGA,
	RD.IMPTOTPROVVRIGARES,
	RD.TOTLORDOPREL,
	RD.IDCDC,
	RD.QTAPLRES,
	RD.DATABASEIE,
	RD.IDTESTAIE,
	RD.IDRIGAIE,
	RD.STATOOPERAZIONECLF,
	RD.CAUSALEVERSAMENTOCLF,
	RD.CAUSALETRASFERIMENTOCLF,
	RD.COMPONENTEKIT,
	RD.DAPIANIFICARE,
	RD.RIFCONTRATTO,
	(CASE WHEN DATADEC = DATADOC THEN NULL ELSE DATADEC END) AS DECORRENZA,
	(CASE WHEN (PD.DOCTRASPORTO <> 0 AND PD.CLIFOR = 'C') THEN (CASE WHEN ANNOLIQUIDAZ = 0 THEN YEAR(TD.DATADOC) ELSE ANNOLIQUIDAZ END) ELSE NULL END) AS FLAGANNOLIQUIDAZ,
	(CASE WHEN (PD.DOCTRASPORTO <> 0 AND PD.CLIFOR = 'C') THEN (CASE WHEN MESELIQUIDAZ = 0 THEN MONTH(TD.DATADOC) ELSE MESELIQUIDAZ END) ELSE NULL END) AS FLAGMESELIQUIDAZ,
	(CASE WHEN (PD.DOCTRASPORTO <> 0 AND PD.CLIFOR = 'F') THEN (CASE WHEN ANNOPLAFOND = 0 THEN YEAR(TD.DATADOC) ELSE ANNOPLAFOND END) ELSE NULL END) AS FLAGANNOPLAFOND,
	(CASE WHEN (PD.DOCTRASPORTO <> 0 AND PD.CLIFOR = 'F') THEN (CASE WHEN MESEPLAFOND = 0 THEN MONTH(TD.DATADOC) ELSE MESEPLAFOND END) ELSE NULL END) AS FLAGMESEPLAFOND,
	PD.VersaCompetenze AS VERSACOMPETENZE,
	AA.GRUPPO,
	TG.DESCRIZIONE AS DSCGRUPPO,
	AA.CATEGORIA,
	TC.DESCRIZIONE AS DSCCATEGORIA,
	AA.CODCATEGORIASTAT,
	TCS.DESCRIZIONE AS DSCCATEGORIASTAT,
	TEM.CodFamigliaPOS,
	TEM.CodRepartoPOS,
	/*Cliente Documento*/
	TD.CODCLIFOR,
	ACF.DSCCONTO1,
	ARCF.CODSETTORE,
	TS.DESCRIZIONE AS DSCSETTORE,
	ARCF.CODZONA,
	TZ.DESCRIZIONE AS DSCZONA,
	ARCF.CODCATEGORIA,
	CCF.DSCCATEGORIA AS DSCCATEGORIACF,
	ARCF.CODGRUPPOPREZZIPART,
	TRPCF.DESCRIZIONE AS DSCGRUPPOPREZZIPART,
	ACF.ZonaSped,
	TZS.DESCRIZIONE AS DSCZONASPED,
	/*Cliente Fatturazione Documento*/
	TD.CODCFFATT,
	ACFF.DSCCONTO1 AS DSCCLIFATT,
	ARCFF.CODSETTORE AS CODSETTOREF,
	TSF.DESCRIZIONE AS DSCSETTOREF,
	ARCFF.CODZONA AS CODZONAF,
	TZF.DESCRIZIONE AS DSCZONAF,
	ARCFF.CODCATEGORIA AS CODCATEGORIAF,
	CCFF.DSCCATEGORIA AS DSCCATEGORIACFF,
	ARCFF.CODGRUPPOPREZZIPART AS CODGRUPPOPREZZIPARTF,
	TRPCFF.DESCRIZIONE AS DSCGRUPPOPREZZIPARTF,
	ISNULL(ACFF.ZonaSped,'') AS ZONASPEDF,
	TZSF.DESCRIZIONE AS DSCZONASPEDF,
	/*Cliente Origine*/
	FUNDOC.CLIORIG,
	CLIENTE_O.DSCCONTO1 AS DSCCLIORIG,
	RCLIENTE_O.CODSETTORE AS CODSETTORECORIG,
	TSCORIG.DESCRIZIONE AS DSCSETTORECORIG,
	RCLIENTE_O.CODZONA AS CODZONACORIG,
	TZCORIG.DESCRIZIONE AS DSCZONACORIG,
	RCLIENTE_O.CODCATEGORIA AS CODCATEGORIACORIG,
	CCFCORIG.DSCCATEGORIA AS DSCCATEGORIACFCORIG,
	RCLIENTE_O.CODGRUPPOPREZZIPART AS CODGRUPPOPREZZIPARTCORIG,
	TRPCFCORIG.DESCRIZIONE AS DSCGRUPPOPREZZIPARTCORIG,
	ISNULL(CLIENTE_O.ZonaSped,'') AS ZONASPEDCORIG,
	TZSCORIG.DESCRIZIONE AS DSCZONASPEDCORIG,
	FUNDOC.ISCONTRATTO
FROM         
	dbo.TESTEDOCUMENTI AS TD INNER JOIN
	dbo.RIGHEDOCUMENTI AS RD ON RD.IDTESTA = TD.PROGRESSIVO INNER JOIN
	dbo.PARAMETRIDOC AS PD ON TD.TIPODOC = PD.CODICE INNER JOIN
	dbo.ANAGRAFICAARTICOLI AS AA ON AA.CODICE = RD.CODART INNER JOIN
	dbo.TABUTENTI ON dbo.TABUTENTI.USERDB = CAST(USER_NAME() AS VARCHAR(25)) INNER JOIN
	dbo.MB_DocumentiValidiAll() AS FUNDOC ON FUNDOC.IDTESTA = TD.PROGRESSIVO AND FUNDOC.IDRIGA = RD.IDRIGA LEFT OUTER JOIN
	dbo.EXTRAMAG AS EM ON EM.CODART = RD.CODART LEFT OUTER JOIN
	dbo.EXTRAFORNITORI AS EF ON EF.CODCONTO = TD.CODCLIFOR LEFT OUTER JOIN
	dbo.EXTRACLIENTI AS EC ON EC.CODCONTO = TD.CODCLIFOR LEFT OUTER JOIN
	dbo.TP_ExtraMag AS TEM ON TEM.CodArt = RD.CODART LEFT OUTER JOIN
	dbo.TABGRUPPI AS TG ON TG.CODICE = AA.GRUPPO LEFT OUTER JOIN
	dbo.TABCATEGORIE AS TC ON TC.CODICE = AA.CATEGORIA LEFT OUTER JOIN
	dbo.TABCATEGORIESTAT AS TCS ON TCS.CODICE = AA.CODCATEGORIASTAT INNER JOIN
	/*Cliente Documento*/
	dbo.ANAGRAFICACF AS ACF ON ACF.CODCONTO = TD.CODCLIFOR INNER JOIN
	dbo.ANAGRAFICARISERVATICF AS ARCF ON ARCF.CODCONTO = TD.CODCLIFOR AND ARCF.ESERCIZIO = dbo.TABUTENTI.ESERCIZIOATTIVO LEFT OUTER JOIN
	dbo.TABZONE AS TZ ON TZ.CODICE = ARCF.CODZONA LEFT OUTER JOIN
	dbo.TABSETTORI AS TS ON TS.CODICE = ARCF.CODSETTORE LEFT OUTER JOIN
	dbo.CATEGORIECF AS CCF ON CCF.CODCATEGORIA = ARCF.CODCATEGORIA LEFT OUTER JOIN
	dbo.TabZoneSped AS TZS ON TZS.CODICE = ACF.ZonaSped LEFT OUTER JOIN
	dbo.TABRAGGRPREZZICF AS TRPCF ON TRPCF.CODICE = ARCF.CODGRUPPOPREZZIPART LEFT OUTER JOIN
	/*Cliente Fatturazione Documento*/
	dbo.ANAGRAFICACF AS ACFF ON ACFF.CODCONTO = TD.CODCFFATT LEFT OUTER JOIN
	dbo.ANAGRAFICARISERVATICF AS ARCFF ON ARCFF.CODCONTO = ACFF.CODCONTO AND 
	ARCFF.ESERCIZIO = dbo.TABUTENTI.ESERCIZIOATTIVO LEFT OUTER JOIN
	dbo.TABZONE AS TZF ON TZF.CODICE = ARCFF.CODZONA LEFT OUTER JOIN
	dbo.TABSETTORI AS TSF ON TSF.CODICE = ARCFF.CODSETTORE LEFT OUTER JOIN
	dbo.CATEGORIECF AS CCFF ON CCFF.CODCATEGORIA = ARCFF.CODCATEGORIA LEFT OUTER JOIN
	dbo.TabZoneSped AS TZSF ON TZSF.CODICE = ACFF.ZonaSped LEFT OUTER JOIN
	dbo.TABRAGGRPREZZICF AS TRPCFF ON TRPCFF.CODICE = ARCFF.CODGRUPPOPREZZIPART LEFT OUTER JOIN
	/*Cliente Origine*/
	dbo.ANAGRAFICACF AS CLIENTE_O ON CLIENTE_O.CODCONTO = FUNDOC.CLIORIG LEFT OUTER JOIN
	dbo.ANAGRAFICARISERVATICF AS RCLIENTE_O ON RCLIENTE_O.CODCONTO = CLIENTE_O.CODCONTO AND RCLIENTE_O.ESERCIZIO = dbo.TABUTENTI.ESERCIZIOATTIVO LEFT OUTER JOIN
	dbo.TABZONE AS TZCORIG ON TZCORIG.CODICE = RCLIENTE_O.CODZONA LEFT OUTER JOIN
	dbo.TABSETTORI AS TSCORIG ON TSCORIG.CODICE = RCLIENTE_O.CODSETTORE LEFT OUTER JOIN
	dbo.CATEGORIECF AS CCFCORIG ON CCFCORIG.CODCATEGORIA = RCLIENTE_O.CODCATEGORIA LEFT OUTER JOIN
	dbo.TabZoneSped AS TZSCORIG ON TZSCORIG.CODICE = CLIENTE_O.ZonaSped LEFT OUTER JOIN
	dbo.TABRAGGRPREZZICF AS TRPCFCORIG ON TRPCFCORIG.CODICE = RCLIENTE_O.CODGRUPPOPREZZIPART LEFT OUTER JOIN
	dbo.ANAGRAFICACF AS ACFCFORIG ON ACFCFORIG.CODCONTO = FUNDOC.CLIFATTORIG


GO
GRANT SELECT
    ON OBJECT::[dbo].[TRASPORTO_VISTADOCUMENTI] TO [Metodo98]
    AS [dbo];

