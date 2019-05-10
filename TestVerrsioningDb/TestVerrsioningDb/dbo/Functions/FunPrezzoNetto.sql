
CREATE FUNCTION [dbo].[FunPrezzoNetto](@PrezzoLordo Decimal(19,6), @ScontoEsteso nVarchar(MAX))
RETURNS Decimal(19,6)
AS

BEGIN
    DECLARE @PrezzoNetto    Decimal(19,6)   
    DECLARE @Sconto         nVarchar(Max)
    DECLARE @ScontoSomma    Decimal(19,6)
    DECLARE @ScontoValore   Decimal(19,6)
        
        SET @PrezzoNetto = 0
        SET @ScontoSomma = 0
        SET @ScontoValore = 0
        
        DECLARE PrezzoNetto_Cursor CURSOR FOR
        SELECT ValoreSconto FROM FunConvSconti(@ScontoEsteso)
        OPEN PrezzoNetto_Cursor

        FETCH NEXT FROM PrezzoNetto_Cursor
            INTO @Sconto

        WHILE @@FETCH_STATUS = 0
            BEGIN
                SET @ScontoSomma = @ScontoSomma + (1 - @ScontoSomma / 100) * @Sconto
                --s = s + (1 - s / 100) * s2
                
                FETCH NEXT FROM PrezzoNetto_Cursor
                        INTO @Sconto
            END

        CLOSE PrezzoNetto_Cursor
        DEALLOCATE PrezzoNetto_Cursor

        Set @ScontoValore = ((100 - @ScontoSomma) / 100)
        Set @PrezzoNetto = (@PrezzoLordo * @ScontoValore)

RETURN @PrezzoNetto
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunPrezzoNetto] TO [Metodo98]
    AS [dbo];

