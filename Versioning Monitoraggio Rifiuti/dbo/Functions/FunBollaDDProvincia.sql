
CREATE FUNCTION [dbo].[FunBollaDDProvincia](@ProgressivoRP Decimal(10,0))
RETURNS nVARCHAR(4)
AS
BEGIN

DECLARE @BollaDDProvincia VARCHAR(4)
	
	SET @BollaDDProvincia = ''

	SELECT @BollaDDProvincia=ISNULL(ProvinciaDDM,'') FROM TESTEDOCUMENTI WHERE Progressivo=@ProgressivoRP

	RETURN(@BollaDDProvincia)
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunBollaDDProvincia] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FunBollaDDProvincia] TO [Metodo98]
    AS [dbo];

