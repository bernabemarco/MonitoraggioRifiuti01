

CREATE FUNCTION [dbo].[EC_FunGetCliFor](@RagioneSociale NVARCHAR(150), @RecordRaw NVARCHAR(650))
RETURNS nVARCHAR(7)
AS
BEGIN

DECLARE @CodCliFor nVARCHAR(7)
    
    SET @CodCliFor = ''
    
    if @RagioneSociale <> ''
    SELECT TOP 1 @CodCliFor = CodConto FROM ANAGRAFICACF WHERE DSCCONTO1 Like '%' + @RagioneSociale + '%'
    
    RETURN(@CodCliFor)
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[EC_FunGetCliFor] TO [Metodo98]
    AS [dbo];

