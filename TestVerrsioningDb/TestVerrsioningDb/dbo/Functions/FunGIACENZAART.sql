﻿
create FUNCTION FunGIACENZAART (@ARTICOLO nVARCHAR(50), @DEPOSITO nVARCHAR(10))
RETURNS @Results TABLE (PROGRESSIVO numeric(10, 0) IDENTITY (1, 1),
			CODART nVARCHAR(50)  ,
			QUANTITACARICO smallint,
			VALORECARICO  smallint,
			GIACENZA  smallint,
			QUANTITASCARICO  smallint,
			VALORESCARICO  smallint,
			GIACENZA2UM  smallint,
			QTA1UM decimal(19,4),
			QTA2UM decimal(19,4),
			CODDEPOSITO nVARCHAR(25) 
)
AS

    BEGIN

DECLARE @CODART nVARCHAR(50)
DECLARE @CODDEPOSITO nVARCHAR(25)
DECLARE @QUANTITACARICO smallint
DECLARE @VALORECARICO  smallint
DECLARE @GIACENZA  smallint
DECLARE @QUANTITASCARICO  smallint
DECLARE @VALORESCARICO  smallint
DECLARE @GIACENZA2UM  smallint
DECLARE @QTA1UM decimal(19,4)
DECLARE @QTA2UM decimal(19,4)

	DECLARE Articoli_Cursor CURSOR FOR
			SELECT 
			    STMAG.CODART,
			    CASE WHEN SUM((CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END) +
				         (CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END) -
				         (CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END) -
			    	         (CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END)) >= 0
			         THEN 1 ELSE 0 END AS QUANTITACARICO,
			    CASE WHEN SUM((CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END) +
				         (CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END) -
				         (CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END) -
			    	         (CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END)) >= 0
			         THEN 1 ELSE 0 END AS VALORECARICO,
			    CASE WHEN SUM((CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END) +
				         (CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END) -
				         (CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END) -
			    	         (CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END)) >= 0
			         THEN 1 ELSE -1 END AS GIACENZA,
			    CASE WHEN SUM((CASE WHEN STMAG.GIACENZA2UM=1 and STMAG.RESO = 0 THEN STMAG.QTA2UM ELSE 0 END) +
				         (CASE WHEN STMAG.GIACENZA2UM=1 and STMAG.RESO = 1 THEN STMAG.QTA2UM ELSE 0 END) -
				         (CASE WHEN STMAG.GIACENZA2UM=-1 and STMAG.RESO = 0 THEN STMAG.QTA2UM ELSE 0 END) -
			    	         (CASE WHEN STMAG.GIACENZA2UM=-1 and STMAG.RESO = 1 THEN STMAG.QTA2UM ELSE 0 END)) >= 0
			         THEN 1 ELSE 0 END AS QUANTITASCARICO,
			    CASE WHEN SUM((CASE WHEN STMAG.GIACENZA2UM=1 and STMAG.RESO = 0 THEN STMAG.QTA2UM ELSE 0 END) +
				         (CASE WHEN STMAG.GIACENZA2UM=1 and STMAG.RESO = 1 THEN STMAG.QTA2UM ELSE 0 END) -
				         (CASE WHEN STMAG.GIACENZA2UM=-1 and STMAG.RESO = 0 THEN STMAG.QTA2UM ELSE 0 END) -
			    	         (CASE WHEN STMAG.GIACENZA2UM=-1 and STMAG.RESO = 1 THEN STMAG.QTA2UM ELSE 0 END)) >= 0
			         THEN 1 ELSE 0 END AS VALORESCARICO,
			    CASE WHEN SUM((CASE WHEN STMAG.GIACENZA2UM=1 and STMAG.RESO = 0 THEN STMAG.QTA2UM ELSE 0 END) +
				         (CASE WHEN STMAG.GIACENZA2UM=1 and STMAG.RESO = 1 THEN STMAG.QTA2UM ELSE 0 END) -
				         (CASE WHEN STMAG.GIACENZA2UM=-1 and STMAG.RESO = 0 THEN STMAG.QTA2UM ELSE 0 END) -
			    	         (CASE WHEN STMAG.GIACENZA2UM=-1 and STMAG.RESO = 1 THEN STMAG.QTA2UM ELSE 0 END)) >= 0
			         THEN 1 ELSE -1 END AS GIACENZA2UM,
			    ABS(SUM ((CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END) +
			    	     (CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END) -
				     (CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END) -
			    	     (CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END))) AS QTA1UM,
			    ABS(SUM ((CASE WHEN STMAG.GIACENZA2UM=1 and STMAG.RESO = 0 THEN STMAG.QTA2UM ELSE 0 END) +
			             (CASE WHEN STMAG.GIACENZA2UM=1 and STMAG.RESO = 1 THEN STMAG.QTA2UM ELSE 0 END) -
			    	     (CASE WHEN STMAG.GIACENZA2UM=-1 and STMAG.RESO = 0 THEN STMAG.QTA2UM ELSE 0 END) -
			    	     (CASE WHEN STMAG.GIACENZA2UM=-1 and STMAG.RESO = 1 THEN STMAG.QTA2UM ELSE 0 END))) AS QTA2UM,
			    STMAG.CODDEPOSITO
			FROM STORICOMAG AS STMAG
			WHERE STMAG.CODART = @ARTICOLO AND STMAG.CODDEPOSITO = @DEPOSITO
			GROUP BY STMAG.CODART,STMAG.CODDEPOSITO
			ORDER BY STMAG.CODART	
	OPEN Articoli_Cursor
		
	FETCH NEXT FROM Articoli_Cursor
 	    INTO @CODART,@QUANTITACARICO,@VALORECARICO,@GIACENZA,@QUANTITASCARICO,@VALORESCARICO,@GIACENZA2UM,@QTA1UM,@QTA2UM,@CODDEPOSITO

	WHILE @@FETCH_STATUS = 0
		BEGIN

		    INSERT INTO @Results VALUES(@CODART,@QUANTITACARICO,@VALORECARICO,@GIACENZA,@QUANTITASCARICO,@VALORESCARICO,@GIACENZA2UM,@QTA1UM,@QTA2UM,@CODDEPOSITO)
		    
		    FETCH NEXT FROM Articoli_Cursor
			INTO @CODART,@QUANTITACARICO,@VALORECARICO,@GIACENZA,@QUANTITASCARICO,@VALORESCARICO,@GIACENZA2UM,@QTA1UM,@QTA2UM,@CODDEPOSITO
		END
	
	CLOSE Articoli_Cursor
	DEALLOCATE Articoli_Cursor
    
    RETURN
END

GO
GRANT SELECT
    ON OBJECT::[dbo].[FunGIACENZAART] TO [Metodo98]
    AS [dbo];

