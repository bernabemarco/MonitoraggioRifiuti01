
CREATE PROCEDURE Mytho_BeforeSyncUsers
AS
/*
--Test
UPDATE dbo.Mytho_UserEntities SET 
	StatusCode=NULL,
	ExecutedDate=NULL,
	ErrorDetails=NULL,
	UserOxID=NULL
*/

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Mytho_BeforeSyncUsers] TO [Metodo98]
    AS [dbo];

