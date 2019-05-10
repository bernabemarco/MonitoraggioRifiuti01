CREATE TABLE [dbo].[PL_Packing_ArtTmp] (
    [PROGRESSIVO]         DECIMAL (18)    IDENTITY (1, 1) NOT NULL,
    [IDSESSIONE]          DECIMAL (10)    NOT NULL,
    [PL]                  DECIMAL (19)    NULL,
    [CLIENTE]             VARCHAR (7)     NULL,
    [NUMDESTDIVERSAMERCI] DECIMAL (5)     NULL,
    [RagSocDDM]           VARCHAR (80)    DEFAULT ('') NULL,
    [IndirizzoDDM]        VARCHAR (80)    DEFAULT ('') NULL,
    [CapDDM]              VARCHAR (8)     DEFAULT ('') NULL,
    [LocalitaDDM]         VARCHAR (80)    DEFAULT ('') NULL,
    [ProvinciaDDM]        VARCHAR (80)    DEFAULT ('') NULL,
    [UDS]                 VARCHAR (25)    DEFAULT ('') NULL,
    [CODIMBALLO]          VARCHAR (10)    DEFAULT ('') NULL,
    [DSCIMBALLO]          VARCHAR (80)    DEFAULT ('') NULL,
    [NrPallet]            INT             NULL,
    [NrPackage]           VARCHAR (100)   DEFAULT ('') NULL,
    [NrPackageSel]        VARCHAR (100)   DEFAULT ('') NULL,
    [CODIMBALLOSel]       VARCHAR (10)    DEFAULT ('') NULL,
    [DSCIMBALLOSel]       VARCHAR (80)    DEFAULT ('') NULL,
    [ARTICOLO]            VARCHAR (50)    NULL,
    [DSCART]              VARCHAR (254)   DEFAULT ('') NULL,
    [NRRIFPARTITA]        VARCHAR (15)    DEFAULT ('') NULL,
    [RIFCOMMESSA]         VARCHAR (30)    DEFAULT ('') NULL,
    [QTA]                 DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [UM]                  VARCHAR (3)     NULL,
    [intra]               VARCHAR (8)     DEFAULT ('') NULL,
    [PesoNetto]           DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [PesoLordo]           DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [Volume]              DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [CodComposto]         VARCHAR (50)    DEFAULT ('') NULL,
    [IDRiga]              INT             DEFAULT ((0)) NULL,
    [PesoBil]             DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [UtenteModifica]      VARCHAR (25)    NOT NULL,
    [DataModifica]        DATETIME        NOT NULL,
    [PesoLetto]           DECIMAL (16, 6) DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PL_Packing_ArtTmp] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PL_Packing_ArtTmp] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PL_Packing_ArtTmp] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PL_Packing_ArtTmp] TO [Metodo98]
    AS [dbo];

