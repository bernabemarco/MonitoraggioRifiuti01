

CREATE FUNCTION [dbo].[FunBollaDDNegozio](@ProgressivoRP Decimal(10,0))
RETURNS nVARCHAR(25)
AS
BEGIN

DECLARE @BollaDDCliente VARCHAR(7)
DECLARE @BollaDDCodice  DECIMAL(5,0)
DECLARE @BollaDDNegozio VARCHAR(25)
    
    SET @BollaDDNegozio = ''
    SET @BollaDDCodice  = 0
    SET @BollaDDCliente = 0

    SELECT 
        @BollaDDCodice  = NUMDESTDIVERSAMERCI, 
        @BollaDDCliente = CODCLIFOR 
    FROM TESTEDOCUMENTI 
    WHERE 
        Progressivo=@ProgressivoRP

    SELECT 
        @BollaDDNegozio = ISNULL(CODDEST_EDI,'')
    FROM
        DESTINAZIONIDIVERSE
    WHERE 
        CODICE      = @BollaDDCodice AND 
        CODCONTO    = @BollaDDCliente

    RETURN(@BollaDDNegozio)
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunBollaDDNegozio] TO [Metodo98]
    AS [dbo];

