
CREATE PROCEDURE EliminaConstraintTP(@NomeTabella VarChar(100), @NomeCampo VarChar(100), @TYPE VARCHAR(2)) AS
	BEGIN
		
		DECLARE @dftDaCancellare  	VARCHAR(100)
		DECLARE @stringa 			VARCHAR(200)
		
		SET @dftDaCancellare =	(SELECT
									TOP 1 name
								FROM
								(
								SELECT 
									o.name,
									o.type,
									OBJECT_NAME(o.parent_object_id) as TableName,
									ISNULL(i.column_name,(SELECT name FROM sys.columns WHERE OBJECT_NAME(default_object_id) = o.name)) As ColumnName
								FROM 
									sys.objects o
								LEFT JOIN 
									INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE i
										ON i.constraint_name = o.name
								) TemaColumnInformation
								WHERE
									TableName = @NomeTabella And
									ColumnName = @NomeCampo And
									Type = @TYPE)
		
		SET @stringa = 'ALTER TABLE ' + @NomeTabella + ' DROP CONSTRAINT '  + @dftDaCancellare
		EXEC (@stringa)
		
	END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[EliminaConstraintTP] TO [Metodo98]
    AS [dbo];

