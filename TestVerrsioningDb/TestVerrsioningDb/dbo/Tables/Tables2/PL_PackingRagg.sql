CREATE TABLE [dbo].[PL_PackingRagg] (
    [RifProgressivo]    DECIMAL (18)    NOT NULL,
    [RAGGPADRE]         VARCHAR (80)    NOT NULL,
    [RAGG]              VARCHAR (80)    NOT NULL,
    [TIPO]              SMALLINT        NOT NULL,
    [Imballo]           VARCHAR (10)    DEFAULT ('') NULL,
    [ImballoPeso]       DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [ImballoAltezza]    DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [ImballoLunghezza]  DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [ImballoProfondita] DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [ImballoQta]        DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [posizione]         INT             NULL,
    [nrpallet]          INT             NULL,
    [NumRelPackage]     VARCHAR (100)   DEFAULT ('') NULL,
    [PESOLETTO]         DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [UDS]               VARCHAR (25)    DEFAULT ('') NULL,
    [spuntato]          SMALLINT        DEFAULT ((0)) NULL,
    [PesoBil]           DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [UTENTEMODIFICA]    VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]      DATETIME        NOT NULL,
    CONSTRAINT [PK_PL_PackingRagg] PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [RAGGPADRE] ASC, [RAGG] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PL_PackingRagg] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PL_PackingRagg] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PL_PackingRagg] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PL_PackingRagg] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PL_PackingRagg] TO [Metodo98]
    AS [dbo];

