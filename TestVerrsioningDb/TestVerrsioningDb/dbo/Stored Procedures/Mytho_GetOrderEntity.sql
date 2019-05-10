
create PROCEDURE Mytho_GetOrderEntity(
	@OxId INT
)AS
SELECT 
	*
FROM 
	dbo.Mytho_OrderEntities 
WHERE
	OrderOxId=@OxId

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Mytho_GetOrderEntity] TO [Metodo98]
    AS [dbo];

