﻿

CREATE FUNCTION [dbo].[FUNNUMRIFORD](@ProgressivoRP DECIMAL(10,0))
RETURNS VARCHAR(18)
AS
BEGIN

DECLARE @NUMRIFORD varchar(18)
    
    SET @NUMRIFORD = ''

    SELECT 
        @NUMRIFORD = NUMRIFDOC   
    FROM 
        TESTEDOCUMENTI T
    WHERE
        T.PROGRESSIVO = @ProgressivoRP

    RETURN(@NUMRIFORD)
END




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FUNNUMRIFORD] TO [Metodo98]
    AS [dbo];

