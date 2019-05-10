CREATE TABLE [dbo].[PL_Packing_ElencoArtXIMB] (
    [RifProgressivo] DECIMAL (18)    NOT NULL,
    [NrRiga]         INT             NOT NULL,
    [RifRiga]        INT             DEFAULT ((0)) NULL,
    [UDS]            VARCHAR (25)    DEFAULT ('') NULL,
    [NrPackage]      VARCHAR (100)   DEFAULT ('') NULL,
    [CodImballo]     VARCHAR (10)    DEFAULT ('') NULL,
    [DscImballo]     VARCHAR (80)    DEFAULT ('') NULL,
    [NrPackageArt]   VARCHAR (100)   DEFAULT ('') NULL,
    [Articolo]       VARCHAR (50)    NULL,
    [DscArt]         VARCHAR (254)   DEFAULT ('') NULL,
    [NrRifPartita]   VARCHAR (15)    DEFAULT ('') NULL,
    [RifCommessa]    VARCHAR (30)    DEFAULT ('') NULL,
    [Qta]            DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [UM]             VARCHAR (3)     NULL,
    [intra]          VARCHAR (8)     DEFAULT ('') NULL,
    [PesoNetto]      DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [PesoLordo]      DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [Volume]         DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [CodComposto]    VARCHAR (50)    DEFAULT ('') NULL,
    [PesoBil]        DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    [PesoLetto]      DECIMAL (16, 6) DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [NrRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PL_Packing_ElencoArtXIMB] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PL_Packing_ElencoArtXIMB] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PL_Packing_ElencoArtXIMB] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PL_Packing_ElencoArtXIMB] TO [Metodo98]
    AS [dbo];

