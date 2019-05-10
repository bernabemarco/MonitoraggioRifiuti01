
CREATE FUNCTION [dbo].[FunBollaDDLocalita](@ProgressivoRP Decimal(10,0))
RETURNS nVARCHAR(80)
AS
BEGIN

DECLARE @BollaDDLocalita VARCHAR(80)
	
	SET @BollaDDLocalita = ''

	SELECT @BollaDDLocalita=ISNULL(LocalitaDDM,'') FROM TESTEDOCUMENTI WHERE Progressivo=@ProgressivoRP

	RETURN(@BollaDDLocalita)
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunBollaDDLocalita] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FunBollaDDLocalita] TO [Metodo98]
    AS [dbo];

