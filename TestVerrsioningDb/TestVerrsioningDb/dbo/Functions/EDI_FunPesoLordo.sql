
CREATE FUNCTION [dbo].[EDI_FunPesoLordo] 
(
    @Idtesta decimal(10,0) 
    )

RETURNS varchar(15)
AS
BEGIN
    -- Declare the return variable here
    declare @PESOLORDO VARCHAR(15)
            declare @PROGRESSIVO DECIMAL
            Select @PROGRESSIVO = @Idtesta

            Select @PESOLORDO = (Select convert(varchar(15),TOTPESOLORDO) from dbo.TESTEDOCUMENTI where PROGRESSIVO = @PROGRESSIVO)
                
    RETURN @PESOLORDO

END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[EDI_FunPesoLordo] TO [Metodo98]
    AS [dbo];

