﻿
CREATE VIEW TP_DETTAGLIOPRELIEVOOFN
AS
SELECT 	
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
    TD.TOTPROVVAG1*TD.SEGNO as TOTPROVVFINALEAG1VALUTA,
    TD.TOTPROVVAG2*TD.SEGNO as TOTPROVVFINALEAG2VALUTA,
    TD.TOTPROVVAG3*TD.SEGNO as TOTPROVVFINALEAG3VALUTA,
    TD.TOTPROVVAGEURO1*TD.SEGNO as TOTPROVVFINALEAG1EURO,
    TD.TOTPROVVAGEURO2*TD.SEGNO as TOTPROVVFINALEAG2EURO,
    TD.TOTPROVVAGEURO3*TD.SEGNO as TOTPROVVFINALEAG3EURO,
    TD.TOTDOCUMENTOEURO*TD.SEGNO as TOTDOCUMENTOEURO,
    TD.TOTIMPOSTAEURO*TD.SEGNO as TOTIMPOSTAEURO,
    TD.TOTDOCUMENTO*TD.SEGNO as TOTDOCVALUTA,
    TD.TOTIMPOSTA*TD.SEGNO as TOTIMPOSTAVALUTA,
    TD.TOTIMPONIBILE*TD.SEGNO AS TOTIMPONIBILEVALUTA,
    TD.TOTIMPONIBILEEURO*TD.SEGNO AS TOTIMPONIBILEEURO,
    TD.INCIDENZASCONTI,
    RD.IDRIGA as PROGRIGADOC,RD.POSIZIONE,
    RD.TIPORIGA,RD.RIGACHIUSA,RD.RIGABLOCCATA,
    RD.CODART,RD.DESCRIZIONEART,
    RD.DATACONSEGNA,RD.NUMLISTINO,RD.UMGEST,
    RD.UMPREZZO,
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
    RD.PREZZOUNITNETTO as PREZZOUNITNETTOVALUTA,
    RD.PREZZOUNITLORDO as PREZZOUNITLORDOVALUTA,
    RD.PREZZOUNITNETTOEURO,
    RD.PREZZOUNITLORDOEURO,
    RD.UBICAZIONE,
    RD.UBICAZIONECOLL,
    RD.UBICAZIONECOMP,
    RD.UBICAZIONECOMPCOLL,
    RD.QTAGEST*TD.SEGNO as QTAGEST,
    RD.QTAGESTRES*TD.SEGNO as QTAGESTRES,
    RD.QTA1MAG*TD.SEGNO as QTA1MAG,
    RD.QTA1MAGRES*TD.SEGNO as QTA1MAGRES,
    RD.QTA2MAG*TD.SEGNO as QTA2MAG,
    RD.QTA2MAGRES*TD.SEGNO as QTA2MAGRES,
    RD.QTAPREZZO*TD.SEGNO as QTAPREZZO,
    RD.QTAPREZZORES*TD.SEGNO as QTAPREZZORES,
    RD.QTAGESTPRELEVATA*TD.SEGNO as QTAGESTPRELEVATA,
    RD.TOTLORDORIGA*TD.SEGNO as TOTLORDORIGAVALUTA,
    RD.TOTNETTORIGA*TD.SEGNO as TOTNETTORIGAVALUTA,
    RD.TOTLORDORIGAEURO*TD.SEGNO as TOTLORDORIGAEURO,
    RD.TOTNETTORIGAEURO*TD.SEGNO as TOTNETTORIGAEURO,
    RD.TOTPROVVAGEURO1*TD.SEGNO as TOTPROVVAG1EURO,
    RD.TOTPROVVAGEURO2*TD.SEGNO as TOTPROVVAG2EURO,
    RD.TOTPROVVAGEURO3*TD.SEGNO as TOTPROVVAG3EURO,
    RD.TOTPROVVAG1*TD.SEGNO as TOTPROVVAG1VALUTA,
    RD.TOTPROVVAG2*TD.SEGNO as TOTPROVVAG2VALUTA,
    RD.TOTPROVVAG3*TD.SEGNO as TOTPROVVAG3VALUTA,
    RD.RIFRELAZIONECF
FROM (TESTEDOCUMENTI as TD join RIGHEDOCUMENTI as RD on TD.PROGRESSIVO=RD.IDTESTA) , TABUTENTI
WHERE	USERDB = USER_NAME() AND
	(SUPERVISOR = 1 OR (SUPERVISOR = 0 AND USERID IN (SELECT NOMEUTENTE FROM ACCESSIDOCUMENTI WHERE CODDOCUMENTO = TD.TIPODOC AND FLAGVISUALIZZA=1))) AND 
	((TD.CODCLIFOR=TABUTENTI.CODCLIFOR) OR (TABUTENTI.CODCLIFOR=''))


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_DETTAGLIOPRELIEVOOFN] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_DETTAGLIOPRELIEVOOFN] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_DETTAGLIOPRELIEVOOFN] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_DETTAGLIOPRELIEVOOFN] TO [Metodo98]
    AS [dbo];

