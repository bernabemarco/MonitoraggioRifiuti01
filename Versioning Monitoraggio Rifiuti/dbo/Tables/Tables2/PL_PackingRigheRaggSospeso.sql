CREATE TABLE [dbo].[PL_PackingRigheRaggSospeso] (
    [RifProgressivo]    DECIMAL (18)    NOT NULL,
    [TipoRiga]          CHAR (1)        NOT NULL,
    [Esercizio]         DECIMAL (5)     NOT NULL,
    [CodRaggruppamento] NUMERIC (18)    NOT NULL,
    [Articolo]          VARCHAR (50)    NULL,
    [Um]                VARCHAR (3)     NULL,
    [Imballo]           VARCHAR (10)    NULL,
    [ImballoPeso]       DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [ImballoAltezza]    DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [ImballoLunghezza]  DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [ImballoProfondita] DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [ImballoQta]        DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [Qta]               DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [Colli]             DECIMAL (16)    DEFAULT ((0)) NULL,
    [Da]                DECIMAL (16)    DEFAULT ((0)) NULL,
    [A]                 DECIMAL (16)    DEFAULT ((0)) NULL,
    [PesoNetto]         DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [PesoLordo]         DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [Volume]            DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [Intra]             VARCHAR (8)     DEFAULT ('') NULL,
    [NumEtichette]      NUMERIC (18)    DEFAULT ((0)) NULL,
    [TipologiaRiga]     CHAR (1)        NULL,
    [DESCRIZIONEART]    VARCHAR (254)   NULL,
    [NRRIFPARTITA]      VARCHAR (15)    DEFAULT ('') NULL,
    [RIFCOMMESSA]       VARCHAR (30)    DEFAULT ('') NULL,
    [NrRiga]            INT             DEFAULT ((0)) NULL,
    [RifProgConf]       DECIMAL (18)    DEFAULT ((0)) NULL,
    [RifRigaConf]       INT             DEFAULT ((0)) NULL,
    [RifxCanc]          INT             DEFAULT ((0)) NULL,
    [Riferimento]       VARCHAR (50)    DEFAULT ('') NULL,
    [IdDesc]            DECIMAL (18)    NULL,
    [IDCFGIMB]          DECIMAL (18)    NULL,
    [IDTESTA]           DECIMAL (10)    NULL,
    [IDRIGA]            INT             NULL,
    [SHIPPINGMARK]      VARCHAR (100)   NULL,
    [RAGGPADRE]         VARCHAR (80)    NULL,
    [TIPO]              SMALLINT        NULL,
    [PESOLETTO]         SMALLINT        DEFAULT ((0)) NULL,
    [IDSessione]        DECIMAL (5)     NOT NULL,
    [Legame]            DECIMAL (18)    NOT NULL,
    [CodArtPadre]       VARCHAR (50)    NULL,
    [UTENTEMODIFICA]    VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]      DATETIME        NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PL_PackingRigheRaggSospeso] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PL_PackingRigheRaggSospeso] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PL_PackingRigheRaggSospeso] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PL_PackingRigheRaggSospeso] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PL_PackingRigheRaggSospeso] TO [Metodo98]
    AS [dbo];

