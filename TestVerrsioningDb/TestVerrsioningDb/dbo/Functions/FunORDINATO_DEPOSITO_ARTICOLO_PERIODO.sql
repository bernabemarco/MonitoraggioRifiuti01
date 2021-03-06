﻿
CREATE FUNCTION [dbo].[FunORDINATO_DEPOSITO_ARTICOLO_PERIODO](@ARTICOLO nVARCHAR(50),
												  @MAGAZZINO nVARCHAR(10),
												   @DATAINIZIO DATETIME,
													@DATAFINE DATETIME)

RETURNS NUMERIC(18,6)
AS
BEGIN     

DECLARE @ORDINATO			AS NUMERIC(18,6)
	
	SET @ORDINATO = 0
	
	SELECT 
		@ORDINATO = ISNULL(SUM(ORDINATOATTUALE),0)
	FROM
	(
		SELECT	ORDINATO AS ORDINATOATTUALE
		FROM
		(
			SELECT 	
					STMAG.CODART,STMAG.CODDEPOSITO,
					SUM(STMAG.QTA1UM*STMAG.ORDINATO) AS ORDINATO,
					AUM.UM
			FROM STORICOMAG AS STMAG 
			INNER JOIN TABVINCOLIGIC AS TVG ON STMAG.ESERCIZIO=TVG.ESERCIZIO
			INNER JOIN ANAGRAFICAARTICOLI ART ON ART.CODICE=STMAG.CODART
			INNER JOIN ARTICOLIUMPREFERITE AUM ON AUM.CODART=STMAG.CODART AND AUM.TIPOUM=1
			WHERE 
					STMAG.CODART = @ARTICOLO AND 
					STMAG.CODDEPOSITO = @MAGAZZINO AND 
					STMAG.DATAMOV BETWEEN @DATAINIZIO AND @DATAFINE
			GROUP BY 
					STMAG.CODART,
					STMAG.CODDEPOSITO,
					AUM.UM
			HAVING 	
					SUM(STMAG.QTA1UM*STMAG.ORDINATO) <>0 OR 
					SUM(STMAG.QTA1UM*STMAG.IMPEGNATO) <>0 OR 
					SUM(CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END) <>0 OR 
					SUM(CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END) <>0 OR 
					SUM(CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END) <>0 OR 
					SUM(CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END) <>0 
		) ORDINATOATTUALEMETODO
	) ORDINATOATTUALE

RETURN(@ORDINATO)

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunORDINATO_DEPOSITO_ARTICOLO_PERIODO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FunORDINATO_DEPOSITO_ARTICOLO_PERIODO] TO [Metodo98]
    AS [dbo];

