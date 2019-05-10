

CREATE FUNCTION [dbo].[JoinRowsIntoFiled](@NrReg Decimal(10,0), @Sign AS Smallint)
RETURNS VARCHAR(MAX)
AS
BEGIN

Declare @Result AS Varchar(MAX)

    SELECT 
        @Result = COALESCE(@Result + ',', '') + CAST(NRRIGA AS Varchar)
    FROM RIGHECONTABILITA 
    where NRRIGA IS NOT NULL AND NRREG = @NrReg And SEGNO = @Sign
    
    RETURN(@Result)
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[JoinRowsIntoFiled] TO [Metodo98]
    AS [dbo];

