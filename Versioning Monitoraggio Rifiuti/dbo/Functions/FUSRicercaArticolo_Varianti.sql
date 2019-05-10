

-- =============================================
-- Author:      Giovanni e Pasquale
-- Create date: 
-- Description: 
-- =============================================

CREATE FUNCTION FUSRicercaArticolo_Varianti 
(
    -- Add the parameters for the function here
    @CODICEPRIMARIO VARCHAR(50)
    , @VARESPLICITE VARCHAR(255)
)

RETURNS VARCHAR(50)
AS
BEGIN


    -- Declare the return variable here
    DECLARE @Result varchar(50) = ''

    -- Add the T-SQL statements to compute the return value here
    SELECT @Result = ISNULL(CODICE,'') FROM ANAGRAFICAARTICOLI
    WHERE CODICEPRIMARIO = @CODICEPRIMARIO
    AND VARESPLICITE = @VARESPLICITE AND VARESPLICITE <> '' 
    
    -- Return the result of the function
    RETURN @Result

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FUSRicercaArticolo_Varianti] TO [Metodo98]
    AS [dbo];

