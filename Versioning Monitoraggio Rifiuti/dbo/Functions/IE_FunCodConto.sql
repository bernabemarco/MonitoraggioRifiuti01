

CREATE FUNCTION [dbo].[IE_FunCodConto](@PartitaIva varchar(12))
RETURNS nVARCHAR(7)
AS
BEGIN

DECLARE @CodConto nVARCHAR(7)
    
    SET @CodConto = ''

    select @CodConto = CODCONTO from ANAGRAFICACF where PARTITAIVA = @PartitaIva And TIPOCONTO = 'C'
    
    RETURN(@CodConto)
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[IE_FunCodConto] TO [Metodo98]
    AS [dbo];

