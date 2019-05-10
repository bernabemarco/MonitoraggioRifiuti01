﻿CREATE VIEW VISTAMARGINESTORICO AS
SELECT STMAG.BIS,
	STMAG.CODART,
        AA.DESCRIZIONE AS DSCART,
        STMAG.CODCAMBIO,
        STMAG.CODCAUSALE,
        STMAG.CODCLIFOR,
        VISTACLIFOR.DSCCONTO1,
        VISTACLIFOR.CODAGENTE1,
        VISTACLIFOR.CODAGENTE2,
        VISTACLIFOR.CODAGENTE3,
        VISTACLIFOR.CODZONA,
        VISTACLIFOR.CODSETTORE,
        VISTACLIFOR.CODCATEGORIA AS CODCATEGORIACF,
        AA.GRUPPO,
        AA.CATEGORIA AS CATEGORIAART,
        AA.CODCATEGORIASTAT AS CODCATEGORIASTAT,
        AA.VARESPLICITE,
        CAUMAG.NRGIORNALE,
        STMAG.CODCOMMESSA,
        STMAG.CODDEPOSITO,
        (SELECT TIPODEPOSITO FROM ANAGRAFICADEPOSITI  AD WHERE AD.CODICE=STMAG.CODDEPOSITO) AS TIPODEPOSITO,
        STMAG.CODPAG,
        STMAG.CODUBICAZIONE,
        STMAG.CONTOCDCMOV,
        STMAG.DATAMOV,
        STMAG.DATARIFDOC,
        STMAG.DESTDIV,
        STMAG.GENVENACQ,
        STMAG.IDDISTINTABASE,
        STMAG.IDTESTA,
        STMAG.IMPORTOTOTLORDO,
        STMAG.IMPORTOTOTLORDOEURO,
        STMAG.IMPORTOTOTLORDOVAL,
        STMAG.IMPORTOTOTNETTO,
        STMAG.IMPORTOTOTNETTOEURO,
        STMAG.IMPORTOTOTNETTOVAL,
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
        AFC.UM1 AS FCUM1,
        AFC.UM2 AS FCUM2,
        AFC.FATTORE,
        AFC.FORMULAFC,
	(CASE WHEN STMAG.RESO = 1 THEN -1 ELSE 1 END) AS SEGNORESO,
        (SELECT UM FROM ARTICOLIUMPREFERITE AUM WHERE STMAG.CODART=AUM.CODART AND AUM.TIPOUM=1)  AS UM1,
        (SELECT UM FROM ARTICOLIUMPREFERITE AUM WHERE STMAG.CODART=AUM.CODART AND AUM.TIPOUM=2)  AS UM2,
        (CASE WHEN (STMAG.ORDINATO<>0 or STMAG.IMPEGNATO<>0 or STMAG.ORDINATO2UM<>0 or STMAG.IMPEGNATO2UM<>0) THEN 1 ELSE  0  END) as MOVORDIMP,
        (STMAG.QTA1UM*STMAG.ORDINATO) as ORDINATO,
        (STMAG.QTA1UM*STMAG.IMPEGNATO) as IMPEGNATO,
        (STMAG.QTA2UM*STMAG.ORDINATO2UM) as ORDINATO2UM,
        (STMAG.QTA2UM*STMAG.IMPEGNATO2UM) as IMPEGNATO2UM,
        (STMAG.QTA1UM*STMAG.QUANTITACARICO) as QTACARICO,
        (STMAG.QTA1UM*STMAG.QUANTITASCARICO) as QTASCARICO,
        (STMAG.IMPORTOTOTNETTO*STMAG.QTA1UM*STMAG.QUANTITACARICO) as VALORECARICO,
        (STMAG.IMPORTOTOTNETTO*STMAG.QTA1UM*STMAG.QUANTITASCARICO) as VALORESCARICO,
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
        (SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI AA WHERE AA.CODICE=(CASE WHEN CHARINDEX('#',STMAG.CODART)>0 THEN AA.CODICEPRIMARIO ELSE STMAG.CODART END)) as DSCARTICOLOBASE,
        (SELECT FORMULAFC FROM VISTAFATTORICONVERSIONE WHERE ((CODART=STMAG.CODART) AND (UMJOIN=AFC.UM2) AND (UMRIC=(SELECT UM FROM STORICOPREZZIARTICOLO WHERE ((CODARTICOLO=STMAG.CODART) AND (TIPOPREZZO='F')AND (DATA=(SELECT MAX(DATA) FROM STORICOPREZZIARTICOLO WHERE ((TIPOPREZZO='F') AND (CODARTICOLO=STMAG.CODART) AND(DATA<=STMAG.DATAMOV))))))))) as CONVPRZUNITSTORICO,
        (SELECT PREZZOLIRE FROM STORICOPREZZIARTICOLO WHERE ((CODARTICOLO=STMAG.CODART) AND (TIPOPREZZO='F')AND(DATA=(SELECT MAX(DATA) FROM STORICOPREZZIARTICOLO WHERE ((TIPOPREZZO='F') AND(CODARTICOLO=STMAG.CODART) AND (DATA<=STMAG.DATAMOV)))))) as PRZUNITSTORLIRE,
        (SELECT PREZZOEURO FROM STORICOPREZZIARTICOLO WHERE ((CODARTICOLO=STMAG.CODART) AND (TIPOPREZZO='F')AND(DATA=(SELECT MAX(DATA) FROM STORICOPREZZIARTICOLO WHERE ((TIPOPREZZO='F') AND(CODARTICOLO=STMAG.CODART) AND (DATA<=STMAG.DATAMOV)))))) as PRZUNITSTOREURO
FROM STORICOMAG STMAG,TABCAUSALIMAG CAUMAG,VISTACLIFOR,ANAGRAFICAARTICOLI AA,ARTICOLIFATTORICONVERSIONE AFC
WHERE (STMAG.CODCAUSALE=CAUMAG.CODICE) AND (STMAG.CODCLIFOR=VISTACLIFOR.CODCONTO)
        AND (STMAG.CODART=AA.CODICE)
        AND (STMAG.CODART=AFC.CODART AND (SELECT UM FROM ARTICOLIUMPREFERITE AUM WHERE STMAG.CODART=AUM.CODART AND AUM.TIPOUM=1)=AFC.UM1)

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAMARGINESTORICO] TO [Metodo98]
    AS [dbo];

