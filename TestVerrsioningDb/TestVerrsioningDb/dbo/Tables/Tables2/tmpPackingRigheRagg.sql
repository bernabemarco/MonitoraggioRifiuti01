CREATE TABLE [dbo].[tmpPackingRigheRagg] (
    [IDSessione]        DECIMAL (5)     NOT NULL,
    [RifProgressivo]    DECIMAL (18)    NOT NULL,
    [TipoRiga]          CHAR (1)        NOT NULL,
    [Esercizio]         DECIMAL (5)     NOT NULL,
    [CodRaggruppamento] NUMERIC (18)    NOT NULL,
    [Articolo]          VARCHAR (50)    NULL,
    [Raggruppamento]    NUMERIC (18)    NULL,
    [Um]                VARCHAR (3)     NULL,
    [Imballo]           VARCHAR (10)    NULL,
    [ImballoPeso]       DECIMAL (16, 6) NULL,
    [ImballoAltezza]    DECIMAL (16, 6) NULL,
    [ImballoLunghezza]  DECIMAL (16, 6) NULL,
    [ImballoProfondita] DECIMAL (16, 6) NULL,
    [ImballoQta]        DECIMAL (16, 6) NULL,
    [Qta]               DECIMAL (16, 6) NULL,
    [Colli]             DECIMAL (16)    NULL,
    [Da]                DECIMAL (16)    NULL,
    [A]                 DECIMAL (16)    NULL,
    [PesoNetto]         DECIMAL (16, 6) NULL,
    [PesoLordo]         DECIMAL (16, 6) NULL,
    [Volume]            DECIMAL (16, 6) NULL,
    [Intra]             VARCHAR (8)     NULL,
    [NumEtichette]      NUMERIC (18)    NULL,
    [TipologiaRiga]     CHAR (1)        NULL,
    [UTENTEMODIFICA]    VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]      DATETIME        NOT NULL,
    [NrRiga]            DECIMAL (18)    NULL,
    [flg]               SMALLINT        NULL,
    [RifProgConf]       DECIMAL (18)    NULL,
    [RifRigaConf]       INT             NULL,
    [RifxCanc]          INT             NULL,
    [Riferimento]       VARCHAR (50)    NULL,
    [IDCFGIMB]          DECIMAL (18)    NULL,
    [IdDesc]            DECIMAL (18)    NULL,
    [IDTESTA]           DECIMAL (10)    NULL,
    [IDRIGA]            INT             NULL,
    [SHIPPINGMARK]      VARCHAR (100)   NULL,
    [DESCRIZIONEART]    VARCHAR (80)    DEFAULT ('') NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tmpPackingRigheRagg] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tmpPackingRigheRagg] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tmpPackingRigheRagg] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmpPackingRigheRagg] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tmpPackingRigheRagg] TO [Metodo98]
    AS [dbo];

