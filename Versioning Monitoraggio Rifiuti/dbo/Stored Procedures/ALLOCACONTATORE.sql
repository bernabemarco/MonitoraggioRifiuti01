﻿
CREATE PROCEDURE ALLOCACONTATORE @PCODICE DECIMAL(5),@PESERCIZIO DECIMAL(5),@PUTENTE VARCHAR(25),@PALLOCA DECIMAL(10,0), @PPROG DECIMAL(10,0) OUTPUT AS
BEGIN
    BEGIN
        DECLARE @R TABLE (PP DECIMAL(10));

        UPDATE 
            TABCONTATORI
        SET  
            PROGR = PROGR + @PALLOCA, UTENTEMODIFICA = @PUTENTE, DATAMODIFICA = GETDATE() 
        OUTPUT 
            INSERTED.PROGR - @PALLOCA + 1 INTO @R
        WHERE 
            ESERCIZIO = @PESERCIZIO AND CODICE = @PCODICE

        SELECT TOP 1 @PPROG = PP FROM @R;
        SELECT @PPROG = ISNULL(@PPROG, 1) 
    END
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[ALLOCACONTATORE] TO [Metodo98]
    AS [dbo];

