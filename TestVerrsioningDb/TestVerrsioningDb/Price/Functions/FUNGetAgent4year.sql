
CREATE FUNCTION [Price].[FUNGetAgent4year] 
(
    @CodAge VARCHAR(7) ='',
    @NrAge AS INT =1,
    @ProvvNoIva BIT=1,
    @Esercizio DECIMAL(5,0) = 1900 
)

RETURNS TABLE
--ENCRY-- 
AS
RETURN 
(
SELECT convert(varchar,(convert(float,  Provvigioni))) Provvigioni, UsaPrvPart, ApplProvvRiga, ApplProvvFinale, (SELECT  Price.GetSalesAgent(@CodAge,@NrAge, @ProvvNoIva, @Esercizio)) Fatturato FROM AnagraficaAgenti WHERE CodAgente=@CodAge
)          



GO
GRANT SELECT
    ON OBJECT::[Price].[FUNGetAgent4year] TO [Metodo98]
    AS [dbo];

