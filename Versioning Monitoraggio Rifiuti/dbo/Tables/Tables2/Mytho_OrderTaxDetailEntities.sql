CREATE TABLE [dbo].[Mytho_OrderTaxDetailEntities] (
    [OrderTaxDetailEntityId] BIGINT          IDENTITY (1, 1) NOT NULL,
    [OrderOxId]              INT             NOT NULL,
    [TaxRate]                DECIMAL (19, 6) NULL,
    [TotalNetTaxExcl]        DECIMAL (19, 6) NULL,
    [TotalNetVATAmount]      DECIMAL (19, 6) NULL,
    CONSTRAINT [PK_OrderTaxDetailentities] PRIMARY KEY CLUSTERED ([OrderTaxDetailEntityId] ASC),
    CONSTRAINT [FK_OrderTaxDetailEntities_OrderEntities] FOREIGN KEY ([OrderOxId]) REFERENCES [dbo].[Mytho_OrderEntities] ([OrderOxId]) ON DELETE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Mytho_OrderTaxDetailEntities] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Mytho_OrderTaxDetailEntities] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Mytho_OrderTaxDetailEntities] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Mytho_OrderTaxDetailEntities] TO [Metodo98]
    AS [dbo];

