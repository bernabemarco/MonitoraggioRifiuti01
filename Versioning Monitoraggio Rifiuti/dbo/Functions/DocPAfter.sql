﻿
CREATE FUNCTION DocPAfter(@PROGRESSIVO DECIMAL(10, 0), @PROGRESSIVOINIZ DECIMAL(10, 0), @LIVELLO SMALLINT, @RIGA DECIMAL(10, 0), @IDRIGAORIGINE DECIMAL(10, 0)) RETURNS VARCHAR(MAX)
AS
BEGIN
    DECLARE @DOCPREL DECIMAL(10, 0)
    DECLARE @IDRIGA DECIMAL(10, 0)
    DECLARE @IDRIGARP DECIMAL(10, 0)
    DECLARE @RIFDOC VARCHAR(MAX)
    DECLARE @DOCORDPREL VARCHAR(20)
    DECLARE @TMP VARCHAR(MAX)
    DECLARE CUR_DOC CURSOR FAST_FORWARD READ_ONLY FOR SELECT IDTESTARP,(CAST(ESERCIZIO AS VARCHAR(4))+'-'+LEFT(TIPODOC+SPACE(3),3)+'-'+RIGHT('0000000000'+CAST(NUMERODOC AS VARCHAR(10)),10)+BIS),IDRIGA,IDRIGARP FROM RIGHEDOCUMENTI WHERE (IDTESTA=@PROGRESSIVO) AND (IDTESTARP IS NOT NULL) AND (IDRIGARP IS NOT NULL) AND TIPORIGA<>'R' ORDER BY IDTESTARP,IDRIGARP

    SET @RIFDOC = ''
    IF @LIVELLO < 32 
        BEGIN
        OPEN CUR_DOC
        FETCH CUR_DOC INTO @DOCPREL, @DOCORDPREL, @IDRIGA, @IDRIGARP
        WHILE @@FETCH_STATUS = 0
            BEGIN
            IF ((@IDRIGA = @RIGA) OR (@RIGA = 0)) 
                BEGIN
                IF ((@IDRIGAORIGINE = 0) AND (@DOCPREL > 0)) OR ((@IDRIGAORIGINE > 0) AND (@DOCPREL = 0)) OR ((@IDRIGAORIGINE > 0) AND (@DOCPREL > 0)) SET @RIFDOC = @RIFDOC + RIGHT('00'+CAST(@LIVELLO AS VARCHAR(2)),2) + '-' + RIGHT('0000000000'+CAST(@PROGRESSIVO AS VARCHAR(10)),10)+ '-' + RIGHT('0000000000'+CAST( @PROGRESSIVOINIZ AS VARCHAR(10)), 10) + '-' + RIGHT('0000'+CAST( @IDRIGA AS VARCHAR(4)), 4) + '-' + RIGHT('0000'+CAST( @IDRIGAORIGINE AS VARCHAR(4)), 4) + '-' + @DOCORDPREL + ';'
                END
            IF (@DOCPREL > 0) AND ((@IDRIGA = @RIGA) OR (@RIGA = 0)) 
                BEGIN
                SET @TMP = dbo.DocPAfter(@DOCPREL, @PROGRESSIVO, @LIVELLO + 1, @IDRIGARP, @IDRIGA)
                IF @TMP <> '' SET @RIFDOC = @RIFDOC + @TMP
                END
            FETCH NEXT FROM CUR_DOC INTO @DOCPREL, @DOCORDPREL, @IDRIGA, @IDRIGARP
            END
        CLOSE CUR_DOC
        DEALLOCATE CUR_DOC
        IF @LIVELLO = 0 
            BEGIN
            SET @RIFDOC = dbo.ParseDocPrel(@RIFDOC)
            IF RIGHT(@RIFDOC, 1) = ';' SET @RIFDOC = LEFT(@RIFDOC, LEN(@RIFDOC) - 1)
            END
        END
    RETURN @RIFDOC
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[DocPAfter] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[DocPAfter] TO [Metodo98]
    AS [dbo];
