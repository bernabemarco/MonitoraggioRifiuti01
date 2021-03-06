﻿

CREATE VIEW [dbo].ALD_VISTADOCUMENTIBASE AS
    SELECT TD.PROGRESSIVO AS IDTESTA, TD.ESERCIZIO,
    TD.TIPODOC, TD.NUMERODOC, TD.BIS, TD.DATADOC,
    TD.DOCCHIUSO, TD.BLOCCATO, TD.CODCLIFOR,
    TD.NUMRIFDOC, TD.DATARIFDOC,
    TD.CODAGENTE1, TD.CODAGENTE2,
    TD.CODAGENTE3, TD.CODBANCAINCASSO,
    TD.NUMDESTDIVERSAMERCI, TD.CODPAGAMENTO,
    TD.CODLINGUA, TD.CODCAMBIO, TD.VALCAMBIO,
    TD.SCONTOFINALE, TD.CODCFFATT,
    TD.PRCPROVVAG1, TD.PRCPROVVFINALEAG1,
    TD.PRCPROVVAG2, TD.PRCPROVVFINALEAG2,
    TD.PRCPROVVAG3, TD.PRCPROVVFINALEAG3, TD.FLAGCONT,
    TD.ANNOTAZIONI AS ANNOTAZIONIPIEDE,
    TD.FLGBLACKLIST,
    PARAMETRIDOC.TIPO AS TIPOPAR,
    RD.IDRIGA AS PROGRIGADOC, RD.POSIZIONE,
    RD.TIPORIGA, RD.RIGACHIUSA, RD.RIGABLOCCATA,
    RD.CODART, RD.DESCRIZIONEART,
    RD.DATACONSEGNA,RD.DATACONSEGNARICHIESTA, RD.NUMLISTINO, RD.UMGEST,
    VISTAARTICOLIUMBASE.UM1,
    VISTAARTICOLIUMBASE.UM2, RD.UMPREZZO,
    RD.SCONTORIGA, RD.SCONTIESTESI, RD.CODIVA,
    RD.PROVVAG1, RD.PROVVAG2, RD.PROVVAG3,
    RD.NUMCOLLI, 
	RD.GENCONTROP, 
	--da vista standard VistaDocumenti Metodo introdotta colonna per descrizione generico, dt 16.09.2015 --
	(SELECT DSCCONTO1 FROM ANAGRAFICAGENERICI AG where AG.CODCONTO=rd.GENCONTROP) as DscGENCONTROP, 
	--fine vista standard VistaDocumenti Metodo introdotta colonna per descrizione generico, dt 16.09.2015 --
	RD.NRRIFPARTITA,
    RD.PESONETTO, RD.PESOLORDO, RD.PESOIMBALLO,
    RD.SUPERFICIE, RD.VOLUME,RD.RIFCOMMCLI,
    RD.NOMECOMMESSAPROD, RD.VERSIONEDIBA,
    RD.CAUSALEMAG, RD.NRPEZZIIMBALLO,
    RD.CODIMBALLO, RD.NOMENCLCOMBINATA,
    RD.CONTOCDC, 
	--da vista standard VistaDocumenti Metodo introdotta colonna per descrizione CDC, dt 16.09.2015 --
	(SELECT DESCRIZIONE FROM TABCENTRICOSTO TCC where TCC.CODICE=RD.CONTOCDC) as DscCONTOCDC, 
	--fine vista standard VistaDocumenti Metodo introdotta colonna per descrizione CDC, dt 16.09.2015 --
	RD.CONTOCDCMOVCOLL,
    RD.CODDEPOSITO, RD.CODDEPOSITOCOLL,
    RD.CODDEPCOMP, RD.CODDEPCOMPCOLL,
    RD.VARIANTI, RD.ANNOTAZIONI,
    (CASE WHEN TD.CODCAMBIO=0 THEN RD.PREZZOUNITNETTO ELSE RD.PREZZOUNITNETTO/TD.VALCAMBIO/TC.CAMBIOEURO * TCAM.CAMBIOEURO END ) AS PREZZOUNITNETTO,
    (CASE WHEN TD.CODCAMBIO=0 THEN RD.PREZZOUNITLORDO ELSE RD.PREZZOUNITLORDO/TD.VALCAMBIO/TC.CAMBIOEURO * TCAM.CAMBIOEURO END ) AS PREZZOUNITLORDO,
    RD.PREZZOUNITNETTO AS PREZZOUNITNETTOVALUTA,
     RD.PREZZOUNITLORDO AS PREZZOUNITLORDOVALUTA,
     RD.PREZZOUNITNETTOEURO,
    RD.PREZZOUNITLORDOEURO,
    RD.UBICAZIONE,
    RD.UBICAZIONECOLL,
    RD.UBICAZIONECOMP,
    RD.UBICAZIONECOMPCOLL,
    (case when TD.CODCAMBIO=0 then TD.TOTPROVVAG1*TD.SEGNO else TD.TOTPROVVAG1/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO*TD.SEGNO end) as TOTPROVVFINALEAG1,
    (case when TD.CODCAMBIO=0 then TD.TOTPROVVAG2*TD.SEGNO else TD.TOTPROVVAG2/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO*TD.SEGNO end) as TOTPROVVFINALEAG2,
    (case when TD.CODCAMBIO=0 then TD.TOTPROVVAG3*TD.SEGNO else TD.TOTPROVVAG3/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO*TD.SEGNO end) as TOTPROVVFINALEAG3,
    TD.TOTPROVVAG1*TD.SEGNO as TOTPROVVFINALEAG1VALUTA,
    TD.TOTPROVVAG2*TD.SEGNO as TOTPROVVFINALEAG2VALUTA,
    TD.TOTPROVVAG3*TD.SEGNO as TOTPROVVFINALEAG3VALUTA,
    TD.TOTPROVVAGEURO1*TD.SEGNO as TOTPROVVFINALEAG1EURO,
    TD.TOTPROVVAGEURO2*TD.SEGNO as TOTPROVVFINALEAG2EURO,
    TD.TOTPROVVAGEURO3*TD.SEGNO as TOTPROVVFINALEAG3EURO,
     (CASE WHEN TD.CODCAMBIO=0 THEN TD.TOTDOCUMENTO * TD.SEGNO ELSE TD.TOTDOCUMENTO/TD.VALCAMBIO/TC.CAMBIOEURO * TD.SEGNO * TCAM.CAMBIOEURO END) AS TOTDOCUMENTO,
     (CASE WHEN TD.CODCAMBIO=0 THEN TD.TOTIMPOSTA * TD.SEGNO ELSE TD.TOTIMPOSTA/TD.VALCAMBIO/TC.CAMBIOEURO * TD.SEGNO * TCAM.CAMBIOEURO END) AS TOTIMPOSTA,
    TD.TOTDOCUMENTOEURO * TD.SEGNO AS TOTDOCUMENTOEURO,
     TD.TOTIMPOSTAEURO * TD.SEGNO AS TOTIMPOSTAEURO,
     TD.TOTDOCUMENTO * TD.SEGNO AS TOTDOCVALUTA,
    TD.TOTIMPOSTA * TD.SEGNO AS TOTIMPOSTAVALUTA,
    (CASE WHEN RD.TIPORIGA='V' THEN 0 ELSE RD.QTAGEST*TD.SEGNO END) as QTAGEST,
    (CASE WHEN RD.TIPORIGA='V' THEN 0 ELSE RD.QTAGESTRES*TD.SEGNO END) as QTAGESTRES,
    (CASE WHEN RD.TIPORIGA='V' THEN 0 ELSE RD.QTA1MAG*TD.SEGNO END) as QTA1MAG,
    (CASE WHEN RD.TIPORIGA='V' THEN 0 ELSE RD.QTA1MAGRES*TD.SEGNO END) as QTA1MAGRES,
    (CASE WHEN RD.TIPORIGA='V' THEN 0 ELSE RD.QTA2MAG*TD.SEGNO END) as QTA2MAG,
    (CASE WHEN RD.TIPORIGA='V' THEN 0 ELSE RD.QTA2MAGRES*TD.SEGNO END) as QTA2MAGRES,
    (CASE WHEN RD.TIPORIGA='V' THEN 0 ELSE RD.QTAPREZZO*TD.SEGNO END) as QTAPREZZO,
    (CASE WHEN RD.TIPORIGA='V' THEN 0 ELSE RD.QTAPREZZORES*TD.SEGNO END) as QTAPREZZORES,
    (CASE WHEN RD.TIPORIGA='V' THEN 0 ELSE RD.QTAGESTPRELEVATA*TD.SEGNO END) as QTAGESTPRELEVATA,
    (CASE WHEN TD.CODCAMBIO=0 THEN RD.TOTLORDORIGA * TD.SEGNO ELSE RD.TOTLORDORIGA/TD.VALCAMBIO/TC.CAMBIOEURO * TCAM.CAMBIOEURO * TD.SEGNO END) AS TOTLORDORIGA,
    (CASE WHEN TD.CODCAMBIO=0 THEN RD.TOTNETTORIGA * TD.SEGNO ELSE RD.TOTNETTORIGA/TD.VALCAMBIO/TC.CAMBIOEURO * TCAM.CAMBIOEURO * TD.SEGNO END) AS TOTNETTORIGA,
    PARAMETRIDOC.TIPOCALCPROVVFINALI,
    RD.TOTLORDORIGA * TD.SEGNO AS TOTLORDORIGAVALUTA,
     RD.TOTNETTORIGA * TD.SEGNO AS TOTNETTORIGAVALUTA,
     RD.TOTLORDORIGAEURO * TD.SEGNO AS TOTLORDORIGAEURO,
     RD.TOTNETTORIGAEURO * TD.SEGNO AS TOTNETTORIGAEURO,
    (CASE WHEN TD.CODCAMBIO=0 THEN RD.TOTPROVVAG1 * TD.SEGNO ELSE RD.TOTPROVVAG1/TD.VALCAMBIO/TC.CAMBIOEURO * TCAM.CAMBIOEURO * TD.SEGNO END) AS TOTPROVVAG1,
    (CASE WHEN TD.CODCAMBIO=0 THEN RD.TOTPROVVAG2 * TD.SEGNO ELSE RD.TOTPROVVAG2/TD.VALCAMBIO/TC.CAMBIOEURO * TCAM.CAMBIOEURO * TD.SEGNO END) AS TOTPROVVAG2,
    (CASE WHEN TD.CODCAMBIO=0 THEN RD.TOTPROVVAG3 * TD.SEGNO ELSE RD.TOTPROVVAG3/TD.VALCAMBIO/TC.CAMBIOEURO * TCAM.CAMBIOEURO * TD.SEGNO END) AS TOTPROVVAG3,
    RD.TOTPROVVAGEURO1 * TD.SEGNO AS TOTPROVVAG1EURO,
     RD.TOTPROVVAGEURO2 * TD.SEGNO AS TOTPROVVAG2EURO,
     RD.TOTPROVVAGEURO3 * TD.SEGNO AS TOTPROVVAG3EURO,
     RD.TOTPROVVAG1 * TD.SEGNO AS TOTPROVVAG1VALUTA,
     RD.TOTPROVVAG2 * TD.SEGNO AS TOTPROVVAG2VALUTA,
     RD.TOTPROVVAG3 * TD.SEGNO AS TOTPROVVAG3VALUTA,
     ANAGRAFICACF.DSCCONTO1,
    ANAGRAFICARISERVATICF.CODCATEGORIA AS CODCATEGORIACF,
    ANAGRAFICACF.CODNAZIONE ,
    ANAGRAFICARISERVATICF.CODSETTORE,
    ANAGRAFICARISERVATICF.CODZONA,
    ANAGRAFICAARTICOLI.GRUPPO,
    ANAGRAFICAARTICOLI.VARESPLICITE,
    ANAGRAFICAARTICOLI.CATEGORIA,
    ANAGRAFICAARTICOLI.CODCATEGORIASTAT,
    ANAGRAFICAARTICOLI.ARTTIPOLOGIA,
    ANAGRAFICAARTICOLI.CODICEPRIMARIO,
    ANAGRAFICAARTICOLI.DESCRIZIONE AS DSCART,
	 ANAGRAFICAARTICOLI.AGGIORNAMAG,
    VISTAARTICOLIDSCBASE.CODARTICOLOBASE,
    VISTAARTICOLIDSCBASE.DSCARTICOLOBASE,
    TD.INCIDENZASCONTI,
    RD.RIFRELAZIONECF,
    (CASE WHEN TD.CODCAMBIO=0 THEN RD.TOTNETTORIGARES * TD.SEGNO ELSE RD.TOTNETTORIGARES/TD.VALCAMBIO/TC.CAMBIOEURO * TCAM.CAMBIOEURO * TD.SEGNO END) AS TOTNETTORIGARES,
    RD.TOTNETTORIGAEURORES * TD.SEGNO AS TOTNETTORIGAEURORES,
    RD.IDTESTARP,
    RD.IDRIGARP,
    RD.ANNOBOLLACLF,
    RD.NUMEROBOLLACLF,
    RD.OPERAZIONECLF,
    RD.STATOOPERAZIONECLF,
    RD.CAUSALEVERSAMENTOCLF,
    RD.CAUSALETRASFERIMENTOCLF,
    (case when TD.CODCAMBIO=0 then RD.IMPTOTPROVVRIGA*TD.SEGNO else RD.IMPTOTPROVVRIGA/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO*TD.SEGNO end) as IMPTOTPROVVRIGALIT,
    RD.IMPTOTPROVVRIGA*TD.SEGNO AS IMPTOTPROVVRIGAVALUTA,
    (case when TD.VALCAMBIO=0 then RD.IMPTOTPROVVRIGA*TD.SEGNO else RD.IMPTOTPROVVRIGA/TD.VALCAMBIO*TD.SEGNO end) AS IMPTOTPROVVRIGAEURO
	,RD.IDTESTA AS RIFTESTADOCUMENTO
    ,RD.IDRIGA AS RIFRIGADOCUMENTO
FROM
    (((((TESTEDOCUMENTI TD INNER JOIN  RIGHEDOCUMENTI RD ON TD.PROGRESSIVO = RD.IDTESTA)
    INNER JOIN TABCAMBI AS TC ON TD.CODCAMBIO=TC.CODICE)
    INNER JOIN ANAGRAFICACF ON TD.CODCLIFOR = ANAGRAFICACF.CODCONTO)
    INNER JOIN PARAMETRIDOC ON TD.TIPODOC = PARAMETRIDOC.CODICE)
    INNER JOIN ANAGRAFICARISERVATICF ON ANAGRAFICACF.CODCONTO = ANAGRAFICARISERVATICF.CODCONTO)
    LEFT OUTER JOIN
    ((VISTAARTICOLIDSCBASE INNER JOIN ANAGRAFICAARTICOLI ON VISTAARTICOLIDSCBASE.Codice = ANAGRAFICAARTICOLI.CODICE)
    INNER JOIN VISTAARTICOLIUMBASE ON ANAGRAFICAARTICOLI.CODICE = VISTAARTICOLIUMBASE.codice)
    ON ANAGRAFICAARTICOLI.CODICE = RD.CODART,TABCAMBI TCAM, TABUTENTI
WHERE (TCAM.CODICE = 0)  and USERDB = CAST(USER_NAME() AS VARCHAR(25)) AND
    (ANAGRAFICARISERVATICF.ESERCIZIO = TD.ESERCIZIO)
    and (SUPERVISOR = 1 OR 
    	(SUPERVISOR = 0 AND USERID IN (SELECT NOMEUTENTE FROM ACCESSIDOCUMENTI WHERE CODDOCUMENTO = TD.TIPODOC AND FLAGVISUALIZZA=1)))
    AND ((TD.CODCLIFOR=TABUTENTI.CODCLIFOR) OR (TABUTENTI.CODCLIFOR=''))




GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_VISTADOCUMENTIBASE] TO [Metodo98]
    AS [dbo];

