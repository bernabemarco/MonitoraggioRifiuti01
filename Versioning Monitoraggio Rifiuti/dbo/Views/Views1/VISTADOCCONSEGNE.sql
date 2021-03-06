﻿CREATE VIEW VISTADOCCONSEGNE AS
SELECT 0 AS TIPODEPOSITO,
    TD.PROGRESSIVO AS IDTESTA,
    TD.ESERCIZIO,
    TD.TIPODOC,
    TD.NUMERODOC,
    TD.BIS,
    TD.DATADOC,
    TD.DOCCHIUSO,
    TD.BLOCCATO,
    TD.CODCLIFOR,
    TD.CODCFFATT,
    (SELECT DSCCONTO1 FROM ANAGRAFICACF AS AX WHERE TD.CODCLIFOR=AX.CODCONTO) AS RAGSOCCLI,
    TD.NUMRIFDOC,
    TD.DATARIFDOC,
    TD.CODAGENTE1,
    TD.CODAGENTE2,
    TD.CODAGENTE3,
    TD.NUMDESTDIVERSAMERCI,
    ARCF.CODCATEGORIA,
    RD.IDRIGA,
    RD.CODART,
	 AAP.GESTIONEMATERIALI,
	 AAP.TIPOGESTIONE,
    RD.CODDEPOSITO,
    (CASE WHEN RD.UBICAZIONE IS NULL THEN '' ELSE RD.UBICAZIONE END) AS UBICAZIONE,
    (CASE WHEN RD.NRRIFPARTITA IS NULL THEN '' ELSE RD.NRRIFPARTITA  END) AS NRRIFPARTITA,
	 RD.RIFCOMMCLI,
    RD.TIPORIGA,
    RD.VARIANTI,
    RD.DATACONSEGNA,
    RD.DATACONSEGNARICHIESTA,
    ARCF.CODSETTORE,
    AA.GRUPPO,
    AA.DESCRIZIONE,
    ACF.DSCCONTO1,
    RD.UMGEST AS UM,
    RD.QTAGEST AS QTA1DOC,
    RD.QTAGESTRES AS QTA1RESIDUA,
    (RD.QTAGEST*AFC.FATTORE) AS QTA1DOCBASE,
    (RD.QTAGESTRES*AFC.FATTORE) AS QTA1RESIDUABASE,
    (SELECT CODICE FROM TABNAZIONI WHERE ACF.CODNAZIONE=TABNAZIONI.CODICE) AS NAZIONE,
    (SELECT CODICE FROM TABZONE WHERE ARCF.CODZONA=TABZONE.CODICE) AS ZONA,
    (SELECT UM FROM ARTICOLIUMPREFERITE WHERE CODART=RD.CODART AND TIPOUM=1) AS UMBASE,
    RD.RIFRELAZIONECF
FROM ((((((TESTEDOCUMENTI AS TD JOIN PARAMETRIDOC AS PD ON TD.TIPODOC=PD.CODICE) JOIN
    ANAGRAFICACF AS ACF ON TD.CODCLIFOR=ACF.CODCONTO) JOIN
    ANAGRAFICARISERVATICF AS ARCF ON TD.CODCLIFOR=ARCF.CODCONTO AND TD.ESERCIZIO=ARCF.ESERCIZIO) JOIN
    (RIGHEDOCUMENTI AS RD LEFT OUTER JOIN ANAGRAFICAARTICOLI AS AA ON AA.CODICE=RD.CODART)
    ON TD.PROGRESSIVO=RD.IDTESTA) join
    ARTICOLIFATTORICONVERSIONE AFC on AA.CODICE=AFC.CODART)  
	 LEFT JOIN ANAGRAFICAARTICOLIPROD AS AAP ON AA.CODICE=AAP.CODICEART)
WHERE AFC.UM1 = RD.UMGEST AND AFC.UM2 = (SELECT UM FROM ARTICOLIUMPREFERITE WHERE CODART=RD.CODART AND TIPOUM=1)
	AND AAP.ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = CAST(USER_NAME() AS VARCHAR(25)))

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTADOCCONSEGNE] TO [Metodo98]
    AS [dbo];

