
CREATE FUNCTION [dbo].[FunDataBolla](@ProgressivoRP Decimal(10,0))
RETURNS DATETIME
AS
BEGIN

DECLARE @DataBolla DATETIME
	
	SET @DataBolla = 0

	SELECT @DataBolla=DataDoc FROM TESTEDOCUMENTI WHERE Progressivo=@ProgressivoRP

	RETURN(@DataBolla)
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunDataBolla] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FunDataBolla] TO [Metodo98]
    AS [dbo];

