
create PROCEDURE Mytho_GetUserEntities(
	@StatusCode INT
)AS
SELECT
	*
FROM
	dbo.Mytho_UserEntities
WHERE
	((StatusCode=@StatusCode AND @StatusCode IS NOT null) OR ( StatusCode IS NULL AND @StatusCode IS NULL))
ORDER BY 
	CreationDate ASC

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Mytho_GetUserEntities] TO [Metodo98]
    AS [dbo];

