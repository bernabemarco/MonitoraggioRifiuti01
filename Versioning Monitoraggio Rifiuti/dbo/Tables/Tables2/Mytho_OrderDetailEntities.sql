CREATE TABLE [dbo].[Mytho_OrderDetailEntities] (
    [OrderDetailEntityId]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [OrderOxId]             INT             NOT NULL,
    [Attribute1Name]        NVARCHAR (50)   NULL,
    [Attribute1Value]       NVARCHAR (50)   NULL,
    [Attribute2Name]        NVARCHAR (50)   NULL,
    [Attribute2Value]       NVARCHAR (50)   NULL,
    [AttributeTextName]     NVARCHAR (100)  NULL,
    [AttributeTextValue]    NVARCHAR (100)  NULL,
    [DiscountCoupon]        NVARCHAR (20)   NULL,
    [DiscountRate]          DECIMAL (19, 6) NULL,
    [EcoTaxValueTaxIncl]    DECIMAL (19, 6) NULL,
    [GrossAmount]           DECIMAL (19, 6) NULL,
    [GrossPrice]            DECIMAL (19, 6) NULL,
    [ItemMainImageUrl]      NVARCHAR (MAX)  NULL,
    [ItemName]              NVARCHAR (100)  NULL,
    [ItemOxID]              INT             NULL,
    [ItemSKU]               NVARCHAR (40)   NULL,
    [ItemSKUOriginal]       NVARCHAR (40)   NULL,
    [ItemThumbnailImageUrl] NVARCHAR (MAX)  NULL,
    [NetAmount]             DECIMAL (19, 6) NULL,
    [NetPrice]              DECIMAL (19, 6) NULL,
    [Offered]               BIT             NULL,
    [Option1Name]           NVARCHAR (50)   NULL,
    [Option1Value]          NVARCHAR (50)   NULL,
    [Option2Name]           NVARCHAR (50)   NULL,
    [Option2Value]          NVARCHAR (50)   NULL,
    [Option3Name]           NVARCHAR (50)   NULL,
    [Option3Value]          NVARCHAR (50)   NULL,
    [Quantity]              INT             NULL,
    [TaxRate]               DECIMAL (19, 6) NULL,
    [VATAmount]             DECIMAL (19, 6) NULL,
    CONSTRAINT [PK_OrderDetailEntities] PRIMARY KEY CLUSTERED ([OrderDetailEntityId] ASC),
    CONSTRAINT [FK_OrderDetailEntities_OrderEntities] FOREIGN KEY ([OrderOxId]) REFERENCES [dbo].[Mytho_OrderEntities] ([OrderOxId]) ON DELETE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Mytho_OrderDetailEntities] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Mytho_OrderDetailEntities] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Mytho_OrderDetailEntities] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Mytho_OrderDetailEntities] TO [Metodo98]
    AS [dbo];

