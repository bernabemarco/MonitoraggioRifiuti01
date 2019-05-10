
CREATE FUNCTION [Price].[ROUNDS](@Price DECIMAL(19,6), @Precision DECIMAL(19,4), @Type AS CHAR(1))
RETURNS DECIMAL(19,6)
AS
BEGIN

    DECLARE @vntResult AS DECIMAL(19,6), @vntAus AS DECIMAL(19,6),@Return AS DECIMAL(19,6), @Default CHAR(1)
    IF @Precision=0
        BEGIN
            RETURN @Price
        END


    SET @Default ='E'

    SET @vntAus = (@Price / @Precision) 

    --Gestione default per eccesso--
    IF @Type ='N'
        SET @Type = @Default

    IF @Type = 'E'
        BEGIN
            SET @vntResult = CONVERT(INT,@vntAus) 
            IF (@vntResult <> @vntAus) 
                 SET @vntResult = @vntResult + 1 
        END      
    IF @Type = 'D'
        SET @vntResult = CONVERT(INT,@vntAus)    
    IF @Type = 'C'
        BEGIN
            SET @vntResult = @vntAus 
            SET @vntResult = ROUND(@vntAus,0.5)  
        END
   

    SET @Return = (@vntResult * @Precision) 

    
  RETURN @Return
END

