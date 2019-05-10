
CREATE PROCEDURE Mytho_BeforeGetOrders
AS


DELETE FROM dbo.Mytho_OrderEntities

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Mytho_BeforeGetOrders] TO [Metodo98]
    AS [dbo];

