
CREATE PROCEDURE POPOLA_TMP_TES_PROGRSCADIMP(@IDSESSIONE Decimal(5,0), @xmlDoc XML) AS

Begin


DECLARE @i 	    INT


/*
DECLARE @xmlDoc XML
SET @xmlDoc =  ( 	
  			        SELECT *
					FROM OPENROWSET  
						  (BULK FilePath, SINGLE_CLOB)  AS xmlData 
				 )

*/

exec sp_xml_preparedocument @i output, @xmlDoc ,'<root xmlns:rs="urn:schemas-microsoft-com:rowset" xmlns:z="#RowsetSchema"/>'

DELETE FROM TMP_TES_PROGRSCADIMP WHERE IDSESSIONE = @IDSESSIONE

INSERT INTO TMP_TES_PROGRSCADIMP
	SELECT 
		*
	FROM OPENXML(@i,'/xml/rs:data/z:row',1)

	WITH 
	(	
	 PROGRESSIVO    DECIMAL(10,0),
     IDSESSIONE     DECIMAL(5,0),   
     UTENTEMODIFICA VARCHAR(25),
     DATAMODIFICA   DATETIME 
	 )

exec sp_xml_removedocument @i


End


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[POPOLA_TMP_TES_PROGRSCADIMP] TO [Metodo98]
    AS [dbo];

