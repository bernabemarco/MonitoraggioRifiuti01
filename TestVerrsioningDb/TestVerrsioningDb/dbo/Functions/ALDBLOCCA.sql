
CREATE FUNCTION dbo.ALDBLOCCA (@statocontabilita varchar(1))  
RETURNS VARCHAR(1) AS  
BEGIN 
/*	@statocontabilita = Stato contabilità della tabella anagraficherisveticf */
	DECLARE @STATO VARCHAR(1)
	SET @STATO=
	(CASE @statocontabilita
      	WHEN '0' THEN ''
      	WHEN '1' THEN ''
      	WHEN '2' THEN 'S'
        	END)
	RETURN @STATO
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[ALDBLOCCA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALDBLOCCA] TO [Metodo98]
    AS [dbo];

