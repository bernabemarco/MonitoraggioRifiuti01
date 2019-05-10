
-- =============================================
-- Author:      Pasquale De Biase
-- Create date: 07/10/2009
-- Description: Funzione Costo Ultimo
-- =============================================
CREATE FUNCTION dbo.FunCostoUltimo 
(
    -- Add the parameters for the function here
    @Codart Varchar(50)
)
RETURNS decimal(19,4)
AS
BEGIN
    -- Declare the return variable here
    DECLARE @Result decimal(19,4)
    DECLARE @CU decimal(19,4)
    -- Add the T-SQL statements to compute the return value here
    SET @CU = (SELECT top 1 
                PrezzoEuro from dbo.STORICOPREZZIARTICOLO 
                WHERE codarticolo =@codart AND  TipoPrezzo ='F'  AND Ultimo=1
                order by data desc)
    -- Return the result of the function
    SET @Result = @CU
    RETURN @Result
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunCostoUltimo] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FunCostoUltimo] TO [Metodo98]
    AS [dbo];

