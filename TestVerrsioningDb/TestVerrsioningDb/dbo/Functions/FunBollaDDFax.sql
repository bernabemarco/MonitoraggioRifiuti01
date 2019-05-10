
CREATE FUNCTION [dbo].[FunBollaDDFax](@ProgressivoRP Decimal(10,0))
RETURNS nVARCHAR(25)
AS
BEGIN

DECLARE @BollaDDCliente VARCHAR(7)
DECLARE @BollaDDCodice	DECIMAL(5,0)
DECLARE @BollaDDFax		VARCHAR(25)
	
	SET @BollaDDFax = 0
	SET @BollaDDCodice = 0
	SET @BollaDDCliente = 0

	SELECT 
		@BollaDDCodice	= NUMDESTDIVERSAMERCI, 
		@BollaDDCliente = CODCLIFOR 
	FROM TESTEDOCUMENTI 
	WHERE 
		Progressivo=@ProgressivoRP

	SELECT 
		@BollaDDFax = FAX 
	FROM
		DESTINAZIONIDIVERSE
	WHERE 
		CODICE		= @BollaDDCodice AND 
		CODCONTO	= @BollaDDCliente

	RETURN(@BollaDDFax)
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunBollaDDFax] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FunBollaDDFax] TO [Metodo98]
    AS [dbo];

