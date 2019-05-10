
CREATE FUNCTION [dbo].[FunBollaDDRagioneSociale](@ProgressivoRP Decimal(10,0))
RETURNS nVARCHAR(80)
AS
BEGIN

DECLARE @BollaDDRagioneSociale VARCHAR(80)
	
	SET @BollaDDRagioneSociale = ''

	SELECT @BollaDDRagioneSociale=ISNULL(RAGSOCDDM,'') FROM TESTEDOCUMENTI WHERE Progressivo=@ProgressivoRP

	RETURN(@BollaDDRagioneSociale)
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunBollaDDRagioneSociale] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FunBollaDDRagioneSociale] TO [Metodo98]
    AS [dbo];

