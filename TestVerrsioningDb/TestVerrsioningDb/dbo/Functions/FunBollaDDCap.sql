
CREATE FUNCTION [dbo].[FunBollaDDCap](@ProgressivoRP Decimal(10,0))
RETURNS nVARCHAR(8)
AS
BEGIN

DECLARE @BollaDDCap VARCHAR(8)
	
	SET @BollaDDCap = ''

	SELECT @BollaDDCap=ISNULL(CapDDM,'') FROM TESTEDOCUMENTI WHERE Progressivo=@ProgressivoRP

	RETURN(@BollaDDCap)
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunBollaDDCap] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FunBollaDDCap] TO [Metodo98]
    AS [dbo];

