
create PROCEDURE Mytho_GetProductEntities(
	@StatusCode INT
)AS
SELECT
	*
FROM
	dbo.Mytho_ProductEntities
WHERE
	((StatusCode=@StatusCode AND @StatusCode IS NOT null) OR ( StatusCode IS NULL AND @StatusCode IS NULL))
ORDER BY 
	CreationDate ASC

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Mytho_GetProductEntities] TO [Metodo98]
    AS [dbo];

