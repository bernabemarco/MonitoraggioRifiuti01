﻿

CREATE VIEW VISTADOCUMENTIRES AS SELECT
    TD.PROGRESSIVO as IDTESTA,TD.ESERCIZIO,
    TD.TIPODOC,TD.NUMERODOC,TD.BIS,TD.DATADOC,
    TD.DOCCHIUSO,TD.BLOCCATO,TD.CODCLIFOR,
    TD.NUMRIFDOC,TD.DATARIFDOC,
    TD.CODAGENTE1,TD.CODAGENTE2,
    TD.CODAGENTE3,TD.CODBANCAINCASSO,
    TD.NUMDESTDIVERSAMERCI,TD.CODPAGAMENTO,
    TD.CODLINGUA,TD.CODCAMBIO,TD.VALCAMBIO,
    TD.SCONTOFINALE,TD.CODCFFATT,
    TD.PRCPROVVAG1,TD.PRCPROVVFINALEAG1,
    TD.PRCPROVVAG2,TD.PRCPROVVFINALEAG2,
    TD.PRCPROVVAG3,TD.PRCPROVVFINALEAG3,
    TD.ANNOTAZIONI AS ANNOTAZIONIPIEDE,
    PARAMETRIDOC.TIPO as TIPOPAR,
    RD.IDRIGA as PROGRIGADOC,RD.POSIZIONE,
    RD.TIPORIGA,RD.RIGACHIUSA,RD.RIGABLOCCATA,
    RD.CODART,RD.DESCRIZIONEART,
    RD.DATACONSEGNA,RD.DATACONSEGNARICHIESTA,RD.NUMLISTINO,RD.UMGEST,
    VISTAARTICOLIUMBASE.UM1,
    VISTAARTICOLIUMBASE.UM2,RD.UMPREZZO,
    RD.SCONTORIGA,RD.SCONTIESTESI,RD.CODIVA,
    RD.PROVVAG1,RD.PROVVAG2,RD.PROVVAG3,
    RD.NUMCOLLI,RD.GENCONTROP,RD.NRRIFPARTITA,
    RD.PESONETTO,RD.PESOLORDO,RD.PESOIMBALLO,
    RD.SUPERFICIE,RD.VOLUME,RD.RIFCOMMCLI,
    RD.NOMECOMMESSAPROD,RD.VERSIONEDIBA,
    RD.CAUSALEMAG,RD.NRPEZZIIMBALLO,
    RD.CODIMBALLO,RD.NOMENCLCOMBINATA,
    RD.CONTOCDC,RD.CONTOCDCMOVCOLL,
    RD.CODDEPOSITO,RD.CODDEPOSITOCOLL,
    RD.CODDEPCOMP,RD.CODDEPCOMPCOLL,
    RD.VARIANTI,RD.ANNOTAZIONI,
    (case when TD.CODCAMBIO=0 then RD.PREZZOUNITNETTO else RD.PREZZOUNITNETTO/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO end) as PREZZOUNITNETTO,
    (case when TD.CODCAMBIO=0 then RD.PREZZOUNITLORDO else RD.PREZZOUNITLORDO/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO end) as PREZZOUNITLORDO,
    RD.PREZZOUNITNETTO as PREZZOUNITNETTOVALUTA,
    RD.PREZZOUNITLORDO as PREZZOUNITLORDOVALUTA,
    RD.PREZZOUNITNETTOEURO,
    RD.PREZZOUNITLORDOEURO,
    RD.UBICAZIONE,
    RD.UBICAZIONECOLL,
    RD.UBICAZIONECOMP,
    RD.UBICAZIONECOMPCOLL,
    (case when TD.CODCAMBIO=0 then TD.TOTPROVVAG1RES*TD.SEGNO else TD.TOTPROVVAG1RES/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO*TD.SEGNO end) as TOTPROVVFINALEAG1,
    (case when TD.CODCAMBIO=0 then TD.TOTPROVVAG2RES*TD.SEGNO else TD.TOTPROVVAG2RES/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO*TD.SEGNO end) as TOTPROVVFINALEAG2,
    (case when TD.CODCAMBIO=0 then TD.TOTPROVVAG3RES*TD.SEGNO else TD.TOTPROVVAG3RES/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO*TD.SEGNO end) as TOTPROVVFINALEAG3,
    TD.TOTPROVVAG1RES*TD.SEGNO as TOTPROVVFINALEAG1VALUTA,
    TD.TOTPROVVAG2RES*TD.SEGNO as TOTPROVVFINALEAG2VALUTA,
    TD.TOTPROVVAG3RES*TD.SEGNO as TOTPROVVFINALEAG3VALUTA,
    TD.TOTPROVVAGEURO1RES*TD.SEGNO as TOTPROVVFINALEAG1EURO,
    TD.TOTPROVVAGEURO2RES*TD.SEGNO as TOTPROVVFINALEAG2EURO,
    TD.TOTPROVVAGEURO3RES*TD.SEGNO as TOTPROVVFINALEAG3EURO,
    (case when TD.CODCAMBIO=0 then TD.TOTDOCUMENTORES*TD.SEGNO else TD.TOTDOCUMENTORES/TD.VALCAMBIO/TC.CAMBIOEURO*TD.SEGNO*TCAM.CAMBIOEURO end) as TOTDOCUMENTO,
    (case when TD.CODCAMBIO=0 then TD.TOTIMPOSTARES*TD.SEGNO else TD.TOTIMPOSTARES/TD.VALCAMBIO/TC.CAMBIOEURO*TD.SEGNO*TCAM.CAMBIOEURO end) as TOTIMPOSTA,
    TD.TOTDOCUMENTOEURORES*TD.SEGNO as TOTDOCUMENTOEURO,
    TD.TOTIMPOSTAEURORES*TD.SEGNO as TOTIMPOSTAEURO,
    TD.TOTDOCUMENTORES*TD.SEGNO as TOTDOCVALUTA,
    TD.TOTIMPOSTARES*TD.SEGNO as TOTIMPOSTAVALUTA,
    (CASE WHEN RD.TIPORIGA='V' THEN 0 ELSE RD.QTAGEST*TD.SEGNO END) as QTAGEST,
    (CASE WHEN RD.TIPORIGA='V' THEN 0 ELSE RD.QTAGESTRES*TD.SEGNO END) as QTAGESTRES,
    (CASE WHEN RD.TIPORIGA='V' THEN 0 ELSE RD.QTA1MAG*TD.SEGNO END) as QTA1MAG,
    (CASE WHEN RD.TIPORIGA='V' THEN 0 ELSE RD.QTA1MAGRES*TD.SEGNO END) as QTA1MAGRES,
    (CASE WHEN RD.TIPORIGA='V' THEN 0 ELSE RD.QTA2MAG*TD.SEGNO END) as QTA2MAG,
    (CASE WHEN RD.TIPORIGA='V' THEN 0 ELSE RD.QTA2MAGRES*TD.SEGNO END) as QTA2MAGRES,
    (CASE WHEN RD.TIPORIGA='V' THEN 0 ELSE RD.QTAPREZZO*TD.SEGNO END) as QTAPREZZO,
    (CASE WHEN RD.TIPORIGA='V' THEN 0 ELSE RD.QTAPREZZORES*TD.SEGNO END) as QTAPREZZORES,
    (CASE WHEN RD.TIPORIGA='V' THEN 0 ELSE RD.QTAGESTPRELEVATA*TD.SEGNO END) as QTAGESTPRELEVATA,
    (case when TD.CODCAMBIO=0 then RD.TOTLORDORIGARES*TD.SEGNO else RD.TOTLORDORIGARES/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO*TD.SEGNO end) as TOTLORDORIGA,
    (case when TD.CODCAMBIO=0 then RD.TOTNETTORIGARES*TD.SEGNO else RD.TOTNETTORIGARES/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO*TD.SEGNO end) as TOTNETTORIGA,
    RD.TOTLORDORIGARES*TD.SEGNO as TOTLORDORIGAVALUTA,
    RD.TOTNETTORIGARES*TD.SEGNO as TOTNETTORIGAVALUTA,
    RD.TOTLORDORIGAEURORES*TD.SEGNO as TOTLORDORIGAEURO,
    RD.TOTNETTORIGAEURORES*TD.SEGNO as TOTNETTORIGAEURO,
    (case when TD.CODCAMBIO=0 then RD.TOTPROVVAG1RES*TD.SEGNO else RD.TOTPROVVAG1RES/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO*TD.SEGNO end) as TOTPROVVAG1,
    (case when TD.CODCAMBIO=0 then RD.TOTPROVVAG2RES*TD.SEGNO else RD.TOTPROVVAG2RES/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO*TD.SEGNO end) as TOTPROVVAG2,
    (case when TD.CODCAMBIO=0 then RD.TOTPROVVAG3RES*TD.SEGNO else RD.TOTPROVVAG3RES/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO*TD.SEGNO end) as TOTPROVVAG3,
    RD.TOTPROVVAGEURO1RES*TD.SEGNO as TOTPROVVAG1EURO,
    RD.TOTPROVVAGEURO2RES*TD.SEGNO as TOTPROVVAG2EURO,
    RD.TOTPROVVAGEURO3RES*TD.SEGNO as TOTPROVVAG3EURO,
    RD.TOTPROVVAG1RES*TD.SEGNO as TOTPROVVAG1VALUTA,
    RD.TOTPROVVAG2RES*TD.SEGNO as TOTPROVVAG2VALUTA,
    RD.TOTPROVVAG3RES*TD.SEGNO as TOTPROVVAG3VALUTA,
    ANAGRAFICACF.DSCCONTO1,
    ANAGRAFICARISERVATICF.CODCATEGORIA as CODCATEGORIACF,
    ANAGRAFICACF.CODNAZIONE,
    ANAGRAFICARISERVATICF.CODSETTORE,
    ANAGRAFICARISERVATICF.CODZONA,
    ANAGRAFICAARTICOLI.GRUPPO,
    ANAGRAFICAARTICOLI.VARESPLICITE,
    ANAGRAFICAARTICOLI.CATEGORIA,
    ANAGRAFICAARTICOLI.CODCATEGORIASTAT,
    ANAGRAFICAARTICOLI.ARTTIPOLOGIA,
    ANAGRAFICAARTICOLI.CODICEPRIMARIO,
    ANAGRAFICAARTICOLI.DESCRIZIONE as DSCART,
    VISTAARTICOLIDSCBASE.CODARTICOLOBASE,
    VISTAARTICOLIDSCBASE.DSCARTICOLOBASE,
    ARTICOLIFATTORICONVERSIONE.UM1 as FCUM1,
    ARTICOLIFATTORICONVERSIONE.UM2 as FCUM2,
    ARTICOLIFATTORICONVERSIONE.FORMULAFC,
    (CASE WHEN ARTICOLIFATTORICONVERSIONE.FATTORE IS NULL THEN 1 ELSE ARTICOLIFATTORICONVERSIONE.FATTORE END) AS FATTORE,    
    PARAMETRIDOC.TIPOCALCPROVVFINALI,
    TD.INCIDENZASCONTI,
    RD.RIFRELAZIONECF
FROM
    (((((TESTEDOCUMENTI as TD join RIGHEDOCUMENTI as RD on TD.PROGRESSIVO=RD.IDTESTA) join
    TABCAMBI AS TC ON TD.CODCAMBIO=TC.CODICE) join 
    ANAGRAFICACF on TD.CODCLIFOR=ANAGRAFICACF.CODCONTO) join
    PARAMETRIDOC on TD.TIPODOC=PARAMETRIDOC.CODICE) join
    ANAGRAFICARISERVATICF on ANAGRAFICACF.CODCONTO=ANAGRAFICARISERVATICF.CODCONTO) left outer join
    (((VISTAARTICOLIDSCBASE join ANAGRAFICAARTICOLI on VISTAARTICOLIDSCBASE.Codice=ANAGRAFICAARTICOLI.CODICE) join
    ARTICOLIFATTORICONVERSIONE on ANAGRAFICAARTICOLI.CODICE=ARTICOLIFATTORICONVERSIONE.CODART) join
    VISTAARTICOLIUMBASE on ANAGRAFICAARTICOLI.CODICE=VISTAARTICOLIUMBASE.codice)
    on ANAGRAFICAARTICOLI.CODICE=RD.CODART
    ,TABCAMBI as TCAM, TABUTENTI
WHERE
    (TCAM.CODICE=0) and USERDB = CAST(USER_NAME() AS VARCHAR(25)) and (ANAGRAFICARISERVATICF.ESERCIZIO=TD.ESERCIZIO) and((RD.UMGEST=ARTICOLIFATTORICONVERSIONE.UM1) or(RD.CODART=''))
    AND (SUPERVISOR = 1 OR 
        (SUPERVISOR = 0 AND USERID IN (SELECT NOMEUTENTE FROM ACCESSIDOCUMENTI WHERE CODDOCUMENTO = TD.TIPODOC AND FLAGVISUALIZZA=1)))
    AND ((TD.CODCLIFOR=TABUTENTI.CODCLIFOR) OR (TABUTENTI.CODCLIFOR=''))

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTADOCUMENTIRES] TO [Metodo98]
    AS [dbo];

