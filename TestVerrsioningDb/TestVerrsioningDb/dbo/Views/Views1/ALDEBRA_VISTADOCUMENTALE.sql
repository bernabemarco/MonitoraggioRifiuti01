﻿

CREATE VIEW [dbo].[ALDEBRA_VISTADOCUMENTALE]
AS
----------------------------------------
-- DATI DOCUMENTI
----------------------------------------
-- SELEZIONE TIPI DOCUMENTO CON FLAG (INTRA=0) IN PARAMETRI ADIGEST
SELECT DISTINCT
''  COLLATE SQL_Latin1_General_CP1_CI_AS AS GUIID, 
TD.PROGRESSIVO AS IDDOC, 
TC.PROGRESSIVO AS IDCON,
(CASE WHEN ISNULL(TD.PROGRESSIVO, 0) <> 0 THEN AD.PREFISSO + '-' + LTRIM(RTRIM(CONVERT(VARCHAR(20), TD.PROGRESSIVO))) + ISNULL(AD.SUFFISSO,'') ELSE AC.PREFISSO + '-' + RIGHT('00000000' + LTRIM(RTRIM(CONVERT(VARCHAR(20), TC.PROGRESSIVO))), 8) + ISNULL(AC.SUFFISSO,'') END)  COLLATE SQL_Latin1_General_CP1_CI_AS AS KEYUNIQUE, 
(CASE WHEN ISNULL(TC.PROGRESSIVO, 0) = 0 THEN TD.CODCLIFOR ELSE (SELECT     CONTO  FROM RIGHECONTABILITA WHERE NRREG = TC.PROGRESSIVO AND NRRIGA = 1) END)  COLLATE SQL_Latin1_General_CP1_CI_AS AS CODICEANAGRA, 
TD.ESERCIZIO AS ESERCIZIODOC, 
TD.TIPODOC COLLATE SQL_Latin1_General_CP1_CI_AS AS TIPODOC,
(CASE WHEN ISNULL(RIGHEIVA.NUMDOC,'') <> '' THEN RIGHEIVA.NUMDOC ELSE CONVERT(VARCHAR(10),TD.NUMERODOC) END) COLLATE SQL_Latin1_General_CP1_CI_AS AS NUMERODOC,
TD.DATADOC, 
TC.ESERCIZIO AS ESERCIZIOCONT, 
TC.DATAREG, 
TD.DATARIFDOC AS DATARIF, 
TD.NUMRIFDOC COLLATE SQL_Latin1_General_CP1_CI_AS AS NRRIFER, 
TC.CAUSALE, 
TC.DESCRIZIONE COLLATE SQL_Latin1_General_CP1_CI_AS AS DESCRIZIONE, 
TC.PROGRESSIVO AS NUMEROREG, 
CC.DESCRIZIONE COLLATE SQL_Latin1_General_CP1_CI_AS AS DESCRIZIONECAUSALE, 
PD.DESCRIZIONE COLLATE SQL_Latin1_General_CP1_CI_AS AS DESCRIZIONEDOCUMENTO, 
AC.PREFISSO COLLATE SQL_Latin1_General_CP1_CI_AS AS PREFISSOCONT, 
AD.PREFISSO COLLATE SQL_Latin1_General_CP1_CI_AS AS PREFISSODOC,
AD.FAMIGLIA COLLATE SQL_Latin1_General_CP1_CI_AS AS FAMIGLIA,
TD.BIS COLLATE SQL_Latin1_General_CP1_CI_AS AS BIS,
PD.MODULOSTAMPA COLLATE SQL_Latin1_General_CP1_CI_AS AS MODULOSTAMPA,
CF.DSCCONTO1 COLLATE SQL_Latin1_General_CP1_CI_AS AS RAGIONESOCIALE,
CF.INDIRIZZO COLLATE SQL_Latin1_General_CP1_CI_AS AS INDIRIZZO,
CF.CAP COLLATE SQL_Latin1_General_CP1_CI_AS AS CAP,
CF.LOCALITA COLLATE SQL_Latin1_General_CP1_CI_AS AS LOCALITA,
CF.PROVINCIA COLLATE SQL_Latin1_General_CP1_CI_AS AS PROVINCIA,
CF.PARTITAIVA COLLATE SQL_Latin1_General_CP1_CI_AS AS PARTITAIVA,
CF.CODFISCALE COLLATE SQL_Latin1_General_CP1_CI_AS AS CODFISCALE,
(CASE WHEN ISNULL(TD.PROGRESSIVO, 0) <> 0 THEN TD.PROGRESSIVO ELSE TC.PROGRESSIVO END) AS PROGRESSIVO,
PD.TIPO COLLATE SQL_Latin1_General_CP1_CI_AS AS TIPOLOGIADOC,
ISNULL(AD.SUFFISSO,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS SUFFISSO,
TD.CODAGENTE1 COLLATE SQL_Latin1_General_CP1_CI_AS AS CODAGENTE1,
ISNULL(AG.DSCAGENTE,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS DSCAGENTE1,
ISNULL(TD.ANNOTAZIONI,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS ANNOTAZIONI,
AD.INTRA,
ISNULL(RIGHEIVA.TIPOREGISTRO,0) AS TIPOREGISTRO,
ISNULL(LEFT(FPA.NOMEFILETRASMISSIONE,CHARINDEX('_',FPA.NOMEFILETRASMISSIONE)-1),'') COLLATE SQL_Latin1_General_CP1_CI_AS AS IDTRASMITTENTE, 
ISNULL(SUBSTRING(FPA.NOMEFILETRASMISSIONE,CHARINDEX('_',FPA.NOMEFILETRASMISSIONE)+1,(CHARINDEX('.',FPA.NOMEFILETRASMISSIONE)-(CHARINDEX('_',FPA.NOMEFILETRASMISSIONE)+1))),'') COLLATE SQL_Latin1_General_CP1_CI_AS AS IDPROGRESSIVOUNIVOCO,
ISNULL(TD.CODICECIG,'') COLLATE SQL_Latin1_General_CP1_CI_AS CODICECIG,
ISNULL(TD.CODICECUP,'') COLLATE SQL_Latin1_General_CP1_CI_AS CODICECUP,
AVP.*
FROM         
TESTEDOCUMENTI TD 
INNER JOIN ANAGRAFICACF CF ON TD.CODCLIFOR COLLATE SQL_Latin1_General_CP1_CI_AS = CF.CODCONTO COLLATE SQL_Latin1_General_CP1_CI_AS
INNER JOIN PARAMETRIDOC PD ON TD.TIPODOC COLLATE SQL_Latin1_General_CP1_CI_AS = PD.CODICE COLLATE SQL_Latin1_General_CP1_CI_AS
INNER JOIN ADIGEST_DOCUMENTI AD ON TD.TIPODOC COLLATE SQL_Latin1_General_CP1_CI_AS = AD.CODICE COLLATE SQL_Latin1_General_CP1_CI_AS
LEFT OUTER JOIN ANAGRAFICAAGENTI AG ON TD.CODAGENTE1 COLLATE SQL_Latin1_General_CP1_CI_AS =AG.CODAGENTE COLLATE SQL_Latin1_General_CP1_CI_AS
LEFT OUTER JOIN TESTECONTABILITA TC ON TD.PROGRESSIVO = TC.IDTESTADOC 
LEFT OUTER JOIN CAUSALICONTABILI CC ON TC.CAUSALE = CC.CODICECAUSALE 
LEFT OUTER JOIN TIPOREGISTROIVA ON CC.NRREGISTRO=TIPOREGISTROIVA.CODICE
LEFT OUTER JOIN RIGHEIVA ON RIGHEIVA.NRREG=TC.PROGRESSIVO 
--AND RIGHEIVA.NRRIGA=1 
AND RIGHEIVA.TIPOREGISTRO=TIPOREGISTROIVA.CODICE
LEFT OUTER JOIN ADIGEST_CONTABILITA AC ON TC.CAUSALE = AC.CODICE
LEFT OUTER JOIN ALDEBRA_VISTADOCUMENTALE_PERS AVP ON (CASE WHEN ISNULL(TD.PROGRESSIVO, 0) <> 0 THEN AD.PREFISSO + '-' + LTRIM(RTRIM(CONVERT(VARCHAR(20), TD.PROGRESSIVO))) + ISNULL(AD.SUFFISSO,'') ELSE AC.PREFISSO + '-' + RIGHT('00000000' + LTRIM(RTRIM(CONVERT(VARCHAR(20), TC.PROGRESSIVO))), 8) + ISNULL(AC.SUFFISSO,'') END) COLLATE SQL_Latin1_General_CP1_CI_AS =AVP.KEYUNIQUE_PERS COLLATE SQL_Latin1_General_CP1_CI_AS
LEFT OUTER JOIN STATOFATTUREPA FPA ON TD.PROGRESSIVO=FPA.RIFPROGRESSIVO
WHERE ISNULL(AD.INTRA,0)=0 AND ISNULL(AC.INTRA,0)=0
UNION
-- SELEZIONE TIPI DOCUMENTO CON FLAG (INTRA=1) IN PARAMETRI ADIGEST
SELECT DISTINCT
'' COLLATE SQL_Latin1_General_CP1_CI_AS AS GUIID, 
TD.PROGRESSIVO AS IDDOC, 
TC.PROGRESSIVO AS IDCON, 
(CASE WHEN ISNULL(TD.PROGRESSIVO, 0) <> 0 THEN AD.PREFISSO + '-' + LTRIM(RTRIM(CONVERT(VARCHAR(20), TD.PROGRESSIVO))) + ISNULL(AD.SUFFISSO,'') ELSE AC.PREFISSO + '-' + RIGHT('00000000' + LTRIM(RTRIM(CONVERT(VARCHAR(20), TC.PROGRESSIVO))), 8) + ISNULL(AC.SUFFISSO,'') END) COLLATE SQL_Latin1_General_CP1_CI_AS AS KEYUNIQUE, 
(CASE WHEN ISNULL(TC.PROGRESSIVO, 0) = 0 THEN TD.CODCLIFOR ELSE (SELECT     CONTO  FROM RIGHECONTABILITA WHERE NRREG = TC.PROGRESSIVO AND NRRIGA = 1) END) COLLATE SQL_Latin1_General_CP1_CI_AS AS CODICEANAGRA, 
TD.ESERCIZIO AS ESERCIZIODOC, 
TD.TIPODOC COLLATE SQL_Latin1_General_CP1_CI_AS AS TIPODOC,
--TD.NUMERODOC, 
(CASE WHEN ISNULL(RIGHEIVA.NUMDOC,'') <> '' THEN RIGHEIVA.NUMDOC ELSE CONVERT(VARCHAR(10),TD.NUMERODOC) END) COLLATE SQL_Latin1_General_CP1_CI_AS AS NUMERODOC, 
TD.DATADOC, 
TC.ESERCIZIO AS ESERCIZIOCONT, 
TC.DATAREG, 
TD.DATARIFDOC AS DATARIF, 
TD.NUMRIFDOC COLLATE SQL_Latin1_General_CP1_CI_AS AS NRRIFER, 
TC.CAUSALE, 
TC.DESCRIZIONE COLLATE SQL_Latin1_General_CP1_CI_AS AS DESCRIZIONE, 
TC.PROGRESSIVO AS NUMEROREG, 
CC.DESCRIZIONE COLLATE SQL_Latin1_General_CP1_CI_AS AS DESCRIZIONECAUSALE, 
PD.DESCRIZIONE COLLATE SQL_Latin1_General_CP1_CI_AS AS DESCRIZIONEDOCUMENTO, 
AC.PREFISSO COLLATE SQL_Latin1_General_CP1_CI_AS AS PREFISSOCONT, 
AD.PREFISSO COLLATE SQL_Latin1_General_CP1_CI_AS AS PREFISSODOC,
AD.FAMIGLIA COLLATE SQL_Latin1_General_CP1_CI_AS AS FAMIGLIA,
TD.BIS COLLATE SQL_Latin1_General_CP1_CI_AS AS BIS,
PD.MODULOSTAMPA COLLATE SQL_Latin1_General_CP1_CI_AS AS MODULOSTAMPA,
CF.DSCCONTO1 COLLATE SQL_Latin1_General_CP1_CI_AS AS RAGIONESOCIALE,
CF.INDIRIZZO COLLATE SQL_Latin1_General_CP1_CI_AS AS INDIRIZZO,
CF.CAP COLLATE SQL_Latin1_General_CP1_CI_AS AS CAP,
CF.LOCALITA COLLATE SQL_Latin1_General_CP1_CI_AS AS LOCALITA,
CF.PROVINCIA COLLATE SQL_Latin1_General_CP1_CI_AS AS PROVINCIA,
CF.PARTITAIVA COLLATE SQL_Latin1_General_CP1_CI_AS AS PARTITAIVA,
CF.CODFISCALE COLLATE SQL_Latin1_General_CP1_CI_AS AS CODFISCALE,
(CASE WHEN ISNULL(TD.PROGRESSIVO, 0) <> 0 THEN TD.PROGRESSIVO ELSE TC.PROGRESSIVO END) AS PROGRESSIVO,
PD.TIPO COLLATE SQL_Latin1_General_CP1_CI_AS AS TIPOLOGIADOC,
ISNULL(AD.SUFFISSO,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS SUFFISSO,
TD.CODAGENTE1 COLLATE SQL_Latin1_General_CP1_CI_AS AS CODAGENTE1,
ISNULL(AG.DSCAGENTE,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS DSCAGENTE1,
ISNULL(TD.ANNOTAZIONI,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS ANNOTAZIONI,
AD.INTRA,
ISNULL(RIGHEIVA.TIPOREGISTRO,0) AS TIPOREGISTRO,
ISNULL(LEFT(FPA.NOMEFILETRASMISSIONE,CHARINDEX('_',FPA.NOMEFILETRASMISSIONE)-1),'') COLLATE SQL_Latin1_General_CP1_CI_AS AS IDTRASMITTENTE, 
ISNULL(SUBSTRING(FPA.NOMEFILETRASMISSIONE,CHARINDEX('_',FPA.NOMEFILETRASMISSIONE)+1,(CHARINDEX('.',FPA.NOMEFILETRASMISSIONE)-(CHARINDEX('_',FPA.NOMEFILETRASMISSIONE)+1))),'') COLLATE SQL_Latin1_General_CP1_CI_AS AS IDPROGRESSIVOUNIVOCO,
ISNULL(TD.CODICECIG,'') COLLATE SQL_Latin1_General_CP1_CI_AS CODICECIG,
ISNULL(TD.CODICECUP,'') COLLATE SQL_Latin1_General_CP1_CI_AS CODICECUP,
AVP.*
FROM         
TESTEDOCUMENTI TD 
INNER JOIN ANAGRAFICACF CF ON TD.CODCLIFOR COLLATE SQL_Latin1_General_CP1_CI_AS = CF.CODCONTO COLLATE SQL_Latin1_General_CP1_CI_AS
INNER JOIN PARAMETRIDOC PD ON TD.TIPODOC COLLATE SQL_Latin1_General_CP1_CI_AS = PD.CODICE COLLATE SQL_Latin1_General_CP1_CI_AS
INNER JOIN ADIGEST_DOCUMENTI AD ON TD.TIPODOC COLLATE SQL_Latin1_General_CP1_CI_AS = AD.CODICE COLLATE SQL_Latin1_General_CP1_CI_AS
LEFT OUTER JOIN ANAGRAFICAAGENTI AG ON TD.CODAGENTE1 COLLATE SQL_Latin1_General_CP1_CI_AS =AG.CODAGENTE COLLATE SQL_Latin1_General_CP1_CI_AS
LEFT OUTER JOIN TESTECONTABILITA TC ON TD.PROGRESSIVO = TC.IDTESTADOC 
LEFT OUTER JOIN CAUSALICONTABILI CC ON TC.CAUSALE = CC.CODICECAUSALE 
LEFT OUTER JOIN TIPOREGISTROIVA ON CC.NRREGISTRO=TIPOREGISTROIVA.CODICE
LEFT OUTER JOIN RIGHEIVA ON RIGHEIVA.NRREG=TC.PROGRESSIVO 
--AND RIGHEIVA.NRRIGA=1 
AND RIGHEIVA.TIPOREGISTRO<>TIPOREGISTROIVA.CODICE
LEFT OUTER JOIN ADIGEST_CONTABILITA AC ON TC.CAUSALE = AC.CODICE
LEFT OUTER JOIN ALDEBRA_VISTADOCUMENTALE_PERS AVP ON (CASE WHEN ISNULL(TD.PROGRESSIVO, 0) <> 0 THEN AD.PREFISSO + '-' + LTRIM(RTRIM(CONVERT(VARCHAR(20), TD.PROGRESSIVO))) + ISNULL(AD.SUFFISSO,'') ELSE AC.PREFISSO + '-' + RIGHT('00000000' + LTRIM(RTRIM(CONVERT(VARCHAR(20), TC.PROGRESSIVO))), 8) + ISNULL(AC.SUFFISSO,'') END) COLLATE SQL_Latin1_General_CP1_CI_AS = AVP.KEYUNIQUE_PERS COLLATE SQL_Latin1_General_CP1_CI_AS
LEFT OUTER JOIN STATOFATTUREPA FPA ON TD.PROGRESSIVO=FPA.RIFPROGRESSIVO
WHERE ISNULL(AD.INTRA,0)=1 AND ISNULL(AC.INTRA,0)=1
UNION
----------------------------------------
-- DATI CONTABILITA'
----------------------------------------
SELECT  
-- INSERITA CLAUSOLA DISTINCT PER ESCLUDERE RIGHEIVA MULTIPLE PER LO STESSO TIPOREGISTRO
DISTINCT    
'' COLLATE SQL_Latin1_General_CP1_CI_AS AS GUIID, 
0 AS IDDOC, 
PROGRESSIVO AS IDCON, 
(AC.PREFISSO + '-' + RIGHT('00000000' + LTRIM(RTRIM(CAST(PROGRESSIVO AS VARCHAR(8)))), 8)+ ISNULL(AC.SUFFISSO,'')) COLLATE SQL_Latin1_General_CP1_CI_AS AS KEYUNIQUE,
RC.CONTO COLLATE SQL_Latin1_General_CP1_CI_AS AS CODICEANAGRA, 
YEAR(RIGHEIVA.DATADOC) AS ESERCIZIODOC, 
'' COLLATE SQL_Latin1_General_CP1_CI_AS AS TIPODOC, 
ISNULL(RIGHEIVA.NUMDOC,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS NUMERODOC, 
RIGHEIVA.DATADOC AS DATADOC, 
TESTECONTABILITA.ESERCIZIO AS ESERCIZIOCONT, 
TESTECONTABILITA.DATAREG, 
TESTECONTABILITA.DATARIF, 
TESTECONTABILITA.NRRIFER COLLATE SQL_Latin1_General_CP1_CI_AS AS NRRIFER, 
TESTECONTABILITA.CAUSALE, 
TESTECONTABILITA.DESCRIZIONE COLLATE SQL_Latin1_General_CP1_CI_AS AS DESCRIZIONE, 
TESTECONTABILITA.PROGRESSIVO AS NUMEROREG, 
CAUSALICONTABILI.DESCRIZIONE COLLATE SQL_Latin1_General_CP1_CI_AS AS DESCRIZIONECAUSALE, 
'' COLLATE SQL_Latin1_General_CP1_CI_AS AS DESCRIZIONEDOCUMENTO, 
AC.PREFISSO COLLATE SQL_Latin1_General_CP1_CI_AS AS PREFISSOCONT, 
'' COLLATE SQL_Latin1_General_CP1_CI_AS AS PREFISSODOC,
AC.FAMIGLIA COLLATE SQL_Latin1_General_CP1_CI_AS AS FAMIGLIA,
'' COLLATE SQL_Latin1_General_CP1_CI_AS AS BIS,
'' COLLATE SQL_Latin1_General_CP1_CI_AS AS MODULOSTAMPA,
ISNULL(DSCCONTO1,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS RAGIONESOCIALE,
ISNULL(INDIRIZZO,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS INDIRIZZO,
ISNULL(CAP,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS CAP,
ISNULL(LOCALITA,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS LOCALITA,
ISNULL(PROVINCIA,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS PROVINCIA,
ISNULL(PARTITAIVA,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS PARTITAIVA,
ISNULL(CODFISCALE,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS CODFISCALE,
TESTECONTABILITA.PROGRESSIVO,
'' COLLATE SQL_Latin1_General_CP1_CI_AS AS TIPOLOGIADOC,
ISNULL(AC.SUFFISSO,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS SUFFISSO,
'' COLLATE SQL_Latin1_General_CP1_CI_AS AS CODAGENTE1,
'' COLLATE SQL_Latin1_General_CP1_CI_AS AS DSCAGENTE1,
'' COLLATE SQL_Latin1_General_CP1_CI_AS AS ANNOTAZIONI,
AC.INTRA,
ISNULL(RIGHEIVA.TIPOREGISTRO,0) AS TIPOREGISTRO,
'' COLLATE SQL_Latin1_General_CP1_CI_AS AS IDTRASMITTENTE, 
'' COLLATE SQL_Latin1_General_CP1_CI_AS AS IDPROGRESSIVOUNIVOCO,
ISNULL(TESTECONTABILITA.CODICECIG,'') COLLATE SQL_Latin1_General_CP1_CI_AS CODICECIG,
ISNULL(TESTECONTABILITA.CODICECUP,'') COLLATE SQL_Latin1_General_CP1_CI_AS CODICECUP,
AVP.*
FROM
CAUSALICONTABILI 
INNER JOIN TESTECONTABILITA ON CAUSALICONTABILI.CODICECAUSALE = TESTECONTABILITA.CAUSALE 
INNER JOIN ADIGEST_CONTABILITA AC ON CAUSALICONTABILI.CODICECAUSALE = AC.CODICE
LEFT OUTER JOIN TIPOREGISTROIVA ON CAUSALICONTABILI.NRREGISTRO=TIPOREGISTROIVA.CODICE
LEFT OUTER JOIN RIGHEIVA ON RIGHEIVA.NRREG=PROGRESSIVO 
--AND RIGHEIVA.NRRIGA=1 
AND RIGHEIVA.TIPOREGISTRO=TIPOREGISTROIVA.CODICE
LEFT OUTER JOIN RIGHECONTABILITA RC ON TESTECONTABILITA.PROGRESSIVO=RC.NRREG AND RC.NRRIGA=1 
LEFT OUTER JOIN ANAGRAFICACF CF ON RC.CONTO COLLATE SQL_Latin1_General_CP1_CI_AS = CF.CODCONTO COLLATE SQL_Latin1_General_CP1_CI_AS
LEFT OUTER JOIN ALDEBRA_VISTADOCUMENTALE_PERS AVP ON (AC.PREFISSO + '-' + RIGHT('00000000' + LTRIM(RTRIM(CAST(PROGRESSIVO AS VARCHAR(8)))), 8)+ ISNULL(AC.SUFFISSO,'')) COLLATE SQL_Latin1_General_CP1_CI_AS = AVP.KEYUNIQUE_PERS COLLATE SQL_Latin1_General_CP1_CI_AS
-- INSERITA WHERE PER ESCLUDERE MOVIMENTI CONTABILI DERIVANTI DA DOCUMENTI
WHERE ISNULL(IDTESTADOC,0)=0 AND ISNULL(AC.INTRA,0)=0 
UNION
SELECT   
-- INSERITA CLAUSOLA DISTINCT PER ESCLUDERE RIGHEIVA MULTIPLE PER LO STESSO TIPOREGISTRO
DISTINCT    
'' COLLATE SQL_Latin1_General_CP1_CI_AS AS GUIID, 
0 AS IDDOC, 
PROGRESSIVO AS IDCON, 
(AC.PREFISSO + '-' + RIGHT('00000000' + LTRIM(RTRIM(CAST(PROGRESSIVO AS VARCHAR(8)))), 8)+ ISNULL(AC.SUFFISSO,'')) COLLATE SQL_Latin1_General_CP1_CI_AS AS KEYUNIQUE,
RC.CONTO COLLATE SQL_Latin1_General_CP1_CI_AS AS CODICEANAGRA, 
YEAR(RIGHEIVA.DATADOC) AS ESERCIZIODOC, 
'' COLLATE SQL_Latin1_General_CP1_CI_AS AS TIPODOC, 
ISNULL(RIGHEIVA.NUMDOC,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS NUMERODOC, 
RIGHEIVA.DATADOC AS DATADOC, 
TESTECONTABILITA.ESERCIZIO AS ESERCIZIOCONT, 
TESTECONTABILITA.DATAREG, 
TESTECONTABILITA.DATARIF, 
TESTECONTABILITA.NRRIFER COLLATE SQL_Latin1_General_CP1_CI_AS AS NRRIFER, 
TESTECONTABILITA.CAUSALE, 
TESTECONTABILITA.DESCRIZIONE COLLATE SQL_Latin1_General_CP1_CI_AS AS DESCRIZIONE, 
TESTECONTABILITA.PROGRESSIVO AS NUMEROREG, 
CAUSALICONTABILI.DESCRIZIONE COLLATE SQL_Latin1_General_CP1_CI_AS AS DESCRIZIONECAUSALE, 
'' COLLATE SQL_Latin1_General_CP1_CI_AS AS DESCRIZIONEDOCUMENTO, 
AC.PREFISSO COLLATE SQL_Latin1_General_CP1_CI_AS AS PREFISSOCONT, 
'' COLLATE SQL_Latin1_General_CP1_CI_AS AS PREFISSODOC,
AC.FAMIGLIA COLLATE SQL_Latin1_General_CP1_CI_AS AS FAMIGLIA,
'' COLLATE SQL_Latin1_General_CP1_CI_AS AS BIS,
'' COLLATE SQL_Latin1_General_CP1_CI_AS AS MODULOSTAMPA,
ISNULL(DSCCONTO1,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS RAGIONESOCIALE,
ISNULL(INDIRIZZO,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS INDIRIZZO,
ISNULL(CAP,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS CAP,
ISNULL(LOCALITA,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS LOCALITA,
ISNULL(PROVINCIA,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS PROVINCIA,
ISNULL(PARTITAIVA,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS PARTITAIVA,
ISNULL(CODFISCALE,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS CODFISCALE,
TESTECONTABILITA.PROGRESSIVO,
'' COLLATE SQL_Latin1_General_CP1_CI_AS AS TIPOLOGIADOC,
ISNULL(AC.SUFFISSO,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS SUFFISSO,
'' COLLATE SQL_Latin1_General_CP1_CI_AS AS CODAGENTE1,
'' COLLATE SQL_Latin1_General_CP1_CI_AS AS DSCAGENTE1,
'' COLLATE SQL_Latin1_General_CP1_CI_AS AS ANNOTAZIONI,
AC.INTRA,
ISNULL(RIGHEIVA.TIPOREGISTRO,0) AS TIPOREGISTRO,
'' COLLATE SQL_Latin1_General_CP1_CI_AS AS IDTRASMITTENTE, 
'' COLLATE SQL_Latin1_General_CP1_CI_AS AS IDPROGRESSIVOUNIVOCO,
ISNULL(TESTECONTABILITA.CODICECIG,'') COLLATE SQL_Latin1_General_CP1_CI_AS CODICECIG,
ISNULL(TESTECONTABILITA.CODICECUP,'') COLLATE SQL_Latin1_General_CP1_CI_AS CODICECUP,
AVP.*
FROM
CAUSALICONTABILI 
INNER JOIN TESTECONTABILITA ON CAUSALICONTABILI.CODICECAUSALE = TESTECONTABILITA.CAUSALE 
INNER JOIN ADIGEST_CONTABILITA AC ON CAUSALICONTABILI.CODICECAUSALE = AC.CODICE
LEFT OUTER JOIN TIPOREGISTROIVA ON CAUSALICONTABILI.NRREGISTRO=TIPOREGISTROIVA.CODICE
LEFT OUTER JOIN RIGHEIVA ON RIGHEIVA.NRREG=PROGRESSIVO 
--AND RIGHEIVA.NRRIGA=1 
AND RIGHEIVA.TIPOREGISTRO<>TIPOREGISTROIVA.CODICE
LEFT OUTER JOIN RIGHECONTABILITA RC ON TESTECONTABILITA.PROGRESSIVO=RC.NRREG AND RC.NRRIGA=1 
LEFT OUTER JOIN ANAGRAFICACF CF ON RC.CONTO COLLATE SQL_Latin1_General_CP1_CI_AS = CF.CODCONTO COLLATE SQL_Latin1_General_CP1_CI_AS
LEFT OUTER JOIN ALDEBRA_VISTADOCUMENTALE_PERS AVP ON (AC.PREFISSO + '-' + RIGHT('00000000' + LTRIM(RTRIM(CAST(PROGRESSIVO AS VARCHAR(8)))), 8)+ ISNULL(AC.SUFFISSO,'')) COLLATE SQL_Latin1_General_CP1_CI_AS = AVP.KEYUNIQUE_PERS COLLATE SQL_Latin1_General_CP1_CI_AS
-- INSERITA WHERE PER ESCLUDERE MOVIMENTI CONTABILI DERIVANTI DA DOCUMENTI
WHERE ISNULL(IDTESTADOC,0)=0 AND ISNULL(AC.INTRA,0)=1



GO
GRANT SELECT
    ON OBJECT::[dbo].[ALDEBRA_VISTADOCUMENTALE] TO [Metodo98]
    AS [dbo];

