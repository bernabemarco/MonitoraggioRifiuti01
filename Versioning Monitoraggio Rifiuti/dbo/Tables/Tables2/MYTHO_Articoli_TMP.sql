﻿CREATE TABLE [dbo].[MYTHO_Articoli_TMP] (
    [IdSessione]                          DECIMAL (5)     NULL,
    [Enabled]                             SMALLINT        DEFAULT ((0)) NOT NULL,
    [Changed]                             SMALLINT        CONSTRAINT [DF_MYTHO_Articoli_TMP_Changed] DEFAULT ((0)) NOT NULL,
    [CODICEMETODO]                        VARCHAR (50)    NOT NULL,
    [ItemSKU]                             NVARCHAR (20)   NULL,
    [CreationDate]                        DATETIME        NULL,
    [ExecutedDate]                        DATETIME        NULL,
    [ParentItemID]                        INT             NULL,
    [ParentItemSKU]                       NVARCHAR (20)   NULL,
    [ProductLanguage]                     NVARCHAR (2)    NULL,
    [ProductType]                         INT             NULL,
    [AdditionalImagesHeight]              SMALLINT        NULL,
    [AdditionalImagesThumbnailChangeMode] TINYINT         NULL,
    [AdditionalImagesThumbnailWidth]      SMALLINT        NULL,
    [AdditionalImagesWidth]               SMALLINT        NULL,
    [AdditionalImagesZoomHeight]          SMALLINT        NULL,
    [AdditionalImagesZoomPosition]        TINYINT         NULL,
    [AdditionalImagesZoomWidth]           SMALLINT        NULL,
    [BigImageFileName]                    NVARCHAR (100)  NULL,
    [BrandName]                           NVARCHAR (100)  NULL,
    [BrandOxID]                           INT             NULL,
    [CanonicalURLCustomizedContent]       NVARCHAR (100)  NULL,
    [Category1Name]                       NVARCHAR (255)  NULL,
    [Category1OxId]                       INT             NULL,
    [Category1Language]                   NVARCHAR (2)    NULL,
    [Category1ParentOxId]                 INT             NULL,
    [Category2Name]                       NVARCHAR (255)  NULL,
    [Category2OxId]                       INT             NULL,
    [Category2Language]                   NVARCHAR (2)    NULL,
    [Category2ParentOxId]                 INT             NULL,
    [Category3Name]                       NVARCHAR (255)  NULL,
    [Category3OxId]                       INT             NULL,
    [Category3Language]                   NVARCHAR (2)    NULL,
    [Category3ParentOxId]                 INT             NULL,
    [Cost]                                DECIMAL (19, 6) NULL,
    [DaysToShip]                          INT             NULL,
    [Description]                         NVARCHAR (MAX)  NULL,
    [DimensionHeight]                     INT             NULL,
    [DimensionLength]                     INT             NULL,
    [DimensionWidth]                      INT             NULL,
    [DiscountGridCode]                    NVARCHAR (6)    NULL,
    [EANCode]                             NVARCHAR (20)   NULL,
    [EcotaxTI]                            DECIMAL (19, 6) NULL,
    [Guarantee]                           TINYINT         NULL,
    [HandlingSurcharge1ST]                DECIMAL (19, 6) NULL,
    [HandlingSurchargeOthers]             DECIMAL (19, 6) NULL,
    [ItemCondition]                       TINYINT         NULL,
    [LinkedItemID]                        INT             NULL,
    [LinkedItemLanguage]                  NVARCHAR (2)    NULL,
    [LinkedItemSKU]                       NVARCHAR (20)   NULL,
    [LinkedUpdating]                      BIT             NULL,
    [LongDescription]                     NVARCHAR (MAX)  NULL,
    [MetaDescription]                     NVARCHAR (200)  NULL,
    [MetaKeywords]                        NVARCHAR (200)  NULL,
    [MetaTitle]                           NVARCHAR (100)  NULL,
    [MPN]                                 NVARCHAR (32)   NULL,
    [Name]                                NVARCHAR (100)  NULL,
    [OptionIsDefault]                     BIT             NULL,
    [OptionTypes1OxId]                    INT             NULL,
    [OptionTypes1Name]                    NVARCHAR (100)  NULL,
    [OptionTypes1SystemName]              NVARCHAR (100)  NULL,
    [OptionTypes2OxId]                    INT             NULL,
    [OptionTypes2Name]                    NVARCHAR (100)  NULL,
    [OptionTypes2SystemName]              NVARCHAR (100)  NULL,
    [OptionTypes3OxId]                    INT             NULL,
    [OptionTypes3Name]                    NVARCHAR (100)  NULL,
    [OptionTypes3SystemName]              NVARCHAR (100)  NULL,
    [OptionValues1OxId]                   INT             NULL,
    [OptionValues1Code]                   NVARCHAR (50)   NULL,
    [OptionValues1Name]                   NVARCHAR (100)  NULL,
    [OptionValues2OxId]                   INT             NULL,
    [OptionValues2Code]                   NVARCHAR (50)   NULL,
    [OptionValues2Name]                   NVARCHAR (100)  NULL,
    [OptionValues3OxId]                   INT             NULL,
    [OptionValues3Code]                   NVARCHAR (50)   NULL,
    [OptionValues3Name]                   NVARCHAR (100)  NULL,
    [Position]                            INT             NULL,
    [PriceValue]                          DECIMAL (19, 6) NULL,
    [PriceVATIncluded]                    BIT             NULL,
    [Price1Value]                         DECIMAL (19, 6) NULL,
    [Price1VATIncluded]                   BIT             NULL,
    [Price2Value]                         DECIMAL (19, 6) NULL,
    [Price2VATIncluded]                   BIT             NULL,
    [Price3Value]                         DECIMAL (19, 6) NULL,
    [Price3VATIncluded]                   BIT             NULL,
    [Price4Value]                         DECIMAL (19, 6) NULL,
    [Price4VATIncluded]                   BIT             NULL,
    [ReviewCount]                         INT             NULL,
    [ReviewRating]                        DECIMAL (19, 6) NULL,
    [QuantityInstockValue]                INT             NULL,
    [QuantityInstockAppend]               BIT             NULL,
    [QuantityReorderValue]                INT             NULL,
    [QuantityReorderAppend]               BIT             NULL,
    [SaleIfOutOfStock]                    BIT             NULL,
    [SaleIfOutOfStockScenario]            INT             NULL,
    [ShipPrice]                           DECIMAL (19, 6) NULL,
    [ShowDaysToship]                      BIT             NULL,
    [ShowIfOutOfStock]                    BIT             NULL,
    [ShowInStockNote]                     BIT             NULL,
    [ShowStockLevel]                      BIT             NULL,
    [SmallImgFileName]                    NVARCHAR (100)  NULL,
    [StrikethroughPriceValue]             DECIMAL (19, 6) NULL,
    [StrikethroughPriceVATIncluded]       BIT             NULL,
    [StrikethroughPrice1Value]            DECIMAL (19, 6) NULL,
    [StrikethroughPrice1VATIncluded]      BIT             NULL,
    [StrikethroughPrice2Value]            DECIMAL (19, 6) NULL,
    [StrikethroughPrice2VATIncluded]      BIT             NULL,
    [StrikethroughPrice3Value]            DECIMAL (19, 6) NULL,
    [StrikethroughPrice3VATIncluded]      BIT             NULL,
    [StrikethroughPrice4Value]            DECIMAL (19, 6) NULL,
    [StrikethroughPrice4VATIncluded]      BIT             NULL,
    [TaxCountryISOCode]                   NVARCHAR (2)    NULL,
    [TaxRate]                             DECIMAL (19, 6) NULL,
    [UnitsForSale]                        SMALLINT        NULL,
    [UnitsForSale1]                       SMALLINT        NULL,
    [UnitsForSale2]                       SMALLINT        NULL,
    [UnitsForSale3]                       SMALLINT        NULL,
    [UnitsForSale4]                       SMALLINT        NULL,
    [Visible]                             BIT             NULL,
    [Weight]                              INT             NULL,
    [UTENTEMODIFICA]                      VARCHAR (25)    DEFAULT (user_name()) NOT NULL,
    [DATAMODIFICA]                        DATETIME        DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_MYTHO_Articoli_TMP] PRIMARY KEY CLUSTERED ([CODICEMETODO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[MYTHO_Articoli_TMP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MYTHO_Articoli_TMP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MYTHO_Articoli_TMP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MYTHO_Articoli_TMP] TO [Metodo98]
    AS [dbo];

