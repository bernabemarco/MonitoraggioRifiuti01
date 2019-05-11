﻿
CREATE FUNCTION FunGIACDISPTOTLOG(@ARTICOLO nVARCHAR(50),@DEPOSITO nVARCHAR(10))
                                    RETURNS @Results TABLE (GIAC  DECIMAL(19,6) , DISPONIBILITA  DECIMAL(19,6))

AS

BEGIN

DECLARE @GIAC                  DECIMAL(19,6)
DECLARE @DISPONIBILITA DECIMAL(19,6)


	DECLARE Articoli_Cursor CURSOR fast_forward read_only  FOR
	
	
             SELECT
                           (SUM(CASE WHEN GIACENZA=1 and RESO = 0 THEN QTA1UM ELSE 0 END)+
	    	 SUM(CASE WHEN GIACENZA=1 and RESO = 1 THEN QTA1UM ELSE 0 END)-
	   	 SUM(CASE WHEN GIACENZA=-1 and RESO = 0 THEN QTA1UM ELSE 0 END)-
		 SUM(CASE WHEN GIACENZA=-1 and RESO = 1 THEN QTA1UM ELSE 0 END)) AS GIAC ,
                            ((SUM(CASE WHEN GIACENZA=1 and RESO = 0 THEN QTA1UM ELSE 0 END)+
	    	  SUM(CASE WHEN GIACENZA=1 and RESO = 1 THEN QTA1UM ELSE 0 END)-
	   	  SUM(CASE WHEN GIACENZA=-1 and RESO = 0 THEN QTA1UM ELSE 0 END)-
		  SUM(CASE WHEN GIACENZA=-1 and RESO = 1 THEN QTA1UM ELSE 0 END))  + SUM(QTA1UM*ORDINATO) - SUM(QTA1UM*IMPEGNATO)) AS DISP                           

	FROM STORICOMAG 
	WHERE STORICOMAG.CODART=@ARTICOLO  AND STORICOMAG.CODDEPOSITO=@DEPOSITO
             

             OPEN Articoli_Cursor
		
	FETCH NEXT FROM Articoli_Cursor
 	             INTO @GIAC,@DISPONIBILITA

	WHILE @@FETCH_STATUS = 0
		BEGIN
            
                               INSERT INTO @Results VALUES(@GIAC,@DISPONIBILITA)
			
                               FETCH NEXT FROM Articoli_Cursor
                  		    INTO @GIAC,@DISPONIBILITA
	
              	END
	
	CLOSE Articoli_Cursor
	DEALLOCATE Articoli_Cursor
	
RETURN
END



GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FunGIACDISPTOTLOG] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FunGIACDISPTOTLOG] TO [Metodo98]
    AS [dbo];
