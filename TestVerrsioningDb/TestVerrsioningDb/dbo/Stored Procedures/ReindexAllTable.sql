CREATE PROCEDURE ReindexAllTable AS
	BEGIN
	DECLARE tabelle_cursor CURSOR FOR SELECT name FROM sysobjects WHERE type='U'
	OPEN tabelle_cursor
	declare @tabella varchar(256)
	FETCH NEXT FROM tabelle_cursor INTO @tabella
	WHILE @@FETCH_STATUS = 0
		BEGIN
			DBCC DBREINDEX (@tabella)
			FETCH NEXT FROM tabelle_cursor INTO @tabella
		END
	CLOSE tabelle_cursor
	DEALLOCATE tabelle_cursor
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[ReindexAllTable] TO [Metodo98]
    AS [dbo];

