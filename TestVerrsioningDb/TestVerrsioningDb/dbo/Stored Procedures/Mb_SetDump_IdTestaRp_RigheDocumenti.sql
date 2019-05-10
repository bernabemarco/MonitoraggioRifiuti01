

CREATE Procedure [dbo].[Mb_SetDump_IdTestaRp_RigheDocumenti]
As
BEGIN


    DECLARE @SqlQuery       nVARCHAR(MAX)

    DECLARE @CommitSize int

    SET @CommitSize = 100000

    --Clean Table -----------------------------
    TRUNCATE TABLE MB_RisaliteDoc

    SET @SqlQuery = 'INSERT INTO MB_RisaliteDoc     
                    SELECT  top '+CONVERT(char, @CommitSize)+'   
                        DOCALL.Idtesta
                        ,DOCALL.IDRIGA
                        ,DOCALL.CLIORIG
                        ,DOCALL.CLIFATTORIG
                        ,DOCALL.DESTDIVMERCIORIG
                    FROM  MB_DocumentiValidiAll() DOCALL
                    LEFT OUTER JOIN MB_RisaliteDoc DOC
                    ON  DOCALL.IDTESTA = DOC.Idtesta
                    AND DOCALL.IDRIGA  = DOC.idriga 
                    WHERE DOC.Idtesta IS NULL'

    DECLARE @InitSize INT = @CommitSize

    WHILE @CommitSize = @InitSize
        BEGIN

          BEGIN TRAN

            EXEC sp_executesql  @SQLQuery

            SET @CommitSize = @@RowCount

          COMMIT TRAN

        END

END



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Mb_SetDump_IdTestaRp_RigheDocumenti] TO [Metodo98]
    AS [dbo];

