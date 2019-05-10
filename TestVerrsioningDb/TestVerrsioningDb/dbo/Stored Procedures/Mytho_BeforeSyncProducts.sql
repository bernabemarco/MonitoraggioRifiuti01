
create PROCEDURE Mytho_BeforeSyncProducts
AS
/*
UPDATE dbo.Mytho_ProductEntities SET
	StatusCode=NULL,
	ExecutedDate=NULL,
	ErrorDetails=NULL
WHERE 
	ProductEntityId=4
*/

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Mytho_BeforeSyncProducts] TO [Metodo98]
    AS [dbo];

