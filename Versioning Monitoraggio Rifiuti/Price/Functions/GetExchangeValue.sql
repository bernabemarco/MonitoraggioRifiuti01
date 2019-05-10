
CREATE FUNCTION [Price].[GetExchangeValue]
(
    @intDivisa As Integer,
    @Date DATETIME
)
RETURNS DECIMAL(13,6)
AS
BEGIN

    DECLARE @ExchangeValue DECIMAL(19,6) 

    If (@intDivisa = 0) Or ISDATE (@date) = 0
        SET @ExchangeValue = 1 
    Else 
        BEGIN
                
        
            DECLARE @isEuro AS SMALLINT
            SET @isEuro =(SELECT TIPOEURO FROM dbo.TABCAMBI  WHERE CODICE=   @intDivisa)

        

            If @isEuro = 1  
                SET @ExchangeValue = 1 
            Else 
                BEGIN
                   SET @ExchangeValue =(SELECT Valore FROM ValoriCambio WHERE Data = @date AND CodCambio = @intDivisa)
                    IF @ExchangeValue IS NULL
                        SET  @ExchangeValue = 1 
                    END

        END

    RETURN @ExchangeValue

END

