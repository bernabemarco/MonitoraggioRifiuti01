﻿
CREATE VIEW VISTAMOVORDINI AS
SELECT
	1 AS TIPOMOV,
	(SELECT DATAMOV FROM STORICOMOVPROD WHERE STORICOMOVPROD.PROGRESSIVO = RIFPROGRESSIVO) AS DATASESSIONE,
	(SELECT ESERCIZIO FROM STORICOMOVPROD WHERE STORICOMOVPROD.PROGRESSIVO = RIFPROGRESSIVO) AS ESERCIZIOSESSIONE,
	((select TIPOCOM from TESTEORDINIPROD where TESTEORDINIPROD.PROGRESSIVO=RIFTESTA) + '/'
	+ ltrim(str((select ESERCIZIO from TESTEORDINIPROD where TESTEORDINIPROD.PROGRESSIVO=RIFTESTA))) + '/'
	+ ltrim(str((select NUMEROCOM from TESTEORDINIPROD where TESTEORDINIPROD.PROGRESSIVO=RIFTESTA))) 
	) AS RIFCOMMESSA,
	RIFPROGRESSIVO,
	RIGAMOVORD,
	0 AS RIGAMOVIMP,
	RIGAMOVORD AS NUMMOV,
	POSIZIONE,
	RIFTESTA AS IDTESTA,
	RIFRIGA AS IDRIGA,
	0 AS IDIMPEGNO,
	(select TIPOCOM from TESTEORDINIPROD where TESTEORDINIPROD.PROGRESSIVO=RIFTESTA) as TIPOCOM,
	(select ESERCIZIO from TESTEORDINIPROD where TESTEORDINIPROD.PROGRESSIVO=RIFTESTA) as ESERCIZIO,
	(select NUMEROCOM from TESTEORDINIPROD where TESTEORDINIPROD.PROGRESSIVO=RIFTESTA) as NUMEROCOM,
	(select DATAEMISSIONE from TESTEORDINIPROD where TESTEORDINIPROD.PROGRESSIVO=RIFTESTA) as DATAEMISSIONE,
	CODART,
	(SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE = CODART) AS DESCRART,
	QTAMOVGESTIONE,
	UMGEST,
	QTAMOVPREZZO,
	UMPREZZO,
	QTAMOV1MAG,
	QTAMOV2MAG,
	UMSCARTO,
	QTAMOVSCARTO,
	PARTITAASSEGNATA,
	CODCLIDEST,
	CAUSALEMOV,
	DEPOSITO,
	UBICAZIONE,
	CONTOCDC,
	CAUSALEMOVCOLL,
	DEPOSITOCOLL,
	UBICAZIONECOLL,
	CONTOCDCCOLL,
	CAUSALESCARTO,
	DEPOSITOSCARTO,
	UBICAZIONESCARTO,
	CONTOCDCSCARTO,
	COSTOUNITMOV,
	COSTOTOTMOV,
	COSTOUNITMOVEURO,
	COSTOTOTMOVEURO,
	NOTE,
	COSTOMATERIALE,
	COSTOMATERIALEEURO,
	COSTOLAVINTERNA,
	COSTOLAVINTERNAEURO,
	COSTOLAVESTERNA,
	COSTOLAVESTERNAEURO,
	COSTOINDIRETTO,
	COSTOINDIRETTOEURO,
	CODFORDEST,
	RIFCOMMCLI,
	UM1MAG,
	UM2MAG,
	IDCOSTOPRODOTTO,
	(SELECT TipoOrdine FROM ParametriOrdProd WHERE CODICE = (SELECT CodiceOrd FROM RigheOrdProd WHERE RigheOrdProd.IDTesta=RifTesta AND RigheOrdProd.IDRiga=RifRiga)) AS TipoOrd,
	(SELECT Codice FROM ParametriOrdProd WHERE Codice = (SELECT CodiceOrd FROM RigheOrdProd WHERE RigheOrdProd.IDTesta=RifTesta AND RigheOrdProd.IDRiga=RifRiga)) AS CodiceOrd
FROM
	STORICOMOVORDPROD UNION
SELECT
	-1 AS TIPOMOV,
	(SELECT DATAMOV FROM STORICOMOVPROD WHERE STORICOMOVPROD.PROGRESSIVO = RIFPROGRESSIVO) AS DATASESSIONE,
	(SELECT ESERCIZIO FROM STORICOMOVPROD WHERE STORICOMOVPROD.PROGRESSIVO = RIFPROGRESSIVO) AS ESERCIZIOSESSIONE,
	((select TIPOCOM from TESTEORDINIPROD where TESTEORDINIPROD.PROGRESSIVO=RIFTESTA) + '/'
	+ ltrim(str((select ESERCIZIO from TESTEORDINIPROD where TESTEORDINIPROD.PROGRESSIVO=RIFTESTA))) + '/'
	+ ltrim(str((select NUMEROCOM from TESTEORDINIPROD where TESTEORDINIPROD.PROGRESSIVO=RIFTESTA))) + '/'
	) AS RIFCOMMESSA, 
	RIFPROGRESSIVO,
	RIGAMOVORD,
	RIGAMOVIMP,
	RIGAMOVIMP AS NUMMOV,
	POSIZIONE,
	RIFTESTA AS IDTESTA,
	RIFRIGA AS IDRIGA,
	RIFIMPEGNO AS IDIMPEGNO,
	(select TIPOCOM from TESTEORDINIPROD where TESTEORDINIPROD.PROGRESSIVO=RIFTESTA) as TIPOCOM,
	(select ESERCIZIO from TESTEORDINIPROD where TESTEORDINIPROD.PROGRESSIVO=RIFTESTA) as ESERCIZIO,
	(select NUMEROCOM from TESTEORDINIPROD where TESTEORDINIPROD.PROGRESSIVO=RIFTESTA) as NUMEROCOM,
	(select DATAEMISSIONE from TESTEORDINIPROD where TESTEORDINIPROD.PROGRESSIVO=RIFTESTA) as DATAEMISSIONE,
	CODART,
	(SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE = CODART) AS DESCRART,
	QTAMOVGESTIONE,
	UMGEST,
	QTAMOVPREZZO,
	UMPREZZO,
	QTAMOV1MAG,
	QTAMOV2MAG,
	UMSCARTO,
	QTAMOVSCARTO,
	PARTITAASSEGNATA,
	'' AS CODCLIDEST,
	CAUSALEMOV,
	DEPOSITO,
	UBICAZIONE,
	CONTOCDC,
	CAUSALEMOVCOLL,
	DEPOSITOCOLL,
	UBICAZIONECOLL,
	CONTOCDCCOLL,
	CAUSALESCARTO,
	DEPOSITOSCARTO,
	UBICAZIONESCARTO,
	CONTOCDCSCARTO,
	COSTOUNITMOV,
	COSTOTOTMOV,
	COSTOUNITMOVEURO,
	COSTOTOTMOVEURO,
	NOTE,
	COSTOTOTMOV AS COSTOMATERIALE,
	COSTOTOTMOVEURO AS COSTOMATERIALEEURO,
	0 AS COSTOLAVINTERNA,
	0 AS COSTOLAVINTERNAEURO,
	0 AS COSTOLAVESTERNA,
	0 AS COSTOLAVESTERNAEURO,
	0 AS COSTOINDIRETTO,
	0 AS COSTOINDIRETTOEURO,
	CODFORPREL AS CODFORDEST,
	RIFCOMMCLI,
	UM1MAG,
	UM2MAG,
	'' AS IDCOSTOPRODOTTO,
	(SELECT TipoOrdine FROM ParametriOrdProd WHERE CODICE = (SELECT CodiceOrd FROM RigheOrdProd WHERE RigheOrdProd.IDTesta=RifTesta AND RigheOrdProd.IDRiga=RifRiga)) AS TipoOrd,
	(SELECT Codice FROM ParametriOrdProd WHERE Codice = (SELECT CodiceOrd FROM RigheOrdProd WHERE RigheOrdProd.IDTesta=RifTesta AND RigheOrdProd.IDRiga=RifRiga)) AS CodiceOrd
FROM
	STORICOMOVIMPPROD

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAMOVORDINI] TO [Metodo98]
    AS [dbo];

