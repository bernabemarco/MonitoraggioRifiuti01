

CREATE PROCEDURE [dbo].[Proc_Vendors_MakeQuery](@IdSessione Decimal(5,0),@CodAgente varchar(7),@Query varchar(max))
AS

BEGIN

DECLARE @SqlStatement   As Varchar(MAX)
    
    SET @SqlStatement = 'declare @xml varchar(max);WITH XMLNAMESPACES (''uri'' as z,''uri''AS rs) SELECT @xml = (SELECT * FROM (@@STATEMENT@@) AS RS FOR XML RAW (''z:row''),ROOT(''rs:data''));SELECT  replace(replace(@xml,''<rs:data xmlns:rs="uri" xmlns:z="uri">'',''''),''</rs:data>'','''')'
    SET @SqlStatement = REPLACE(@SqlStatement,'@@STATEMENT@@',@Query)
    
    PRINT @SqlStatement
    
    EXEC(@SqlStatement)

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Proc_Vendors_MakeQuery] TO [Metodo98]
    AS [dbo];

