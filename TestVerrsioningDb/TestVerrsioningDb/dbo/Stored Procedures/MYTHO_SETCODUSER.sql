﻿



CREATE PROCEDURE [dbo].[MYTHO_SETCODUSER] 
   
AS

BEGIN
    INSERT INTO [dbo].[MYTHO_Codici_User]
               ([CODICEMETODO], [UTENTEMODIFICA], [DATAMODIFICA]        
             )
    SELECT CODCONTO, USER_NAME(), GETDATE() FROM ANAGRAFICACF CF
    Left Outer Join MYTHO_Codici_User COD
    ON COD.CODICEMETODO = CF.CODCONTO
    WHERE TIPOCONTO='C' AND  COD.CODICEMETODO IS NULL

END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[MYTHO_SETCODUSER] TO [Metodo98]
    AS [dbo];

