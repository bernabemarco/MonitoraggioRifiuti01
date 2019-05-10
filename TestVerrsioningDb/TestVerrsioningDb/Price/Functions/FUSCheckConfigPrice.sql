
CREATE FUNCTION [Price].[FUSCheckConfigPrice] 
(
    @PriceType int = 0
)
RETURNS int
--ENCRY--
AS
BEGIN
    DECLARE @Result int

    IF @PriceType = 0
    
        SELECT @Result = CFGPrezzi  FROM ParametriGPrezzi WHERE NrRecord=1
    
    ELSE

        SELECT @Result = CFGPREZZITRASF  FROM ParametriGPrezzi WHERE NrRecord=1

    RETURN @Result

END

