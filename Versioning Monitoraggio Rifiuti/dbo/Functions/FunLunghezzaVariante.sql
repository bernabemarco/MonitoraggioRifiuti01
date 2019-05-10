
CREATE FUNCTION [dbo].[FunLunghezzaVariante] 
(
	-- Add the parameters for the function here
	@Variante varchar(3)
)
RETURNS varchar(3)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result varchar(3)

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = LUNGVARIANTE FROM dbo.[TABTIPOLOGIE] Where Tipologia = @Variante
	
	-- Return the result of the function
	RETURN @Result

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunLunghezzaVariante] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FunLunghezzaVariante] TO [Metodo98]
    AS [dbo];

