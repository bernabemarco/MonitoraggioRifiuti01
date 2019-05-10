

CREATE FUNCTION [dbo].[Mytho_FunCheckClifor]
(
    -- Add the parameters for the function here
    @PI varchar(11) = '', 
    @CF varchar(14) = '',
    @TipoConto char(1)  
)
RETURNS varchar(7)
AS
BEGIN
    -- Declare the return variable here
    DECLARE @Result varchar(7) 
    SET @Result = ''
--      
    IF @PI = ''
        SET @PI = @CF
    
    IF @CF = ''
        SET @CF = @PI


    -- Add the T-SQL statements to compute the return value here
    
    SELECT Top 1 @Result = codconto From ANAGRAFICACF Where TipoConto = @TipoConto AND (PARTITAIVA= @PI OR CODFISCALE = @CF) 
    
    
    -- Return the result of the function
    RETURN @Result

END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Mytho_FunCheckClifor] TO [Metodo98]
    AS [dbo];

