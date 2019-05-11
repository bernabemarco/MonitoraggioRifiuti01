﻿
CREATE FUNCTION GETRIFORD(@IDTESTARP DECIMAL(10, 0), @IDRIGARP DECIMAL(10, 0), @LIVELLO SMALLINT) RETURNS VARCHAR(15)  
AS
BEGIN
    DECLARE @IDTESTAPREL DECIMAL(10, 0)
    DECLARE @IDRIGAPREL DECIMAL(10, 0)
    DECLARE @TIPODOC VARCHAR(1)
    DECLARE @RIFDOC VARCHAR(15)
    
     SET @RIFDOC = ''
    IF @LIVELLO < 30 AND @IDTESTARP>0 AND @IDRIGARP>0
        BEGIN
          SELECT @IDTESTAPREL=IDTESTARP,@IDRIGAPREL=IDRIGARP,@TIPODOC=(SELECT TIPO FROM PARAMETRIDOC WHERE CODICE=TIPODOC) FROM RIGHEDOCUMENTI WHERE (IDTESTA=@IDTESTARP) AND (IDRIGA=@IDRIGARP) 
        IF @TIPODOC = 'O' 
            SET @RIFDOC = CAST(@IDTESTARP AS VARCHAR(10)) + ';' + CAST(@IDRIGARP AS VARCHAR(4))
        ELSE    
            SET @RIFDOC = DBO.GetRifOrd(@IDTESTAPREL, @IDRIGAPREL, @LIVELLO+1)
        END
    RETURN @RIFDOC
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GETRIFORD] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GETRIFORD] TO [Metodo98]
    AS [dbo];
