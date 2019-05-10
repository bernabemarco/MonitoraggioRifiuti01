
CREATE PROCEDURE [dbo].[SL_RefreshAllView] AS
BEGIN
	
	DECLARE Viste_cursor CURSOR FOR SELECT name, crdate FROM sysobjects WHERE type='V' order by crdate

	OPEN Viste_cursor
	DECLARE @Vista varchar(256)
	DECLARE @Creata datetime
	DECLARE @ErrorMessage NVARCHAR(4000)

	PRINT 'Inizio esecuzione SL_RefreshAllView'
	PRINT ' '

	FETCH NEXT FROM Viste_cursor INTO @Vista, @Creata
	WHILE @@FETCH_STATUS = 0
		BEGIN
			PRINT CAST(@creata as varchar) + ' ' + @Vista 
			BEGIN TRANSACTION
			BEGIN TRY
				EXEC sp_refreshview @Vista
				COMMIT
			END TRY
			BEGIN CATCH
				--PRINT '*----> Errore in refresh ' + @Vista + ' - ' + ERROR_MESSAGE()
				
				SELECT @ErrorMessage = ERROR_MESSAGE()

				RAISERROR (N'*----> Errore in refresh %s - %s.', 11, 1, @Vista, @ErrorMessage)
				ROLLBACK
				
			END CATCH
			FETCH NEXT FROM Viste_cursor INTO @Vista, @Creata
		END
	
	CLOSE Viste_cursor
	DEALLOCATE Viste_cursor
	
	PRINT ' '
	PRINT 'Fine esecuzione SL_RefreshAllView'

END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SL_RefreshAllView] TO [Metodo98]
    AS [dbo];

