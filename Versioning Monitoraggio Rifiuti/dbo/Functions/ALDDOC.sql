

CREATE FUNCTION dbo.ALDDOC (@tipodoc varchar(1))  
RETURNS VARCHAR(2) AS  
BEGIN 
/*	@TIPODOC = Tipo documento proveniente dai parametidoc */
	DECLARE @PROVENIENZA VARCHAR(2)
	SET @PROVENIENZA= 
(CASE LTRIM(RTRIM(ISNULL(@TIPODOC,'')))
      	WHEN '' THEN 'CO'
      	WHEN 'F' THEN 'CO'
      	WHEN 'O' THEN 'OR'
      	WHEN 'B' THEN 'BO'
      	WHEN 'N' THEN 'NA'
      	WHEN 'A' THEN 'AL'
        END)
	RETURN @PROVENIENZA
END






GO
GRANT EXECUTE
    ON OBJECT::[dbo].[ALDDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALDDOC] TO [Metodo98]
    AS [dbo];

