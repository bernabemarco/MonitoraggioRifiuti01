﻿

CREATE VIEW VISTAGESTIONEPREZZICTR
AS 
SELECT GP.PROGRESSIVO,GP.PROGRESSIVOCTR, GP.CODGRUPPOPREZZICF, GP.CODCLIFOR, GP.CODART, GP.CODGRUPPOPREZZIMAG, 
GPR.QTAMINIMA, GPR.UM, GP.INIZIOVALIDITA, GP.FINEVALIDITA, GP.USANRLISTINO, GP.TIPOARROT, GP.ARROTALIRE, 
GP.ARROTAEURO, GPR.PREZZO_MAGG, GPR.PREZZO_MAGGEURO, GPR.TIPO, GPR.SCONTO_UNICO, GPR.SCONTO_AGGIUNTIVO, GPR.NRLISTINO, 
GP.CODARTRIC,GP.CODFEATURE,GP.VARESPLICITE,  
(CASE WHEN CHARINDEX('#', GP.CODART) > 0 THEN SUBSTRING(GP.CODART, 1, CHARINDEX('#', GP.CODART) - 1) 
 ELSE GP.CODART END) AS CODPADRE, 
(SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE = GP.CODART) AS DSCA, 
(CASE WHEN (SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE = GP.CODART) IS NULL THEN 
  (SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE = (CASE WHEN CHARINDEX('#', GP.CODART) > 0 
   THEN SUBSTRING(GP.CODART, 1, CHARINDEX('#', GP.CODART) - 1) ELSE GP.CODART END)) ELSE 
  (SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE = GP.CODART) END) AS DSCARTICOLO, 
(SELECT DSCCONTO1 FROM ANAGRAFICACF WHERE CODCONTO = GP.CODCLIFOR) AS RAGSOCCF, 
(CASE WHEN (SELECT DSCCONTO1 FROM ANAGRAFICACF WHERE CODCONTO = GP.CODCLIFOR) IS NULL THEN 
(CASE WHEN GP.CODCLIFOR = '' OR GP.CODCLIFOR IS NULL THEN 'TUTTI I CLIENTI E FORNITORI' ELSE 
(CASE WHEN GP.CODCLIFOR = 'C' THEN 'TUTTI I CLIENTI' ELSE 'TUTTI I FORNITORI' END) END) ELSE 
(SELECT DSCCONTO1 FROM ANAGRAFICACF WHERE CODCONTO = GP.CODCLIFOR) END) AS DSCCONTO, 
(SELECT DESCRIZIONE FROM TABRAGGRPREZZICF WHERE CODICE = GP.CODGRUPPOPREZZICF) AS DSCCATEGORIA, 
(SELECT DESCRIZIONE FROM TABRAGGRUPPAPREZZI WHERE CODICE = GP.CODGRUPPOPREZZIMAG) AS DSCGRUPPO,
(SELECT DESCRIZIONE FROM FEATURE WHERE CODICE = GP.CODFEATURE) AS DSCFEATURE  
FROM GESTIONEPREZZICTR GP, GESTIONEPREZZIRIGHECTR GPR WHERE (GP.PROGRESSIVO = GPR.RIFPROGRESSIVO)


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAGESTIONEPREZZICTR] TO [Metodo98]
    AS [dbo];

