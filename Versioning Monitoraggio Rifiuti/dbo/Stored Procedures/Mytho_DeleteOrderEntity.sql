
create PROCEDURE Mytho_DeleteOrderEntity(
	@OrderOxId INT
)
AS
DELETE FROM dbo.Mytho_OrderEntities WHERE OrderOxId=@OrderOxId

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Mytho_DeleteOrderEntity] TO [Metodo98]
    AS [dbo];

