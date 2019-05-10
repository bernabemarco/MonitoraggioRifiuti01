CREATE TABLE [dbo].[MYTHO_UserEntities] (
    [UserEntityId]             BIGINT          NOT NULL,
    [Email]                    NVARCHAR (50)   NOT NULL,
    [ActionCode]               INT             NOT NULL,
    [CreationDate]             DATETIME        DEFAULT (getdate()) NOT NULL,
    [StatusCode]               INT             NULL,
    [ExecutedDate]             DATETIME        NULL,
    [ErrorDetails]             NVARCHAR (MAX)  NULL,
    [UserOxID]                 INT             NULL,
    [BillingAddress]           NVARCHAR (38)   NULL,
    [BillingAddressFloor]      NVARCHAR (38)   NULL,
    [BillingAddressL1]         NVARCHAR (60)   NULL,
    [BillingAddressL2]         NVARCHAR (60)   NULL,
    [BillingAddressL3]         NVARCHAR (60)   NULL,
    [BillingAddressL4]         NVARCHAR (60)   NULL,
    [BillingAddressOtherInfo]  NVARCHAR (38)   NULL,
    [BillingAddressStreet]     NVARCHAR (38)   NULL,
    [BillingCellPhone]         NVARCHAR (30)   NULL,
    [BillingCity]              NVARCHAR (30)   NULL,
    [BillingCountryISOCode]    NVARCHAR (2)    NULL,
    [BillingCountryName]       NVARCHAR (50)   NULL,
    [BillingFax]               NVARCHAR (30)   NULL,
    [BillingPhone]             NVARCHAR (30)   NULL,
    [BillingState]             NVARCHAR (30)   NULL,
    [BillingZipCode]           NVARCHAR (20)   NULL,
    [BirthDate]                DATETIME        NULL,
    [Category1Name]            NVARCHAR (255)  NULL,
    [Category1OxId]            INT             NULL,
    [Category1Language]        NVARCHAR (2)    NULL,
    [Category1ParentOxId]      INT             NULL,
    [Category2Name]            NVARCHAR (255)  NULL,
    [Category2OxId]            INT             NULL,
    [Category2Language]        NVARCHAR (2)    NULL,
    [Category2ParentOxId]      INT             NULL,
    [Category3Name]            NVARCHAR (255)  NULL,
    [Category3OxId]            INT             NULL,
    [Category3Language]        NVARCHAR (2)    NULL,
    [Category3ParentOxId]      INT             NULL,
    [Category4Name]            NVARCHAR (255)  NULL,
    [Category4OxId]            INT             NULL,
    [Category4Language]        NVARCHAR (2)    NULL,
    [Category4ParentOxId]      INT             NULL,
    [Comments]                 NVARCHAR (MAX)  NULL,
    [Company]                  NVARCHAR (50)   NULL,
    [CustomerAccount]          BIT             NULL,
    [Discount]                 DECIMAL (19, 6) NULL,
    [DiscountGridCode]         NVARCHAR (6)    NULL,
    [FirstName]                NVARCHAR (30)   NULL,
    [LastName]                 NVARCHAR (50)   NULL,
    [Password]                 NVARCHAR (20)   NULL,
    [PriceIndex]               INT             NULL,
    [RewardPoints]             INT             NULL,
    [SalesRepCode]             NVARCHAR (10)   NULL,
    [ShippingAddress]          NVARCHAR (255)  NULL,
    [ShippingAddressBuilding]  NVARCHAR (38)   NULL,
    [ShippingAddressFloor]     NVARCHAR (38)   NULL,
    [ShippingAddressL1]        NVARCHAR (60)   NULL,
    [ShippingAddressL2]        NVARCHAR (60)   NULL,
    [ShippingAddressL3]        NVARCHAR (60)   NULL,
    [ShippingAddressL4]        NVARCHAR (60)   NULL,
    [ShippingAddressOtherInfo] NVARCHAR (38)   NULL,
    [ShippingAddressStreet]    NVARCHAR (38)   NULL,
    [ShippingCity]             NVARCHAR (30)   NULL,
    [ShippingCompany]          NVARCHAR (50)   NULL,
    [ShippingCountryISOCode]   NVARCHAR (2)    NULL,
    [ShippingCountryName]      NVARCHAR (50)   NULL,
    [ShippingFirstName]        NVARCHAR (30)   NULL,
    [ShippingLastName]         NVARCHAR (50)   NULL,
    [ShippingPhone]            NVARCHAR (30)   NULL,
    [ShippingState]            NVARCHAR (30)   NULL,
    [ShippingTitle]            NVARCHAR (30)   NULL,
    [ShippingZipCode]          NVARCHAR (20)   NULL,
    [SubscribeToNewsLetters]   BIT             NULL,
    [SubscribeToSMSCampaign]   BIT             NULL,
    [UserLanguage]             NVARCHAR (2)    NULL,
    [VATNumber]                NVARCHAR (16)   NULL,
    [UTENTEMODIFICA]           VARCHAR (25)    DEFAULT (user_name()) NOT NULL,
    [DATAMODIFICA]             DATETIME        DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_MYTHO_UserEntities_UserEntityId] PRIMARY KEY CLUSTERED ([UserEntityId] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[MYTHO_UserEntities] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MYTHO_UserEntities] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MYTHO_UserEntities] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MYTHO_UserEntities] TO [Metodo98]
    AS [dbo];

