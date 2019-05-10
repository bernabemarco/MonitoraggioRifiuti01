﻿

CREATE FUNCTION dbo.ALDDAT(@DATA DATETIME)  
RETURNS CHAR(8) AS  
BEGIN 
	/*	@DATA	 = data in formato gg/mm/aaaa da convertire in formato ggmmaaaa */	
	DECLARE @ANNO CHAR(4)
	DECLARE @MESE CHAR(2)
	DECLARE @GIORNO CHAR(2)

	SET @ANNO=CAST(YEAR(@DATA) AS CHAR(4))
	SET @MESE=CAST(MONTH(@DATA) AS CHAR(2))
	SET @GIORNO=CAST(DAY(@DATA) AS CHAR(2))

	SET @ANNO=RIGHT(RTRIM('0000'+@ANNO),4)
	SET @MESE=RIGHT(RTRIM('00'+@MESE),2)
	SET @GIORNO=RIGHT(RTRIM('00'+@GIORNO),2)

RETURN RTRIM(@GIORNO)+RTRIM(@MESE)+RTRIM(@ANNO)
END




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[ALDDAT] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALDDAT] TO [Metodo98]
    AS [dbo];

