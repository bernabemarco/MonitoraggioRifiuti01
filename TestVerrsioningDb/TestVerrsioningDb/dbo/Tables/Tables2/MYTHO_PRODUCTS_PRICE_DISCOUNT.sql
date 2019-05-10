﻿CREATE TABLE [dbo].[MYTHO_PRODUCTS_PRICE_DISCOUNT] (
    [IDREGOLA]          DECIMAL (18)    IDENTITY (1, 1) NOT NULL,
    [PROGRESSIVOREGOLA] DECIMAL (18)    NOT NULL,
    [TIPOREGOLA]        SMALLINT        NOT NULL,
    [CODCLIFOR]         VARCHAR (7)     NOT NULL,
    [CODART]            VARCHAR (50)    NOT NULL,
    [UM]                VARCHAR (3)     NOT NULL,
    [QTA]               DECIMAL (16, 6) NOT NULL,
    [PREZZO]            DECIMAL (19, 6) NOT NULL,
    [SCONTO]            VARCHAR (255)   NOT NULL,
    [INIZIOVALIDITA]    DATETIME        NOT NULL,
    [FINEVALIDITA]      DATETIME        NOT NULL,
    [UTENTEMODIFICA]    VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]      DATETIME        NOT NULL,
    [TIPO]              SMALLINT        CONSTRAINT [DF_MYTHO_PRODUCT_TIPO] DEFAULT ((0)) NULL,
    [SCONTIESTESIXML]   VARCHAR (1000)  CONSTRAINT [DF_MYTHO_PRODUCT_SCONTIESTESIXML] DEFAULT ('') NOT NULL,
    [TipoPrezzo]        BIT             CONSTRAINT [DF_MYTHO_PRODUCT_TipoPrezzo] DEFAULT ((0)) NOT NULL,
    [Destinazione]      DECIMAL (5)     CONSTRAINT [DF_MYTHO_PRODUCT_Destinazione] DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([IDREGOLA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[MYTHO_PRODUCTS_PRICE_DISCOUNT] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MYTHO_PRODUCTS_PRICE_DISCOUNT] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MYTHO_PRODUCTS_PRICE_DISCOUNT] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MYTHO_PRODUCTS_PRICE_DISCOUNT] TO [Metodo98]
    AS [dbo];

