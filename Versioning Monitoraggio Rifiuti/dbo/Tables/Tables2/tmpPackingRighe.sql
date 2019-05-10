CREATE TABLE [dbo].[tmpPackingRighe] (
    [IDSessione]            DECIMAL (5)     NOT NULL,
    [RifProgressivo]        DECIMAL (10)    NOT NULL,
    [NrRiga]                INT             NOT NULL,
    [Esercizio]             DECIMAL (5)     NOT NULL,
    [FlagRiga]              SMALLINT        NULL,
    [Posizione]             INT             NULL,
    [CodiceArticolo]        VARCHAR (50)    NULL,
    [CodiceRaggruppamento]  DECIMAL (18)    NULL,
    [DescrizioneAggiuntiva] VARCHAR (50)    NULL,
    [Um]                    VARCHAR (3)     NULL,
    [Imballo]               VARCHAR (10)    NULL,
    [Qta]                   DECIMAL (16, 6) NULL,
    [Colli]                 DECIMAL (16)    NULL,
    [Da]                    DECIMAL (16)    NULL,
    [A]                     DECIMAL (16)    NULL,
    [PesoNetto]             DECIMAL (16, 6) NULL,
    [PesoLordo]             DECIMAL (16, 6) NULL,
    [Volume]                DECIMAL (16, 6) NULL,
    [Intra]                 VARCHAR (8)     NULL,
    [NumEtichette]          NUMERIC (18)    NULL,
    [TipoRiga]              CHAR (1)        NOT NULL,
    [UTENTEMODIFICA]        VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]          DATETIME        NOT NULL,
    [RifProgConf]           DECIMAL (18)    NULL,
    [RifRigaConf]           INT             NULL,
    [ImbH]                  DECIMAL (16, 6) NULL,
    [ImbL]                  DECIMAL (16, 6) NULL,
    [ImbP]                  DECIMAL (16, 6) NULL,
    [ImbPeso]               DECIMAL (16, 6) NULL,
    [Riferimento]           VARCHAR (50)    NULL,
    [Note]                  VARCHAR (200)   NULL,
    [IDCFGIMB]              DECIMAL (18)    CONSTRAINT [DF_TmpPackingRighe_IDCFGIMB] DEFAULT (0) NULL,
    [IdDesc]                DECIMAL (18)    NULL,
    [IDTESTA]               DECIMAL (10)    NULL,
    [IDRIGA]                INT             NULL,
    [SHIPPINGMARK]          VARCHAR (100)   NULL,
    [DESCRIZIONEART]        VARCHAR (80)    DEFAULT ('') NULL,
    CONSTRAINT [PK_tmpPackingRighe] PRIMARY KEY NONCLUSTERED ([IDSessione] ASC, [RifProgressivo] ASC, [NrRiga] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tmpPackingRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tmpPackingRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tmpPackingRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmpPackingRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tmpPackingRighe] TO [Metodo98]
    AS [dbo];

