﻿

CREATE VIEW VISTAPARAMETRIDOC AS
SELECT PDC.CODICE, PDC.DESCRIZIONE,PDC.TIPO,PDC.DOCTRASPORTO,PDC.CLIFOR,PDC.TIPORIGHE,PDC.TIPOPIEDE,PDC.TIPOUM,PDC.CODICETAPPO,PDC.REGISTRAZIONE,PDC.REGFATTURA,PDC.CAUSALEMAG,
       PDC.CAUSALEMAGCOLL,PDC.CAUSALEMAGCOMP,PDC.CAUSALEMAGCOMPCOLL,PDC.CAUSALECONTAB,PDC.SPESEDOC,PDC.SPESEDOCEURO,PDC.SPESEEFFETTO,PDC.SPESEEFFETTOEURO,PDC.LIVELLIDISTBASE,
       PDC.COLLEGADISTBASE,PDC.GESTIONEQTAVAR,PDC.RETTSTORICO,PDC.ARROTPRZUNITARIO,PDC.AGGPREZZIPART,PDC.LETTPRZPARTICOLARI,PDC.LETTPRVPARTICOLARI,PDC.CALCAUTOCOLLI,
       PDC.ARROTNUMCOLLI,PDC.MODULOSTAMPA,PDC.DEVICESTAMPA,PDC.NUMCOPIE,PDC.STAMPAVAR,PDC.OPZIONISTAMPA,PDC.STAMPADISTBASE,PDC.SALTOPAG,PDC.STAMPAINFO,PDC.DEVSTAMPAINFODISTBASE,
       PDC.RIFDOCINRIGHE,PDC.NATURATRANS,PDC.CAUSALETRASP,PDC.ASPETTOBENI,PDC.ANNOTAZIONI,PDC.MODOTRASP,PDC.CONDCONSEGNA,PDC.ORIGINEINTRACEE,PDC.CODCAUSSCARICOVUOTI,
       PDC.CODCAUSCARICOVUOTI,PDC.CODIVAADDEBVUOTI,PDC.GENADDEBVUOTI,PDC.CODIVAACCRVUOTI,PDC.GENACCRVUOTI,PDC.CTRLFIDO,PDC.PRELCFFATT,PDC.PRELRIGHERIF,PDC.PRELCAMBIO,
       PDC.CODDEPOSITO,PDC.CODDEPOSITOCOLL,PDC.CODDEPCOMP,PDC.CODDEPCOMPCOLL,PDC.SEQMAG,PDC.SEQMAGCOLL,PDC.SEQMAGCOMP,PDC.SEQMAGCOMPCOLL,PDC.RICCODMAG,PDC.NOSTORNADOC,
       PDC.MODULOSTAMPADIST,PDC.MODULOSTAMPAETIC,PDC.DEVICESTAMPAETIC,PDC.TIPOSTAMPAETIC,PDC.RETTPREZZO,PDC.RETTQTA,PDC.FLGCONSCOMMCLI,PDC.CODCAUSCOMMCLI,PDC.TIPOCALCPROVVFINALI,
       PDC.FILTROMANUALE,PDC.NOMEIMPOSTAZIONEFM,PDC.FILTROAUTOMATICO,PDC.NOMEIMPOSTAZIONEFA,PDC.FILTROMANUALERIGHE,PDC.NOMEIMPOSTAZIONEFMRIGHE,PDC.FILTROAUTOMATICORIGHE,
       PDC.NOMEIMPOSTAZIONEFARIGHE,PDC.GESTINTRA,PDC.USAPESOPIEDE,PDC.RIPARTSPESEINTRA,PDC.VALSTATINVALUTA,PDC.EMETTILISTAMOV,PDC.TIPOLISTAMOV,PDC.UTENTEMODIFICA,
       PDC.DATAMODIFICA,PDC.RICPREZZISCONTI,PDC.VALORIZZALISTAMOV,PDC.ULTPRZACQVEND,PDC.VERSACOMPETENZE,PDC.GESTCAUZIONI,PDC.STAMPACAUZIONI,PDC.CAUSALEMAGCONSCAUZ,
       PDC.CODDEPCONSCAUZ,PDC.SEQMAGCONSCAUZ,PDC.CAUSALEMAGCONSCAUZCOLL,PDC.CODDEPCONSCAUZCOLL,PDC.SEQMAGCONSCAUZCOLL,PDC.CAUSALEMAGRESICAUZ,PDC.CODDEPRESICAUZ,
       PDC.SEQMAGRESICAUZ,PDC.CAUSALEMAGRESICAUZCOLL,PDC.CODDEPRESICAUZCOLL,PDC.SEQMAGRESICAUZCOLL,PDC.INTRAINVALFORN,PDC.CTRLFIDOBLOC,PDC.TIPOUMPREZZO,PDC.CTRLQTAMIN,
       PDC.DAIMPORTOSPESE,PDC.NOAVVPRZAZERO,PDC.NOAVVNOCONTROP,PDC.NOAVVCIVAAZERO,PDC.NUMCOPIEDBA,PDC.OPTTIPOVAL,PDC.CONFIGURATORE,PDC.NOROTTURADOC,PDC.FLGAGGIORNAMPS,
       PDC.EMETTIMOVAVANZAMENTO,PDC.CAUSALECONSENTRATA,PDC.CAUSALECONSTRASF,PDC.GENSCADPREV,PDC.AGENTESPESERIPMAG,PDC.TIPOCALCSPESERIPMAG,PDC.GESTPRENOTATI,PDC.USADATAINIZIOLAV,
       PDC.DOCRESO,PDC.FLAGGESTIONESSCC,PDC.FLAGDOCDO,PDC.RIPSCFINALE,PDC.FLAGRIGHEDESCR,PDC.REGISTROCLAVORO,PDC.CONTROLLODATACONSEGNA,PDC.CONTROLLOIVABLOCCANTE,
       PDC.COMPILATORE_ALTRO,PDC.COMMITTENTE_ALTRO,PDC.CARICATORE_ALTRO,PDC.PROPRIETARIO_ALTRO,PDC.CARICO_ALTRO,PDC.COMPILATORE_DFLT,PDC.COMMITTENTE_DFLT,PDC.PROPRIETARIO_DFLT,
       PDC.CARICATORE_DFLT,PDC.CARICO_DFLT,PDC.SCARICO_DFLT,PDC.MODULOSTAMPATR,PDC.DEVICESTAMPATR,PDC.NUMCOPIETR,PDC.FLGSCHEDATR,PDC.FLGBLACKLIST,PDC.OGGETTOEMAIL,PDC.TESTOEMAIL,PDC.FIRMAEMAIL,PDC.FLGCONFERMALETTEMAIL,PDC.NOMEMITTEMAIL,PDC.INDMITTEMAIL,PDC.FLGRIFCONTRATTO,
       PDC.FLGSISTRI,PDC.TIPODOCPA,PDC.RIPINTRASPESEEFF,PDC.RIPINTRASPESEDOC,PDC.RIPINTRAALTRESPESE,PDC.TIPOVENDITAB2B,PDC.TIPODOCB2B,PDC.NOMEFIRMAOUTLOOK,PDC.TIPOFIRMAEMAIL
FROM 
    PARAMETRIDOC PDC INNER JOIN  TABUTENTI ON USERDB = USER_NAME()
WHERE 
    (SUPERVISOR = 1 OR 
    (SUPERVISOR = 0 AND USERID IN (SELECT NOMEUTENTE FROM ACCESSIDOCUMENTI WHERE CODDOCUMENTO = PDC.CODICE AND (FLAGABILITA=1 OR FLAGPRELEVA=1))))


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAPARAMETRIDOC] TO [Metodo98]
    AS [dbo];

