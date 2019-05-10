
create PROCEDURE Mytho_UpdateProductEntityStatus(
	@OxId INT,
	@ProductEntityId BIGINT,
	@StatusCode INT,
	@ErrorDetails nvarchar(MAX)
)AS

UPDATE 
	dbo.Mytho_ProductEntities 
SET
	ProductOxId=@OxId,
	StatusCode=@StatusCode,
	ExecutedDate=GETDATE(),
	ErrorDetails=@ErrorDetails
WHERE
	ProductEntityId=@ProductEntityId

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Mytho_UpdateProductEntityStatus] TO [Metodo98]
    AS [dbo];

