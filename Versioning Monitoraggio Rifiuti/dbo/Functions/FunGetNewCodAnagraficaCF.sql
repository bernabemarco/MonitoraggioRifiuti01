

CREATE FUNCTION [dbo].[FunGetNewCodAnagraficaCF] 
(
    -- Add the parameters for the function here
     @TipoConto char(1)
)
RETURNS varchar(7)
AS
BEGIN
    -- Declare the return variable here
    DECLARE @Result varchar(7)  
    DECLAre @Padding varchar(6)
    DECLARE @LastCodConto varchar(7)
    -- Add the T-SQL statements to compute the return value here
    SELECT top 1  @LastCodConto = codconto From AnagraficaCF where Tipoconto = @TipoConto Order by codconto desc
    SET @LastCodConto = CAST(CAST(RIGHT(@LastCodConto, 6) AS int) + 1 as varchar(6) )

    SET @Result = @TipoConto + (SELECT [dbo].[PADL](@LastCodConto, 6, ' '))

    -- Return the result of the function
    RETURN @Result

END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunGetNewCodAnagraficaCF] TO [Metodo98]
    AS [dbo];

