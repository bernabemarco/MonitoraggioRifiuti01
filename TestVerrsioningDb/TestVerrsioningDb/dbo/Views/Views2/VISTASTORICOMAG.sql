﻿CREATE VIEW VISTASTORICOMAG AS 
	SELECT STMAG.BIS,
	STMAG.CODART,
	AA.DESCRIZIONE AS DSCART,
	STMAG.CODCAMBIO,
	STMAG.CODCAUSALE,
	STMAG.CODCLIFOR,
	AC.DSCCONTO1,
	ACR.CODAGENTE1,
	ACR.CODAGENTE2,
	ACR.CODAGENTE3,
	ACR.CODZONA,
	ACR.CODSETTORE,
	ACR.CODCATEGORIA AS CODCATEGORIACF,
	AA.GRUPPO,
	AA.CATEGORIA AS CATEGORIAART,
	AA.CODCATEGORIASTAT AS CODCATEGORIASTAT,
	AA.VARESPLICITE,
	CAUMAG.NRGIORNALE,
	ANAGRAFICADEPOSITI.TIPODEPOSITO,
	ANAGRAFICADEPOSITI.DISPONIBILE,
	STMAG.CODCOMMESSA,
	STMAG.CODDEPOSITO,
	STMAG.CODPAG,
	STMAG.CODUBICAZIONE,
	STMAG.CONTOCDCMOV,
	STMAG.DATAMOV,
	STMAG.DATARIFDOC,
	STMAG.DATADISP,
	STMAG.DESTDIV,
	STMAG.GENVENACQ,
	STMAG.IDDISTINTABASE,
	STMAG.IDTESTA,
	STMAG.IMPORTOTOTLORDO,
	STMAG.IMPORTOTOTLORDOEURO,
	STMAG.IMPORTOTOTLORDOVAL,
	(CASE WHEN TVG.INCLUDISPRIP=0 THEN STMAG.IMPORTOTOTNETTO ELSE STMAG.IMPORTOTOTNETTO+STMAG.SPESERIPMAG END) AS IMPORTOTOTNETTO,
	(CASE WHEN TVG.INCLUDISPRIP=0 THEN STMAG.IMPORTOTOTNETTOEURO ELSE STMAG.IMPORTOTOTNETTOEURO+STMAG.SPESERIPMAGEURO END) AS IMPORTOTOTNETTOEURO,
	(CASE WHEN TVG.INCLUDISPRIP=0 THEN STMAG.IMPORTOTOTNETTOVAL ELSE STMAG.IMPORTOTOTNETTOVAL+STMAG.SPESERIPMAGVAL END) AS IMPORTOTOTNETTOVAL,
	STMAG.LISTINO,
	STMAG.NRIFDOC,
	STMAG.NRIFPARTITA,
	STMAG.NUMERODOC,
	STMAG.PROGRCOLLEGATO,
	STMAG.PROGRESSIVO,
	STMAG.QTA1UM,
	STMAG.QTA2UM,
	STMAG.RIFERIMENTI,
	STMAG.RIGACOMP,
	STMAG.RIGADOC,
	STMAG.SCONTO,
	STMAG.TIPODOC,
	STMAG.TIPOMOV,
	STMAG.VALCAMBIO,
	STMAG.VARIANTE,
	STMAG.ESERCIZIO,
   STMAG.PROGMOVVBANCO,
	AFC.UM1 AS FCUM1,
	AFC.UM2 AS FCUM2,
	AFC.FATTORE,
	AFC.FORMULAFC,
	(CASE WHEN STMAG.RESO = 1 THEN -1 ELSE 1 END) AS SEGNORESO,
	(SELECT UM FROM ARTICOLIUMPREFERITE AUM WHERE STMAG.CODART=AUM.CODART AND AUM.TIPOUM=1)  AS UM1,
	(SELECT UM FROM ARTICOLIUMPREFERITE AUM WHERE STMAG.CODART=AUM.CODART AND AUM.TIPOUM=2)  AS UM2,
	(CASE WHEN (STMAG.ORDINATO<>0 OR STMAG.IMPEGNATO<>0 OR STMAG.ORDINATO2UM<>0 OR STMAG.IMPEGNATO2UM<>0) THEN 1 ELSE  0  END) AS MOVORDIMP,
	(STMAG.QTA1UM*STMAG.ORDINATO) AS ORDINATO,
	(STMAG.QTA1UM*STMAG.IMPEGNATO) AS IMPEGNATO,
	(STMAG.QTA2UM*STMAG.ORDINATO2UM) AS ORDINATO2UM,
	(STMAG.QTA2UM*STMAG.IMPEGNATO2UM) AS IMPEGNATO2UM,
	(STMAG.QTA1UM*STMAG.QUANTITACARICO) AS QTACARICO,
	(STMAG.QTA1UM*STMAG.QUANTITASCARICO) AS QTASCARICO,
        ((CASE WHEN TVG.INCLUDISPRIP=0 THEN STMAG.IMPORTOTOTNETTO ELSE STMAG.IMPORTOTOTNETTO+STMAG.SPESERIPMAG END)*STMAG.VALORECARICO) AS VALORECARICO,
        ((CASE WHEN TVG.INCLUDISPRIP=0 THEN STMAG.IMPORTOTOTNETTO ELSE STMAG.IMPORTOTOTNETTO+STMAG.SPESERIPMAG END)*STMAG.VALORESCARICO) AS VALORESCARICO,
        ((CASE WHEN TVG.INCLUDISPRIP=0 THEN STMAG.IMPORTOTOTNETTOEURO ELSE STMAG.IMPORTOTOTNETTOEURO+STMAG.SPESERIPMAGEURO END)*STMAG.VALORECARICO) AS VALORECARICOEURO,
        ((CASE WHEN TVG.INCLUDISPRIP=0 THEN STMAG.IMPORTOTOTNETTOEURO ELSE STMAG.IMPORTOTOTNETTOEURO+STMAG.SPESERIPMAGEURO END)*STMAG.VALORESCARICO) AS VALORESCARICOEURO,
        (CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END) AS CARICO,
        (CASE WHEN STMAG.GIACENZA2UM=1 and STMAG.RESO = 0 THEN STMAG.QTA2UM ELSE 0 END) AS CARICO2UM,
        (CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END) AS SCARICO,
        (CASE WHEN STMAG.GIACENZA2UM=-1 and STMAG.RESO = 0 THEN STMAG.QTA2UM ELSE 0 END) AS SCARICO2UM,
        (CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END) AS RESODACARICO,
        (CASE WHEN STMAG.GIACENZA2UM=-1 and STMAG.RESO = 1 THEN STMAG.QTA2UM ELSE 0 END) AS RESODACARICO2UM,
        (CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END) AS RESODASCARICO,
        (CASE WHEN STMAG.GIACENZA2UM=1 and STMAG.RESO = 1 THEN STMAG.QTA2UM ELSE 0 END) AS RESODASCARICO2UM,
	((CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END)-
		(CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END)+
		(CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END)-
		(CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END)) AS GIACENZA,
	((CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END)-
		(CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END)+
		(CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END)-
		(CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END)+
		(STMAG.QTA1UM*STMAG.ORDINATO)-(STMAG.QTA1UM*STMAG.IMPEGNATO)) AS DISPONIBILITA,
	((CASE WHEN STMAG.GIACENZA2UM=1 and STMAG.RESO = 0 THEN STMAG.QTA2UM ELSE 0 END)-
		(CASE WHEN STMAG.GIACENZA2UM=-1 and STMAG.RESO = 0 THEN STMAG.QTA2UM ELSE 0 END)+
		(CASE WHEN STMAG.GIACENZA2UM=1 and STMAG.RESO = 1 THEN STMAG.QTA2UM ELSE 0 END)-
		(CASE WHEN STMAG.GIACENZA2UM=-1 and STMAG.RESO = 1 THEN STMAG.QTA2UM ELSE 0 END)) AS GIACENZA2UM,
	((CASE WHEN STMAG.GIACENZA2UM=1 and STMAG.RESO = 0 THEN STMAG.QTA2UM ELSE 0 END)-
		(CASE WHEN STMAG.GIACENZA2UM=-1 and STMAG.RESO = 0 THEN STMAG.QTA2UM ELSE 0 END)+
		(CASE WHEN STMAG.GIACENZA2UM=1 and STMAG.RESO = 1 THEN STMAG.QTA2UM ELSE 0 END)-
		(CASE WHEN STMAG.GIACENZA2UM=-1 and STMAG.RESO = 1 THEN STMAG.QTA2UM ELSE 0 END)+
		(STMAG.QTA2UM*STMAG.ORDINATO2UM)-(STMAG.QTA2UM*STMAG.IMPEGNATO2UM)) AS DISPONIBILITA2UM,
	(CASE WHEN CHARINDEX('#',STMAG.CODART)>0 THEN AA.CODICEPRIMARIO ELSE STMAG.CODART END) AS CODARTICOLOBASE,
	(SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE=(CASE WHEN CHARINDEX('#',STMAG.CODART)>0 THEN AA.CODICEPRIMARIO ELSE STMAG.CODART END)) AS DSCARTICOLOBASE
	FROM STORICOMAG STMAG,ANAGRAFICADEPOSITI,TABCAUSALIMAG CAUMAG,ANAGRAFICACF AC,ANAGRAFICARISERVATICF ACR,ANAGRAFICAARTICOLI AA,ARTICOLIFATTORICONVERSIONE AFC, TABUTENTI, TABVINCOLIGIC TVG  
	WHERE (STMAG.CODCAUSALE=CAUMAG.CODICE) AND (STMAG.CODCLIFOR=AC.CODCONTO)
	AND ACR.CODCONTO=STMAG.CODCLIFOR 
	AND ACR.ESERCIZIO=STMAG.ESERCIZIO 
	AND (STMAG.CODART=AA.CODICE) 
	AND (ANAGRAFICADEPOSITI.CODICE=STMAG.CODDEPOSITO) 
	AND (STMAG.CODART=AFC.CODART AND (SELECT UM FROM ARTICOLIUMPREFERITE AUM WHERE STMAG.CODART=AUM.CODART AND AUM.TIPOUM=1)=AFC.UM1)
	AND STMAG.ESERCIZIO=TVG.ESERCIZIO
    AND USERDB = CAST(USER_NAME() AS VARCHAR(25)) AND (SUPERVISOR = 1 OR 
    	(SUPERVISOR = 0 AND USERID IN (SELECT NOMEUTENTE FROM ACCESSICAUSMAG WHERE CODCAUMAG = STMAG.CODCAUSALE AND FLAGVISUALIZZA=1)))
    AND ((STMAG.CODCLIFOR=TABUTENTI.CODCLIFOR) OR (TABUTENTI.CODCLIFOR=''))

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTASTORICOMAG] TO [Metodo98]
    AS [dbo];

