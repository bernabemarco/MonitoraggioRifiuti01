

CREATE PROCEDURE Mytho_UpdateUserEntityStatus(
	@OxId INT,
	@UserEntityId BIGINT,
	@StatusCode INT,
	@ErrorDetails nvarchar(MAX)
)AS

UPDATE 
	dbo.Mytho_UserEntities 
SET
	UserOxId=@OxId,
	StatusCode=@StatusCode,
	ExecutedDate=GETDATE(),
	ErrorDetails=@ErrorDetails
WHERE
	UserEntityId=@UserEntityId

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Mytho_UpdateUserEntityStatus] TO [Metodo98]
    AS [dbo];

