

CREATE PROCEDURE [dbo].[RefreshAllView] AS
BEGIN
    DECLARE tabelle_cursor CURSOR FOR SELECT name FROM sysobjects WHERE type='V' And (objectproperty(object_id(name), 'IsSchemaBound') = 0)

    OPEN tabelle_cursor
    declare @tabella varchar(256)
    FETCH NEXT FROM tabelle_cursor INTO @tabella
    WHILE @@FETCH_STATUS = 0
        BEGIN
            BEGIN TRY
                EXEC SP_REFRESHVIEW @tabella
            END TRY
            BEGIN CATCH
                PRINT 'RefreshAllView : Errore nella vista ' + @tabella
            END CATCH
            FETCH NEXT FROM tabelle_cursor INTO @tabella
        END
    CLOSE tabelle_cursor

    DEALLOCATE tabelle_cursor

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[RefreshAllView] TO [Metodo98]
    AS [dbo];

