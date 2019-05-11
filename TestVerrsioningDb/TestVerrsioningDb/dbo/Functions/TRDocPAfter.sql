﻿
CREATE FUNCTION TRDocPAfter(@IDSESSIONE DECIMAL(5, 0)) RETURNS @TRACCIABILITADOC TABLE  
    (
        ID              DECIMAL(10, 0) IDENTITY (1, 1),
        LIVELLO             SMALLINT,
        RIFDOC               VARCHAR(20),
        PROGRESSIVO         DECIMAL(10, 0),
        IDRIGA              DECIMAL(10, 0),
        PROGRESSIVOPREL     DECIMAL(10, 0),
        IDRIGAPREL          DECIMAL(10, 0)
    )
AS
BEGIN
    DECLARE @TMPRIFDOC VARCHAR(100)
    DECLARE @I SMALLINT
    DECLARE @TMP VARCHAR(MAX)
    DECLARE @PROGRESSIVO DECIMAL(10, 0)

    SET @PROGRESSIVO = (SELECT TOP 1 PROGRESSIVO FROM TMPTRACCDOCPRELEVATI WHERE IDSESSIONE=@IDSESSIONE)
    SET @TMP = dbo.DocPAfter(@PROGRESSIVO,0,0,0,0)
    WHILE @TMP <> ''
        BEGIN
        SET @I = CHARINDEX(';', @TMP)
        IF @I > 0 
            BEGIN
            SET @TMPRIFDOC = LEFT(@TMP, @I - 1)
            SET @TMP = SUBSTRING(@TMP, @I + 1, LEN(@TMP) - LEN(@TMPRIFDOC))
            END
        ELSE
            BEGIN
            SET @TMPRIFDOC = @TMP
            SET @TMP = ''
            END
        INSERT INTO @TRACCIABILITADOC(LIVELLO,RIFDOC,PROGRESSIVO,IDRIGA,PROGRESSIVOPREL,IDRIGAPREL) 
        SELECT   CAST(LEFT(@TMPRIFDOC,2) AS SMALLINT),
                 SUBSTRING(@TMPRIFDOC,36,20),
                 CAST(SUBSTRING(@TMPRIFDOC,4,10) AS DECIMAL(10,0)),
                 CAST(SUBSTRING(@TMPRIFDOC,26,4) AS SMALLINT),
                 CAST(SUBSTRING(@TMPRIFDOC,15,10) AS DECIMAL(10,0)),
                 CAST(SUBSTRING(@TMPRIFDOC,31,4) AS SMALLINT)
        END 
    RETURN
END

GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TRDocPAfter] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TRDocPAfter] TO [Metodo98]
    AS [dbo];
