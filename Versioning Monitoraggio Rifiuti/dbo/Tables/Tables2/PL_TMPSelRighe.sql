CREATE TABLE [dbo].[PL_TMPSelRighe] (
    [Progressivo]         DECIMAL (19)    NOT NULL,
    [Esercizio]           DECIMAL (5)     NOT NULL,
    [NumeroMiss]          DECIMAL (9)     DEFAULT ((0)) NULL,
    [DescrizMiss]         VARCHAR (70)    DEFAULT ('') NULL,
    [DataMiss]            DATETIME        NULL,
    [TipoDoc]             VARCHAR (3)     DEFAULT ('') NULL,
    [NumeroDoc]           DECIMAL (10)    DEFAULT ((0)) NULL,
    [Bis]                 CHAR (1)        DEFAULT ('') NULL,
    [DataDoc]             DATETIME        NULL,
    [TipoRiga]            CHAR (1)        DEFAULT ('') NULL,
    [CodCliFor]           VARCHAR (7)     NOT NULL,
    [DestinazioneDiversa] DECIMAL (5)     DEFAULT ((0)) NULL,
    [RagSocDDM]           VARCHAR (80)    DEFAULT ('') NULL,
    [IndirizzoDDM]        VARCHAR (80)    DEFAULT ('') NULL,
    [CapDDM]              VARCHAR (8)     DEFAULT ('') NULL,
    [LocalitaDDM]         VARCHAR (80)    DEFAULT ('') NULL,
    [ProvinciaDDM]        VARCHAR (80)    DEFAULT ('') NULL,
    [CodArt]              VARCHAR (50)    DEFAULT ('') NULL,
    [DescArt]             VARCHAR (80)    DEFAULT ('') NULL,
    [Um]                  VARCHAR (3)     DEFAULT ('') NULL,
    [Qta]                 DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [PesoTot]             DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [NrRifPartita]        VARCHAR (15)    DEFAULT ('') NULL,
    [RifCommessa]         VARCHAR (30)    DEFAULT ('') NULL,
    [ProgrMiss]           DECIMAL (10)    DEFAULT ((0)) NULL,
    [IDTesta]             DECIMAL (10)    DEFAULT ((0)) NULL,
    [IDRiga]              INT             DEFAULT ((0)) NULL,
    [InPL]                SMALLINT        DEFAULT ((0)) NULL,
    [IDSessione]          DECIMAL (5)     DEFAULT ((0)) NULL,
    [UTENTEMODIFICA]      VARCHAR (50)    NOT NULL,
    [DATAMODIFICA]        DATETIME        NOT NULL,
    CONSTRAINT [PK_PL_TMPSelRighe] PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PL_TMPSelRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PL_TMPSelRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PL_TMPSelRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PL_TMPSelRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PL_TMPSelRighe] TO [Metodo98]
    AS [dbo];

