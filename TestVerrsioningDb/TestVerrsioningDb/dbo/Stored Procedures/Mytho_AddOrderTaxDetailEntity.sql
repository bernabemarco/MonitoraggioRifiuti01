
create PROCEDURE Mytho_AddOrderTaxDetailEntity(
	@OrderOxId INT,
	@TaxRate DECIMAL(19, 6),
	@TotalNetTaxExcl DECIMAL(19, 6),
	@TotalNetVATAmount DECIMAL(19, 6)
)AS

INSERT INTO dbo.Mytho_OrderTaxDetailEntities(
	OrderOxId,
    TaxRate,
    TotalNetTaxExcl,
    TotalNetVATAmount
)VALUES (
	@OrderOxId,
    @TaxRate , -- TaxRate - decimal
    @TotalNetTaxExcl , -- TotalNetTaxExcl - decimal
    @TotalNetVATAmount  -- TotalNetVATAmount - decimal
)

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Mytho_AddOrderTaxDetailEntity] TO [Metodo98]
    AS [dbo];

