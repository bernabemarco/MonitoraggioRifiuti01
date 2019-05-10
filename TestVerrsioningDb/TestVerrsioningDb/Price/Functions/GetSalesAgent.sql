
CREATE FUNCTION [Price].[GetSalesAgent]
(
   @CodAge VARCHAR(7) ='' ,
   @NrAge AS int=1,
   @ProvvNoIva INT =1,
   @Esercizio Decimal(5,0) = 1900 
)
RETURNS DECIMAL(19,6)
--ENCRY--
AS
BEGIN
    DECLARE @Sales AS Decimal(19,6)

    IF @ProvvNoIva = 0
        SET @Sales = ISNULL((SELECT Sum(IMPONIBSCADEURO) Fatturato FROM VistaScadenze WHERE Esercizio=@Esercizio AND (CODAGE1=@CodAge AND @nrAge=1) OR (CODAGE2=@CodAge AND @nrAge=2) OR (CODAGE3=@CodAge AND @nrAge=3)),0)
    ELSE
        SET @Sales = ISNULL((SELECT Sum(IMPORTOSCADEURO) Fatturato FROM VistaScadenze WHERE Esercizio=@Esercizio AND (CODAGE1=@CodAge AND @nrAge=1) OR (CODAGE2=@CodAge AND @nrAge=2) OR (CODAGE3=@CodAge AND @nrAge=3)),0)
  
    RETURN @Sales                  
  
END

