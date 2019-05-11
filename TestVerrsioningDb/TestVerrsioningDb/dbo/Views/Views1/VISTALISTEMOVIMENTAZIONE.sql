﻿CREATE VIEW VISTALISTEMOVIMENTAZIONE AS
SELECT 
	TESTELISTAMOV.ESERCIZIO,TESTELISTAMOV.CODICELISTA,
	(select TIPOLISTA from PARAMETRILISTEPROD where PARAMETRILISTEPROD.CODICE=TESTELISTAMOV.CODICELISTA) as TIPOLISTA,
	TESTELISTAMOV.NUMEROLISTA,TESTELISTAMOV.DATAEMISSIONE,TESTELISTAMOV.STATOCHIUSO,TESTELISTAMOV.NOTE,
	RIGHELISTAMOV.IDTESTA,RIGHELISTAMOV.IDRIGA,RIGHELISTAMOV.RIFTESTACOMM,RIGHELISTAMOV.RIFRIGAORD,RIGHELISTAMOV.RIFRIGAIMP,
	(select DATAEMISSIONE from TESTEORDINIPROD where TESTEORDINIPROD.PROGRESSIVO=RIGHELISTAMOV.RIFTESTACOMM) DATAEMISSIONECOM,
	(select CODICEORD from RIGHEORDPROD where RIGHEORDPROD.IDTESTA=RIGHELISTAMOV.RIFTESTACOMM and RIGHEORDPROD.IDRIGA=RIGHELISTAMOV.RIFRIGAORD) as CODICEORD,
	TESTEORDINIPROD.ESERCIZIO ANNOCOM,TESTEORDINIPROD.TIPOCOM,TESTEORDINIPROD.NUMEROCOM,RIGHELISTAMOV.RIFMOVSP,RIGHELISTAMOV.RIFMOVCOLLSP,
	RIGHELISTAMOV.CODART,ANAGRAFICAARTICOLI.DESCRIZIONE as DESCRIZIONEART,ANAGRAFICAARTICOLI.GRUPPO,ANAGRAFICAARTICOLI.CATEGORIA,ANAGRAFICAARTICOLI.VARESPLICITE,
	RIGHELISTAMOV.QTAMOVGESTIONE,RIGHELISTAMOV.UMGEST,RIGHELISTAMOV.QTAMOVPREZZO,RIGHELISTAMOV.UMPREZZO,RIGHELISTAMOV.QTAPREZZOMAN,
	RIGHELISTAMOV.QTAMOV1MAG,RIGHELISTAMOV.QTA1MAGMAN,RIGHELISTAMOV.QTA2MAGMAN,RIGHELISTAMOV.QTAMOV2MAG,RIGHELISTAMOV.UMSCARTO,RIGHELISTAMOV.QTAMOVSCARTO,
	VISTAARTICOLIUMBASE.UM1,VISTAARTICOLIUMBASE.UM2,RIGHELISTAMOV.SALDORIGA,RIGHELISTAMOV.PARTITAASSEGNATA,RIGHELISTAMOV.CODCLIFOR,
	(select DSCCONTO1 from ANAGRAFICACF where CODCONTO = CODCLIFOR) RAGSOCCLIFOR,RIGHELISTAMOV.CAUSALEMOV,RIGHELISTAMOV.DEPOSITO,RIGHELISTAMOV.UBICAZIONE,RIGHELISTAMOV.CONTOCDC,
	RIGHELISTAMOV.CAUSALEMOVCOLL,RIGHELISTAMOV.DEPOSITOCOLL,RIGHELISTAMOV.UBICAZIONECOLL,RIGHELISTAMOV.CONTOCDCCOLL,
	RIGHELISTAMOV.CAUSALESCARTO,RIGHELISTAMOV.DEPOSITOSCARTO,RIGHELISTAMOV.UBICAZIONESCARTO,RIGHELISTAMOV.CONTOCDCSCARTO,
	RIGHELISTAMOV.COSTOUNITMOV,RIGHELISTAMOV.COSTOTOTMOV,RIGHELISTAMOV.COSTOUNITMOVEURO,RIGHELISTAMOV.COSTOTOTMOVEURO,
	RIGHELISTAMOV.COSTOMATERIALE, RIGHELISTAMOV.COSTOMATERIALEEURO,RIGHELISTAMOV.COSTOLAVINTERNA, RIGHELISTAMOV.COSTOLAVINTERNAEURO,
	RIGHELISTAMOV.COSTOLAVESTERNA, RIGHELISTAMOV.COSTOLAVESTERNAEURO,RIGHELISTAMOV.COSTOINDIRETTO, RIGHELISTAMOV.COSTOINDIRETTOEURO,
	RIGHELISTAMOV.STATORIGA,RIGHELISTAMOV.NOTE as NOTERIGA,RIGHELISTAMOV.RIFCOMMCLI,RIGHELISTAMOV.DATAMOVIMENTO
FROM 
	((TESTELISTAMOV inner join 
		(RIGHELISTAMOV inner join ANAGRAFICAARTICOLI 
			on RIGHELISTAMOV.CODART=ANAGRAFICAARTICOLI.CODICE)
		on TESTELISTAMOV.PROGRESSIVO=RIGHELISTAMOV.IDTESTA)
		inner join VISTAARTICOLIUMBASE on RIGHELISTAMOV.CODART = VISTAARTICOLIUMBASE.CODICE)
	left outer join TESTEORDINIPROD 
		on TESTEORDINIPROD.PROGRESSIVO=RIGHELISTAMOV.RIFTESTACOMM

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTALISTEMOVIMENTAZIONE] TO [Metodo98]
    AS [dbo];
