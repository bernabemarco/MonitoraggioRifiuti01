﻿
CREATE VIEW VISTAANAGRAFICAARTICOLI AS
SELECT ART.CODICE, ART.DESCRIZIONE, ART.GRUPPO, 
    ART.CATEGORIA, ART.CODCATEGORIASTAT, 
    ART.PESONETTO, ART.SUPERFICIE, ART.CUBATURA, 
    ART.NOMENCLCOMBINATA1, 
    ART.NOMENCLCOMBINATA2, 
    ART.CODICEARTIMBALLO, ART.AGGIORNAMAG, 
    ART.RIFERIMIMBALLO,ART.ORIGINEINTRA, ART.NRPEZZIIMBALLO, 
    ART.MOVIMENTAPARTITE, 
    ART.MOVIMENTAMATRICOLE, ART.CODDEPOSITO, 
    ART.VARESPLICITE, ART.CODICEPRIMARIO, 
    ART.ARTTIPOLOGIA, COMM.CODIVA, COMM.SCONTO1,
    ART.DESCRESTESA,
    (SELECT UM FROM ARTICOLIUMPREFERITE WHERE CODART=ART.CODICE AND TIPOUM=1) AS UM1,
    (SELECT UM FROM ARTICOLIUMPREFERITE WHERE CODART=ART.CODICE AND TIPOUM=2) AS UM2,    
    COMM.SCONTO2, COMM.SCONTO3, 
    COMM.GRUPPOPRZPART, COMM.GRUPPOPRVPART, 
    COMM.PROVV, COMM.BARCODE, 
    COMM.BARCODETYPE, COMM.BARCODESTRING, 
    COMM.CODICEALT1, COMM.CODICEALT2, 
    COMM.SCGENVENDITEITA, 
    COMM.SCGENVENDITEEST, 
    COMM.SCGENACQUISTIITA, 
    COMM.SCGENACQUISTIEST, COMM.INESAURIMENTO, 
    COMM.ESAURITO, COMM.QTAMINCONS, COMM.FLAGCAUZIONI, 
    COMM.USAPREZZIPART, PROD.SCORTAMIN, 
    COMM.FLGBARCODEGENDAPROCAUTOMSTD,
    COMM.AICFARMACO,
    COMM.UMFARMACO,
	COMM.TIPOCARBURANTE,
    PROD.SCORTAMAX, PROD.LIVPRODUZIONE, 
    PROD.RAGGRPRODUZIONE, PROD.LIVPRODPREC, 
    PROD.TIPOGESTIONE, PROD.LIVRIORDINO, 
    PROD.PROVENIENZA, PROD.ARTALTERNATIVO, 
    PROD.QMINRIORDACQ, PROD.QMAXRIORDACQ, 
    PROD.QDELTARIORDACQ, PROD.TAPPRONTACQ, 
    PROD.TAPPROVVACQ, PROD.LOTTORIFACQ, PROD.UMLOTTOACQ,
    PROD.ARROTLOTTOACQ, PROD.FORNPREFACQ, 
    PROD.QMINRIORDPROD, PROD.QMAXRIORDPROD, 
    PROD.QDELTARIORDPROD, PROD.TAPPRONTPROD, 
    PROD.TAPPROVVPROD, PROD.LOTTORIFPROD, PROD.UMLOTTOPROD,
    PROD.ARROTLOTTOPROD, PROD.QMINRIORDLAV, 
    PROD.QMAXRIORDLAV, PROD.QDELTARIORDLAV, 
    PROD.TAPPRONTLAV, PROD.TAPPROVVLAV, 
    PROD.LOTTORIFLAV, PROD.UMLOTTOLAV, PROD.ARROTLOTTOLAV, 
    PROD.FORNPREFLAV, PROD.LOTTORIORDINO, PROD.TIPOPRODUZIONE,
    PROD.GRUPPOAPPROV,PROD.COSTOORDINEACQ,PROD.COSTOORDINELAV,
    PROD.COSTOORDINEPROD,PROD.FATTORESCOSTAMENTO,PROD.TEMPOCOPERTURA,
    PROD.CONSUMOPREVISTO,PROD.MADPREVISTO,PROD.FATTORESICUREZZA,PROD.TIPOPRODOTTO,PROD.GESTIONEMATERIALI,
    PROD.FLAGMPS,PROD.FLOORSTOCK,PROD.GRUPPOPREVISIONE,
    PROD.INTERVALLOPIANIF,PROD.GGORIZZONTEDISP,
    ART.FLGSISTRI
FROM 
    ANAGRAFICAARTICOLI ART INNER JOIN ANAGRAFICAARTICOLICOMM COMM ON 
        ART.CODICE = COMM.CODICEART INNER JOIN ANAGRAFICAARTICOLIPROD PROD ON 
        ART.CODICE = PROD.CODICEART
WHERE (COMM.ESERCIZIO =(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = CAST(USER_NAME() AS VARCHAR(25)))) AND 
      (PROD.ESERCIZIO =(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = CAST(USER_NAME() AS VARCHAR(25))))
GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAANAGRAFICAARTICOLI] TO [Metodo98]
    AS [dbo];

