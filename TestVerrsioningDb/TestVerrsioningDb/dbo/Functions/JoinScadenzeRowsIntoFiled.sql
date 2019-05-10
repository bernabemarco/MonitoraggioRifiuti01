

CREATE FUNCTION [dbo].[JoinScadenzeRowsIntoFiled](@NrReg Decimal(10,0))
RETURNS VARCHAR(MAX)
AS
BEGIN

Declare @Result AS Varchar(MAX)

    SELECT 
        @Result = COALESCE(@Result + ',', '') + CAST(PROGRESSIVO AS Varchar)
    FROM TABSCADENZE 
    where NRREGESITO IS NOT NULL AND NRREGESITO = @NrReg
    
    RETURN(@Result)
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[JoinScadenzeRowsIntoFiled] TO [Metodo98]
    AS [dbo];

