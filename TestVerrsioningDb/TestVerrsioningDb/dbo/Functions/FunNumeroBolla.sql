
CREATE FUNCTION [dbo].[FunNumeroBolla](@ProgressivoRP Decimal(10,0))
RETURNS DECIMAL(10,0)
AS
BEGIN

DECLARE @NumeroBolla DECIMAL(10,0)
	
	SET @NumeroBolla = 0

	SELECT @NumeroBolla=NUMERODOC FROM TESTEDOCUMENTI WHERE Progressivo=@ProgressivoRP

	RETURN(@NumeroBolla)
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunNumeroBolla] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FunNumeroBolla] TO [Metodo98]
    AS [dbo];

