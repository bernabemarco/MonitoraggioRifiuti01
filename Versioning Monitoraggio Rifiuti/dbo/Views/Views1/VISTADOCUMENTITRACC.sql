﻿CREATE VIEW VISTADOCUMENTITRACC AS SELECT
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
    RD.DATACONSEGNA,RD.NUMLISTINO,RD.UMGEST,
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
    (case when TD.CODCAMBIO=0 then TD.TOTPROVVAG1*TD.SEGNO else TD.TOTPROVVAG1/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO*TD.SEGNO end) as TOTPROVVFINALEAG1,
    (case when TD.CODCAMBIO=0 then TD.TOTPROVVAG2*TD.SEGNO else TD.TOTPROVVAG2/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO*TD.SEGNO end) as TOTPROVVFINALEAG2,
    (case when TD.CODCAMBIO=0 then TD.TOTPROVVAG3*TD.SEGNO else TD.TOTPROVVAG3/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO*TD.SEGNO end) as TOTPROVVFINALEAG3,
    TD.TOTPROVVAG1*TD.SEGNO as TOTPROVVFINALEAG1VALUTA,
    TD.TOTPROVVAG2*TD.SEGNO as TOTPROVVFINALEAG2VALUTA,
    TD.TOTPROVVAG3*TD.SEGNO as TOTPROVVFINALEAG3VALUTA,
    TD.TOTPROVVAGEURO1*TD.SEGNO as TOTPROVVFINALEAG1EURO,
    TD.TOTPROVVAGEURO2*TD.SEGNO as TOTPROVVFINALEAG2EURO,
    TD.TOTPROVVAGEURO3*TD.SEGNO as TOTPROVVFINALEAG3EURO,
    (case when TD.CODCAMBIO=0 then TD.TOTDOCUMENTO*TD.SEGNO else TD.TOTDOCUMENTO/TD.VALCAMBIO/TC.CAMBIOEURO*TD.SEGNO*TCAM.CAMBIOEURO end) as TOTDOCUMENTO,
    (case when TD.CODCAMBIO=0 then TD.TOTIMPOSTA*TD.SEGNO else TD.TOTIMPOSTA/TD.VALCAMBIO/TC.CAMBIOEURO*TD.SEGNO*TCAM.CAMBIOEURO end) as TOTIMPOSTA,
    TD.TOTDOCUMENTOEURO*TD.SEGNO as TOTDOCUMENTOEURO,
    TD.TOTIMPOSTAEURO*TD.SEGNO as TOTIMPOSTAEURO,
    TD.TOTDOCUMENTO*TD.SEGNO as TOTDOCVALUTA,
    TD.TOTIMPOSTA*TD.SEGNO as TOTIMPOSTAVALUTA,
    (case when TD.CODCAMBIO=0 then TD.TOTIMPONIBILE*TD.SEGNO else TD.TOTIMPONIBILE/TD.VALCAMBIO/TC.CAMBIOEURO*TD.SEGNO*TCAM.CAMBIOEURO end) as TOTIMPONIBILE,
    TD.TOTIMPONIBILE*TD.SEGNO AS TOTIMPONIBILEVALUTA,
    TD.TOTIMPONIBILEEURO*TD.SEGNO AS TOTIMPONIBILEEURO,
    RD.QTAGEST*TD.SEGNO as QTAGEST,
    RD.QTAGESTRES*TD.SEGNO as QTAGESTRES,
    RD.QTA1MAG*TD.SEGNO as QTA1MAG,
    RD.QTA1MAGRES*TD.SEGNO as QTA1MAGRES,
    RD.QTA2MAG*TD.SEGNO as QTA2MAG,
    RD.QTA2MAGRES*TD.SEGNO as QTA2MAGRES,
    RD.QTAPREZZO*TD.SEGNO as QTAPREZZO,
    RD.QTAPREZZORES*TD.SEGNO as QTAPREZZORES,
    RD.QTAGESTPRELEVATA*TD.SEGNO as QTAGESTPRELEVATA,
    (case when TD.CODCAMBIO=0 then RD.TOTLORDORIGA*TD.SEGNO else RD.TOTLORDORIGA/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO*TD.SEGNO end) as TOTLORDORIGA,
    (case when TD.CODCAMBIO=0 then RD.TOTNETTORIGA*TD.SEGNO else RD.TOTNETTORIGA/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO*TD.SEGNO end) as TOTNETTORIGA,
    RD.TOTLORDORIGA*TD.SEGNO as TOTLORDORIGAVALUTA,
    RD.TOTNETTORIGA*TD.SEGNO as TOTNETTORIGAVALUTA,
    RD.TOTLORDORIGAEURO*TD.SEGNO as TOTLORDORIGAEURO,
    RD.TOTNETTORIGAEURO*TD.SEGNO as TOTNETTORIGAEURO,
    (case when TD.CODCAMBIO=0 then RD.TOTPROVVAG1*TD.SEGNO else RD.TOTPROVVAG1/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO*TD.SEGNO end) as TOTPROVVAG1,
    (case when TD.CODCAMBIO=0 then RD.TOTPROVVAG2*TD.SEGNO else RD.TOTPROVVAG2/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO*TD.SEGNO end) as TOTPROVVAG2,
    (case when TD.CODCAMBIO=0 then RD.TOTPROVVAG3*TD.SEGNO else RD.TOTPROVVAG3/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO*TD.SEGNO end) as TOTPROVVAG3,
    RD.TOTPROVVAGEURO1*TD.SEGNO as TOTPROVVAG1EURO,
    RD.TOTPROVVAGEURO2*TD.SEGNO as TOTPROVVAG2EURO,
    RD.TOTPROVVAGEURO3*TD.SEGNO as TOTPROVVAG3EURO,
    RD.TOTPROVVAG1*TD.SEGNO as TOTPROVVAG1VALUTA,
    RD.TOTPROVVAG2*TD.SEGNO as TOTPROVVAG2VALUTA,
    RD.TOTPROVVAG3*TD.SEGNO as TOTPROVVAG3VALUTA,
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
    ANAGRAFICARISERVATICF.NOTE1,
    PARAMETRIDOC.TIPOCALCPROVVFINALI,
    TD.INCIDENZASCONTI,
    PARAMETRIDOC.CLIFOR as CLIFORPAR,
    RD.RIFRELAZIONECF
FROM
	(((((TESTEDOCUMENTI as TD join RIGHEDOCUMENTI as RD on TD.PROGRESSIVO=RD.IDTESTA) join
    ANAGRAFICACF on TD.CODCLIFOR=ANAGRAFICACF.CODCONTO) join
    TABCAMBI AS TC ON TD.CODCAMBIO=TC.CODICE) join 
    PARAMETRIDOC on TD.TIPODOC=PARAMETRIDOC.CODICE) join
    ANAGRAFICARISERVATICF on ANAGRAFICACF.CODCONTO=ANAGRAFICARISERVATICF.CODCONTO) left outer join
    (((VISTAARTICOLIDSCBASE join ANAGRAFICAARTICOLI on VISTAARTICOLIDSCBASE.CODICE=ANAGRAFICAARTICOLI.CODICE) join
    ARTICOLIFATTORICONVERSIONE on ANAGRAFICAARTICOLI.CODICE=ARTICOLIFATTORICONVERSIONE.CODART) join
    VISTAARTICOLIUMBASE on ANAGRAFICAARTICOLI.CODICE=VISTAARTICOLIUMBASE.CODICE)
    on ANAGRAFICAARTICOLI.CODICE=RD.CODART,TABCAMBI as TCAM
WHERE
	(TCAM.CODICE=0) 
    and (ANAGRAFICARISERVATICF.ESERCIZIO=TD.ESERCIZIO)
    and ((RD.UMGEST=ARTICOLIFATTORICONVERSIONE.UM1) or(RD.CODART=''))

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTADOCUMENTITRACC] TO [Metodo98]
    AS [dbo];

