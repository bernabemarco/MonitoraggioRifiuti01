
CREATE FUNCTION RifOrdPrelevati(@PROGRESSIVO DECIMAL(10, 0), @LIVELLO SMALLINT, @PARAMETRI VARCHAR(MAX)) RETURNS VARCHAR(MAX)  
AS
BEGIN
    DECLARE @DOCPREL DECIMAL(10, 0)
    DECLARE @PRECDOCPREL DECIMAL(10, 0)
    DECLARE @IDRIGA DECIMAL(10, 0)
    DECLARE @RIFDOC VARCHAR(MAX)
    DECLARE @RIFCONTRATTODOC VARCHAR(30)
    DECLARE @DOCORDPREL VARCHAR(30)
    DECLARE @RIFCOMMCLI VARCHAR(30)
    DECLARE @TMP VARCHAR(MAX)
    DECLARE @TIPODOC VARCHAR(1)
    DECLARE @CLIFOR VARCHAR(1)
    DECLARE @RIGHE VARCHAR(MAX)
    DECLARE @TIPOPARCF VARCHAR(1)
    DECLARE @I SMALLINT
    DECLARE CUR_DOC CURSOR FAST_FORWARD READ_ONLY FOR SELECT IDTESTARP,(SELECT TIPO FROM PARAMETRIDOC WHERE CODICE=TIPODOC),(CAST(ESERCIZIO AS VARCHAR(4))+LEFT(TIPODOC+SPACE(3),3)+RIGHT('0000000000'+CAST(NUMERODOC AS VARCHAR(10)),10)+BIS),IDRIGA,RIFCOMMCLI, (SELECT CLIFOR FROM PARAMETRIDOC WHERE CODICE=TIPODOC) FROM RIGHEDOCUMENTI WHERE (IDTESTA=@PROGRESSIVO) AND (IDTESTARP IS NOT NULL) AND (TIPORIGA<>'R') AND (TIPORIGA<>'D') ORDER BY IDTESTARP,IDRIGARP

    SET @RIFDOC = ''
    SET @PRECDOCPREL = 0
    SET @RIGHE = ''
    SET @TIPOPARCF = ''
    IF @PARAMETRI <> ''
        BEGIN
        SET @I = CHARINDEX('|', @PARAMETRI)
        SET @RIGHE = LEFT(@PARAMETRI, @I - 1)
        SET @TIPOPARCF = SUBSTRING(@PARAMETRI, @I + 1, LEN(@PARAMETRI) - LEN(@RIGHE))
        END
    IF @LIVELLO < 30 
        BEGIN
        OPEN CUR_DOC
        FETCH CUR_DOC INTO @DOCPREL, @TIPODOC, @RIFCONTRATTODOC, @IDRIGA, @RIFCOMMCLI, @CLIFOR
        IF (@CLIFOR <> @TIPOPARCF) AND (@TIPOPARCF <> '')
            BEGIN
            SET @DOCORDPREL = ''
            END
        ELSE
            BEGIN
            IF (@RIFCOMMCLI <> '') AND (@CLIFOR = 'C')
                BEGIN
                IF dbo.ECF_RifCommCli(@RIFCOMMCLI)=1
                    BEGIN
                    SET @DOCORDPREL = @RIFCOMMCLI
                    END
                ELSE
                    BEGIN
                    SET @DOCORDPREL = @RIFCONTRATTODOC
                    END
                END
            ELSE
                BEGIN
                SET @DOCORDPREL = @RIFCONTRATTODOC
                END
            WHILE @@FETCH_STATUS = 0
                BEGIN
                IF (CHARINDEX(','+CAST(@IDRIGA AS VARCHAR(4))+',', @RIGHE) > 0) OR (@RIGHE = '')
                    BEGIN
                    IF @TIPODOC = 'O' 
                        BEGIN
                        IF CHARINDEX(@DOCORDPREL, @RIFDOC) = 0 SET @RIFDOC = @RIFDOC + @DOCORDPREL + ';'
                        END
                    END
                IF (@DOCPREL <> 0) AND ((CHARINDEX(','+CAST(@IDRIGA AS VARCHAR(4))+',', @RIGHE) > 0) OR (@RIGHE = '')) AND (@PRECDOCPREL <> @DOCPREL)
                    BEGIN
                    SET @TMP = dbo.RifOrdPrelevati(@DOCPREL, @LIVELLO + 1, dbo.RighePrelevate(@PROGRESSIVO, @RIGHE)+'|'+@CLIFOR)
                    IF @TMP <> '' SET @RIFDOC = @RIFDOC + @TMP
                    SET @PRECDOCPREL = @DOCPREL
                    END
                FETCH NEXT FROM CUR_DOC INTO @DOCPREL, @TIPODOC, @RIFCONTRATTODOC , @IDRIGA, @RIFCOMMCLI, @CLIFOR
                IF (@RIFCOMMCLI <> '') AND (@CLIFOR = 'C')
                    BEGIN
                    IF dbo.ECF_RifCommCli(@RIFCOMMCLI)=1
                        BEGIN
                        SET @DOCORDPREL = @RIFCOMMCLI
                        END
                    ELSE
                        BEGIN
                        SET @DOCORDPREL = @RIFCONTRATTODOC
                        END
                    END
                ELSE
                    BEGIN
                    SET @DOCORDPREL = @RIFCONTRATTODOC
                    END
                END
            END
        CLOSE CUR_DOC
        DEALLOCATE CUR_DOC
        IF @LIVELLO = 0
            BEGIN
            IF @RIFDOC = '' 
                BEGIN
                SET @RIFDOC = @DOCORDPREL
                END
            ELSE    
                BEGIN
                SET @RIFDOC = dbo.ParseDoc(@RIFDOC)
                END 
            IF RIGHT(@RIFDOC, 1) = ';' SET @RIFDOC = LEFT(@RIFDOC, LEN(@RIFDOC) - 1)
            END 
        END
    IF @RIFDOC IS NULL SET @RIFDOC = ''
    RETURN @RIFDOC
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[RifOrdPrelevati] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[RifOrdPrelevati] TO [Metodo98]
    AS [dbo];

