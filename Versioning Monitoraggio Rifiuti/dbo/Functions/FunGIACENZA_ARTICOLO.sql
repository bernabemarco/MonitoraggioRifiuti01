﻿
CREATE FUNCTION [dbo].[FunGIACENZA_ARTICOLO](@ARTICOLO nVARCHAR(50),
											  @ESERCIZIO INT,
											   @MAGAZZINO nVARCHAR(10))
RETURNS NUMERIC(19,6)
AS
BEGIN   

DECLARE @GIACENZAINIZIALE	AS NUMERIC(19,6)
DECLARE @GIACENZAATTUALE	AS NUMERIC(19,6)
DECLARE @GIACENZA			AS NUMERIC(19,6)
	
	SET @GIACENZA = 0

	SELECT 
		@GIACENZAINIZIALE = ISNULL(SUM(GIACENZAINIZIALE),0)
	FROM
	(
		SELECT 
			(CARICO - SCARICO - RESODACARICO + RESODASCARICO) AS GIACENZAINIZIALE
		FROM
		(
			SELECT
				STMAG.CODART,STMAG.CODDEPOSITO,STMAG.ESERCIZIO,
				SUM((CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END)) AS CARICO,
				SUM((CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END)) AS SCARICO,
				SUM((CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END)) AS RESODACARICO,
				SUM((CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END)) AS RESODASCARICO,
				AUM.UM
			FROM STORICOMAG AS STMAG 
			INNER JOIN TABVINCOLIGIC AS TVG ON STMAG.ESERCIZIO=TVG.ESERCIZIO
			INNER JOIN ANAGRAFICAARTICOLI ART ON ART.CODICE=STMAG.CODART
			INNER JOIN ARTICOLIUMPREFERITE AUM ON AUM.CODART=STMAG.CODART AND AUM.TIPOUM=1
			WHERE 	
					STMAG.CODART = @ARTICOLO AND 
					STMAG.CODDEPOSITO = @MAGAZZINO AND 
					STMAG.DataMov < (SELECT DATAINIMAG FROM TABESERCIZI WHERE CODICE = @Esercizio)
			GROUP BY 
					STMAG.CODART,
					STMAG.CODDEPOSITO,
					STMAG.ESERCIZIO,
					AUM.UM
			HAVING 	
					SUM(STMAG.QTA1UM*STMAG.ORDINATO) <>0 OR 
					SUM(STMAG.QTA1UM*STMAG.IMPEGNATO) <>0 OR 
					SUM(CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END) <>0 OR 
					SUM(CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END) <>0 OR 
					SUM(CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END) <>0 OR 
					SUM(CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END) <>0 
		) GIACENZAINIZIALEMETODO
	) GIACENZAINIZIALE 
	
	
	SELECT 
		@GIACENZAATTUALE = ISNULL(SUM(GIACENZAATTUALE),0)
	FROM
	(
		SELECT	(CARICO - SCARICO - RESODACARICO + RESODASCARICO) AS GIACENZAATTUALE
		FROM
		(
			SELECT 	
					STMAG.CODART,STMAG.CODDEPOSITO,STMAG.ESERCIZIO,
					SUM((CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END)) AS CARICO,
					SUM((CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END)) AS SCARICO,
					SUM((CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END)) AS RESODACARICO,
					SUM((CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END)) AS RESODASCARICO,
					AUM.UM
			FROM STORICOMAG AS STMAG 
			INNER JOIN TABVINCOLIGIC AS TVG ON STMAG.ESERCIZIO=TVG.ESERCIZIO
			INNER JOIN ANAGRAFICAARTICOLI ART ON ART.CODICE=STMAG.CODART
			INNER JOIN ARTICOLIUMPREFERITE AUM ON AUM.CODART=STMAG.CODART AND AUM.TIPOUM=1
			WHERE 
					STMAG.CODART = @ARTICOLO AND 
					STMAG.CODDEPOSITO = @MAGAZZINO AND 
					STMAG.ESERCIZIO = @ESERCIZIO
			GROUP BY 
					STMAG.CODART,
					STMAG.CODDEPOSITO,
					STMAG.ESERCIZIO,
					AUM.UM
			HAVING 	
					SUM(STMAG.QTA1UM*STMAG.ORDINATO) <>0 OR 
					SUM(STMAG.QTA1UM*STMAG.IMPEGNATO) <>0 OR 
					SUM(CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END) <>0 OR 
					SUM(CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END) <>0 OR 
					SUM(CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END) <>0 OR 
					SUM(CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END) <>0 
		) GIACENZAATTUALEMETODO
	) GIACENZAATTUALE

	SET @GIACENZA = @GIACENZAINIZIALE + @GIACENZAATTUALE


RETURN(@GIACENZA)
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunGIACENZA_ARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FunGIACENZA_ARTICOLO] TO [Metodo98]
    AS [dbo];

