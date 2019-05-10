﻿
CREATE FUNCTION GETTIPRAGGR(@CODICEARTICOLO VARCHAR(50))
RETURNS VARCHAR(7)
AS
BEGIN
DECLARE @NRTIPRAGGR SMALLINT
DECLARE @I SMALLINT
DECLARE @RESULT VARCHAR(7)
DECLARE @TIPOLOGIA VARCHAR(3)

IF CHARINDEX('#',@CODICEARTICOLO)>0 
    BEGIN
    SET @CODICEARTICOLO=LEFT(@CODICEARTICOLO,CHARINDEX('#',@CODICEARTICOLO)-1)
    END

SELECT @NRTIPRAGGR=NRTIPRAGGRUPPATE FROM ANAGRAFICAARTICOLI WHERE CODICE = @CODICEARTICOLO

SET @RESULT=''
IF @NRTIPRAGGR>0 
    BEGIN
    DECLARE CUR_TIP CURSOR FOR SELECT CODTIPOLOGIA FROM TIPOLOGIEARTICOLI WHERE CODICEART=@CODICEARTICOLO ORDER BY NUMEROTIP DESC
    OPEN CUR_TIP
    FETCH NEXT FROM CUR_TIP INTO @TIPOLOGIA
    SET @I=1
    WHILE @@FETCH_STATUS=0 AND @I<=@NRTIPRAGGR
        BEGIN
        IF @RESULT <> ''
            BEGIN
            SET @RESULT=@RESULT+';'
            END
        SET @RESULT=@RESULT+@TIPOLOGIA
        SET @I=@I+1
        FETCH NEXT FROM CUR_TIP INTO @TIPOLOGIA
        END
    CLOSE CUR_TIP
    DEALLOCATE CUR_TIP
    END
RETURN @RESULT
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GETTIPRAGGR] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GETTIPRAGGR] TO [Metodo98]
    AS [dbo];

