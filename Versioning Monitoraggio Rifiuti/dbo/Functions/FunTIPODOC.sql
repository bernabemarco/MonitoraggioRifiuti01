﻿

CREATE FUNCTION [dbo].[FunTIPODOC](@Progressivo DECIMAL(10,0))
RETURNS VARCHAR(6)
AS
BEGIN

DECLARE @TIPODOC varchar(6)
    
    SET @TIPODOC = ''

    SEt @TIPODOC= (SELECT TOP 1 CASE SEGNO WHEN 1 THEN  'INVOIC' ELSE 'NOTACC' END
        FROM TESTEDOCUMENTI T
    WHERE T.PROGRESSIVO = @Progressivo)

       

    RETURN(@TIPODOC)
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunTIPODOC] TO [Metodo98]
    AS [dbo];
