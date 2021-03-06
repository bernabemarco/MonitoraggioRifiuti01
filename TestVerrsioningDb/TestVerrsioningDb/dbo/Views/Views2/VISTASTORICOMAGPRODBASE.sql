﻿CREATE VIEW VISTASTORICOMAGPRODBASE AS 
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
	STMAG.DATADISP,
	STMAG.DATARIFDOC,
	STMAG.DESTDIV,
	STMAG.GENVENACQ,
	STMAG.IDDISTINTABASE,
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
	(CASE WHEN STMAG.TIPOMOV between 5 and 8 then STMAG.IDTESTA else (select RIFTESTA from STORICOMOVPROD where STORICOMOVPROD.PROGRESSIVO=STMAG.IDTESTA) end) as IDTESTA,
	(CASE WHEN STMAG.TIPOMOV between 5 and 8 then STMAG.RIGADOC else (select RIFRIGA from STORICOMOVORDPROD where STORICOMOVORDPROD.RIFPROGRESSIVO=STMAG.IDTESTA and STORICOMOVORDPROD.RIGAMOVORD=STMAG.RIGADOC) end) as IDRIGA,
	(CASE WHEN STMAG.TIPOMOV between 5 and 8 then STMAG.RIGACOMP else (select RIFIMPEGNO from STORICOMOVIMPPROD where STORICOMOVIMPPROD.RIFPROGRESSIVO=STMAG.IDTESTA and STORICOMOVIMPPROD.RIGAMOVORD=STMAG.RIGADOC and STORICOMOVIMPPROD.RIGAMOVIMP=STMAG.RIGACOMP) end) as IDIMPEGNO,
	STMAG.RIGACOMP,
	STMAG.RIGADOC,
	STMAG.SCONTO,
	STMAG.TIPODOC,
	STMAG.TIPOMOV,
	STMAG.VALCAMBIO,
	STMAG.VARIANTE,
	STMAG.ESERCIZIO,
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
	(STMAG.IMPORTOTOTNETTO*STMAG.VALORECARICO) AS VALORECARICO,
	(STMAG.IMPORTOTOTNETTOEURO*STMAG.VALORECARICO) AS VALORECARICOEURO,
	(STMAG.IMPORTOTOTNETTO*STMAG.VALORESCARICO) AS VALORESCARICO,
	(STMAG.IMPORTOTOTNETTOEURO*STMAG.VALORESCARICO) AS VALORESCARICOEURO,
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
	(CASE WHEN CHARINDEX('#',STMAG.CODART)>0 THEN AA.CODICEPRIMARIO ELSE STMAG.CODART END) AS CODARTICOLOBASE
	FROM STORICOMAG STMAG,ANAGRAFICADEPOSITI,TABCAUSALIMAG CAUMAG,ANAGRAFICACF AC,ANAGRAFICARISERVATICF ACR,ANAGRAFICAARTICOLI AA
	WHERE (STMAG.CODCAUSALE=CAUMAG.CODICE) AND (STMAG.CODCLIFOR=AC.CODCONTO)
	AND ACR.CODCONTO=STMAG.CODCLIFOR 
	AND ACR.ESERCIZIO=STMAG.ESERCIZIO 
	AND (STMAG.CODART=AA.CODICE) 
	AND (ANAGRAFICADEPOSITI.CODICE=STMAG.CODDEPOSITO) 	
	AND STMAG.TIPOMOV in (5,6,7,8,9,10,11,12,17,18,19,20)

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTASTORICOMAGPRODBASE] TO [Metodo98]
    AS [dbo];

