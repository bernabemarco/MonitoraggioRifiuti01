﻿
create PROCEDURE Mytho_AddOrderEntity(
	@OrderOxId INT,
	@BillingAddress	nvarchar(255),
	@BillingAddressBuilding	nvarchar(38),
	@BillingAddressFloor	nvarchar(38),
	@BillingAddressL1	nvarchar(60),
	@BillingAddressL2	nvarchar(60),
	@BillingAddressL3	nvarchar(60),
	@BillingAddressL4	nvarchar(60),
	@BillingAddressOtherInfo	nvarchar(38),
	@BillingAddressStreet	nvarchar(38),
	@BillingCellPhone	nvarchar(30),
	@BillingCity	nvarchar(30),
	@BillingCompany	nvarchar(50),
	@BillingCountryISOCode	nvarchar(2),
	@BillingCountryName	nvarchar(50),
	@BillingFax	nvarchar(30),
	@BillingPhone	nvarchar(30),
	@BillingState	nvarchar(30),
	@BillingTitle	nvarchar(5),
	@BillingZipCode	nvarchar(20),
	@CartCoupon	nvarchar(20),
	@CompanyVATNumber	nvarchar(50),
	@CurrencyCode	nvarchar(3),
	@EcoTaxAmountTaxIncl	decimal(19, 6),
	@EcoTaxIncluded	BIT,
	@FiscalCode	nvarchar(30),
	@GlobalDiscountAmount	decimal(19, 6),
	@GlobalDiscountRate	decimal(19, 6),
	@InternalNote	nvarchar(250),
	@InvoiceDate	DATETIME,
	@InvoiceFileName	nvarchar(50),
	@InvoiceURL	nvarchar(MAX),
	@InvoiceID	nvarchar(25),
	@Language	nvarchar(2),
	@LogisticsServiceProviderAccess	DATETIME,
	@LogisticsServiceProviderInstructions	nvarchar(100),
	@PaymentMethodName	nvarchar(100),
	@PaymentStatusLastModifiedDate	DATETIME,
	@PMProcessorCode	INT,
	@ProgressStateID	INT,
	@RemoteIPAddr	nvarchar(50),
	@SalesRepCode	nvarchar(50),
	@SalesRepFirstName	nvarchar(30),
	@SalesRepLastName	nvarchar(50),
	@ShippingAddress	nvarchar(255),
	@ShippingAddressBuilding	nvarchar(38),
	@ShippingAddressFloor	nvarchar(38),
	@ShippingAddressL1	nvarchar(60),
	@ShippingAddressL2	nvarchar(60),
	@ShippingAddressL3	nvarchar(60),
	@ShippingAddressL4	nvarchar(60),
	@ShippingAddressOtherInfo	nvarchar(38),
	@ShippingAddressStreet	nvarchar(38),
	@ShippingCity	nvarchar(30),
	@ShippingCompany	nvarchar(50),
	@ShippingCountryISOCode	nvarchar(2),
	@ShippingCountryName	nvarchar(50),
	@ShippingFirstName	nvarchar(30),
	@ShippingID	INT,
	@ShippingInfo	nvarchar(255),
	@ShippingLastName	nvarchar(50),
	@ShippingMethodName	nvarchar(100),
	@ShippingParam1	nvarchar(10)
)AS





--Cancello eventuali ordini precedenti
DELETE FROM dbo.Mytho_OrderEntities WHERE OrderOxId=@OrderOxId

--Inserisco l'ordine
INSERT INTO dbo.Mytho_OrderEntities(
	OrderOxId,
	MetodoImportedState,
	MetodoImportedRef,
	BillingAddress,
	BillingAddressBuilding,
	BillingAddressFloor,
	BillingAddressL1,
	BillingAddressL2,
	BillingAddressL3,
	BillingAddressL4,
	BillingAddressOtherInfo,
	BillingAddressStreet,
	BillingCellPhone,
	BillingCity,
	BillingCompany,
	BillingCountryISOCode,
	BillingCountryName,
	BillingFax,
	BillingPhone,
	BillingState,
	BillingTitle,
	BillingZipCode,
	CartCoupon,
	CompanyVATNumber,
	CurrencyCode,
	EcoTaxAmountTaxIncl,
	EcoTaxIncluded,
	FiscalCode,
	GlobalDiscountAmount,
	GlobalDiscountRate,
	InternalNote,
	InvoiceDate,
	InvoiceFileName,
	InvoiceURL,
	InvoiceID,
	Language,
	LogisticsServiceProviderAccess,
	LogisticsServiceProviderInstructions,
	PaymentMethodName,
	PaymentStatusLastModifiedDate,
	PMProcessorCode,
	ProgressStateID,
	RemoteIPAddr,
	SalesRepCode,
	SalesRepFirstName,
	SalesRepLastName,
	ShippingAddress,
	ShippingAddressBuilding,
	ShippingAddressFloor,
	ShippingAddressL1,
	ShippingAddressL2,
	ShippingAddressL3,
	ShippingAddressL4,
	ShippingAddressOtherInfo,
	ShippingAddressStreet,
	ShippingCity,
	ShippingCompany,
	ShippingCountryISOCode,
	ShippingCountryName,
	ShippingFirstName,
	ShippingID,
	ShippingInfo,
	ShippingLastName,
	ShippingMethodName,
	ShippingParam1
)VALUES(
	@OrderOxId,
	0,
	NULL,
	@BillingAddress,
	@BillingAddressBuilding,
	@BillingAddressFloor,
	@BillingAddressL1,
	@BillingAddressL2,
	@BillingAddressL3,
	@BillingAddressL4,
	@BillingAddressOtherInfo,
	@BillingAddressStreet,
	@BillingCellPhone,
	@BillingCity,
	@BillingCompany,
	@BillingCountryISOCode,
	@BillingCountryName,
	@BillingFax,
	@BillingPhone,
	@BillingState,
	@BillingTitle,
	@BillingZipCode,
	@CartCoupon,
	@CompanyVATNumber,
	@CurrencyCode,
	@EcoTaxAmountTaxIncl,
	@EcoTaxIncluded,
	@FiscalCode,
	@GlobalDiscountAmount,
	@GlobalDiscountRate,
	@InternalNote,
	@InvoiceDate,
	@InvoiceFileName,
	@InvoiceURL,
	@InvoiceID,
	@Language,
	@LogisticsServiceProviderAccess,
	@LogisticsServiceProviderInstructions,
	@PaymentMethodName,
	@PaymentStatusLastModifiedDate,
	@PMProcessorCode,
	@ProgressStateID,
	@RemoteIPAddr,
	@SalesRepCode,
	@SalesRepFirstName,
	@SalesRepLastName,
	@ShippingAddress,
	@ShippingAddressBuilding,
	@ShippingAddressFloor,
	@ShippingAddressL1,
	@ShippingAddressL2,
	@ShippingAddressL3,
	@ShippingAddressL4,
	@ShippingAddressOtherInfo,
	@ShippingAddressStreet,
	@ShippingCity,
	@ShippingCompany,
	@ShippingCountryISOCode,
	@ShippingCountryName,
	@ShippingFirstName,
	@ShippingID,
	@ShippingInfo,
	@ShippingLastName,
	@ShippingMethodName,
	@ShippingParam1	
)

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Mytho_AddOrderEntity] TO [Metodo98]
    AS [dbo];
