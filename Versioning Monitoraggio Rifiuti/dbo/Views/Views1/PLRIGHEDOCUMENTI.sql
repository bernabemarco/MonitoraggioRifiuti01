﻿
CREATE VIEW PLRIGHEDOCUMENTI
AS
SELECT     IDTESTA, IDRIGA, ESERCIZIO, TIPODOC, NUMERODOC, BIS, POSIZIONE, TIPORIGA, CODART, IDARTBASE, CODARTBASE, VARIANTI, 
                      DESCRIZIONEART, NUMLISTINO, UMGEST, QTAGEST - QtaPlRes AS QTAGEST, QTAGESTRES - QtaPlRes AS QTAGESTRES, 
                      QTAGESTPRELEVATA, QTA1MAG, QTA1MAGMAN, QTA1MAGRES, QTA2MAG, QTA2MAGMAN, QTA2MAGRES, UMPREZZO, QTAPREZZO, 
                      QTAPREZZOMAN, QTAPREZZORES, NRRIFPARTITA, PREZZOUNITLORDO, PREZZOUNITLORDOEURO, PREZZOUNITLORDOIVATO, 
                      PREZZOUNITNETTO, PREZZOUNITNETTOEURO, SCONTORIGA, SCONTIESTESI, CODIVA, TOTLORDORIGA, TOTLORDORIGARES, 
                      TOTLORDORIGAEURO, TOTLORDORIGAEURORES, TOTNETTORIGA, TOTNETTORIGARES, TOTNETTORIGAEURO, TOTNETTORIGAEURORES, 
                      RIGACHIUSA, DATACONSEGNA, PROVVAG1, TOTPROVVAG1, TOTPROVVAG1RES, TOTPROVVAGEURO1, TOTPROVVAGEURO1RES, PROVVAG2, 
                      TOTPROVVAG2, TOTPROVVAG2RES, TOTPROVVAGEURO2, TOTPROVVAGEURO2RES, PROVVAG3, TOTPROVVAG3, TOTPROVVAG3RES, 
                      TOTPROVVAGEURO3, TOTPROVVAGEURO3RES, NUMCOLLI, GENCONTROP, VERSIONEDIBA, PESONETTO, PESOLORDO, PESOLORDORES, 
                      PESOIMBALLO, SUPERFICIE, VOLUME, ANNOTAZIONI, NRPEZZIIMBALLO, CODIMBALLO, NOMENCLCOMBINATA, CONTOCDC, CONTOCDCMOVCOLL, 
                      ANNOINIZIOCOMP, ANNOFINECOMP, MESEINIZIOCOMP, MESEFINECOMP, RIGAPRELEVABILE, RIFGPSCONTO, RIFGPPREZZO, CAUSALEMAG, 
                      CODDEPOSITO, CAUSALEMAGCOLL, CODDEPOSITOCOLL, CAUSALEMAGCOMP, CODDEPCOMP, CAUSALEMAGCOMPCOLL, CODDEPCOMPCOLL, 
                      RIFCOMMCLI, NOMECOMMESSAPROD, PROVENIENZAINTRA, IDTESTARP, IDRIGARP, RIGABLOCCATA, FLAGS, UBICAZIONE, UBICAZIONECOLL, 
                      UBICAZIONECOMP, UBICAZIONECOMPCOLL, IDCONSEGNA, UTENTEMODIFICA, DATAMODIFICA, flgImpExp, RifRelazioneCF, RiportaDescPL, 
                      NomeStampaConf, ANNOBOLLACLF, NUMEROBOLLACLF, OPERAZIONECLF, ORIGINEINTRA, FLAGNETTIFICAMPS, IMPTOTPROVVRIGA, 
                      IMPTOTPROVVRIGARES, TOTLORDOPREL, IDCDC, QTAPLRES, DATABASEIE, IDTESTAIE, IDRIGAIE, STATOOPERAZIONECLF, 
                      CAUSALEVERSAMENTOCLF, CAUSALETRASFERIMENTOCLF, COMPONENTEKIT
FROM         RIGHEDOCUMENTI


GO
GRANT DELETE
    ON OBJECT::[dbo].[PLRIGHEDOCUMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PLRIGHEDOCUMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PLRIGHEDOCUMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PLRIGHEDOCUMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PLRIGHEDOCUMENTI] TO [Metodo98]
    AS [dbo];
