﻿
CREATE FUNCTION DocPBefore(@PROGRESSIVO DECIMAL(10, 0), @PROGRESSIVOINIZ DECIMAL(10, 0), @LIVELLO SMALLINT, @RIGA DECIMAL(10, 0), @IDRIGAORIGINE DECIMAL(10, 0)) RETURNS VARCHAR(MAX)
AS
BEGIN
    DECLARE @DOCPREL DECIMAL(10, 0)
    DECLARE @IDRIGA DECIMAL(10, 0)
    DECLARE @IDRIGARP DECIMAL(10, 0)
    DECLARE @RIFDOC VARCHAR(MAX)
    DECLARE @DOCORDPREL VARCHAR(20)
    DECLARE @TMP VARCHAR(MAX)
    DECLARE CUR_DOC CURSOR FAST_FORWARD READ_ONLY FOR SELECT IDTESTA,IDRIGA,(CAST(ESERCIZIO AS VARCHAR(4))+'-'+LEFT(TIPODOC+SPACE(3),3)+'-'+RIGHT('0000000000'+CAST(NUMERODOC AS VARCHAR(10)),10)+BIS) FROM RIGHEDOCUMENTI WHERE IDTESTARP=@PROGRESSIVO AND IDRIGARP=@RIGA AND TIPORIGA<>'R'

    SET @RIFDOC = ''
    IF @LIVELLO < 32 
        BEGIN
        OPEN CUR_DOC
        FETCH CUR_DOC INTO @DOCPREL, @IDRIGA, @DOCORDPREL
        IF (@LIVELLO = 0) AND (@PROGRESSIVOINIZ = @PROGRESSIVO) AND @@FETCH_STATUS = 0 
            BEGIN
            SET @RIFDOC = (SELECT (CAST(ESERCIZIO AS VARCHAR(4))+'-'+LEFT(TIPODOC+SPACE(3),3)+'-'+RIGHT('0000000000'+CAST(NUMERODOC AS VARCHAR(10)),10)+BIS) FROM TESTEDOCUMENTI WHERE PROGRESSIVO=@PROGRESSIVO)
            SET @RIFDOC = RIGHT('00'+CAST(@LIVELLO AS VARCHAR(2)),2) + '-' + RIGHT('0000000000'+CAST(@PROGRESSIVO AS VARCHAR(10)),10)+ '-' + RIGHT('0000000000'+CAST( @PROGRESSIVO AS VARCHAR(10)), 10) + '-' + RIGHT('0000'+CAST(@IDRIGAORIGINE AS VARCHAR(4)), 4) + '-' + RIGHT('0000'+CAST( @IDRIGAORIGINE AS VARCHAR(4)), 4) + '-' + @RIFDOC + ';'
            END
        IF @LIVELLO = 0 AND @@FETCH_STATUS = 0 SET @LIVELLO = -1
        WHILE @@FETCH_STATUS = 0
            BEGIN
            SET @RIFDOC = @RIFDOC + RIGHT('00'+CAST(@LIVELLO AS VARCHAR(2)),2) + '-' + RIGHT('0000000000'+CAST(@DOCPREL AS VARCHAR(10)),10)+ '-' + RIGHT('0000000000'+CAST( @PROGRESSIVOINIZ AS VARCHAR(10)), 10) + '-' + RIGHT('0000'+CAST( @IDRIGA AS VARCHAR(4)), 4) + '-' + RIGHT('0000'+CAST( @IDRIGAORIGINE AS VARCHAR(4)), 4) + '-' + @DOCORDPREL + ';'
            IF (@DOCPREL <> 0) 
                BEGIN
                SET @TMP = dbo.DocPBefore(@DOCPREL, @DOCPREL, @LIVELLO - 1, @IDRIGA, @IDRIGA)
                IF @TMP <> '' SET @RIFDOC = @RIFDOC + @TMP
                END
            FETCH NEXT FROM CUR_DOC INTO @DOCPREL, @IDRIGA, @DOCORDPREL
            END
        CLOSE CUR_DOC
        DEALLOCATE CUR_DOC
        END
    RETURN @RIFDOC
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[DocPBefore] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[DocPBefore] TO [Metodo98]
    AS [dbo];

