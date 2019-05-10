
CREATE FUNCTION [dbo].[FunBollaDDIndirizzo](@ProgressivoRP Decimal(10,0))
RETURNS nVARCHAR(80)
AS
BEGIN

DECLARE @BollaDDIndirizzo VARCHAR(80)
	
	SET @BollaDDIndirizzo = ''

	SELECT @BollaDDIndirizzo=ISNULL(INDIRIZZODDM,'') FROM TESTEDOCUMENTI WHERE Progressivo=@ProgressivoRP

	RETURN(@BollaDDIndirizzo)
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunBollaDDIndirizzo] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FunBollaDDIndirizzo] TO [Metodo98]
    AS [dbo];

