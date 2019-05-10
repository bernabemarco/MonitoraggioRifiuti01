

CREATE FUNCTION dbo.ALDSPC (@testo varchar(255),@lung integer)  
RETURNS VARCHAR(255) AS  
BEGIN 
/*	@testo	 = testo da formattare con spazi*/
/*	@lung	 = lunghezza della stringa in uscita*/

	DECLARE @RISULTATO VARCHAR(255)
	SET @TESTO=ISNULL( @TESTO,SPACE(255))

	SET @RISULTATO=LEFT(@testo+space(@lung),@lung)
	RETURN @RISULTATO
END





GO
GRANT EXECUTE
    ON OBJECT::[dbo].[ALDSPC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALDSPC] TO [Metodo98]
    AS [dbo];

