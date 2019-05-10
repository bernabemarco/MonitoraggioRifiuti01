CREATE TABLE [dbo].[ExtraCommCli] (
    [RifProgressivo]       DECIMAL (10)  NOT NULL,
    [UTENTEMODIFICA]       VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]         DATETIME      NOT NULL,
    [ResponsabileCommessa] VARCHAR (80)  DEFAULT ('') NULL,
    [REFERENTESEGRETERIA]  VARCHAR (50)  NULL,
    [RIFCANONEVARIABILE]   VARCHAR (50)  NULL,
    [RIF1CLIENTE]          VARCHAR (80)  NULL,
    [RIF2CLIENTE]          VARCHAR (80)  NULL,
    [RIF3CLIENTE]          VARCHAR (80)  NULL,
    [IdASA]                VARCHAR (2)   DEFAULT ('') NULL,
    [WBS1Societa]          VARCHAR (4)   DEFAULT ('') NULL,
    [WBS1Progressivo]      VARCHAR (5)   DEFAULT ('00000') NULL,
    [WBS2Gestione]         VARCHAR (2)   DEFAULT ('C-') NULL,
    [WBS3Servizio]         VARCHAR (2)   DEFAULT ('') NULL,
    [WBS3Provincia]        VARCHAR (2)   DEFAULT ('') NULL,
    [WBS3Regione]          VARCHAR (2)   DEFAULT ('') NULL,
    [WBS3DestDuso]         VARCHAR (9)   DEFAULT ('999') NULL,
    [WBS3Separatore]       VARCHAR (1)   CONSTRAINT [DF__ExtraComm__WBS3S__3B5A9FD9] DEFAULT ('-') NULL,
    [WBS4Prestazione]      VARCHAR (3)   DEFAULT ('') NULL,
    [WBS4Separatore]       VARCHAR (1)   CONSTRAINT [DF__ExtraComm__WBS4S__3D42E84B] DEFAULT ('-') NULL,
    [WBS5ModErogazione]    VARCHAR (1)   DEFAULT ('') NULL,
    [RespCid]              VARCHAR (8)   DEFAULT ('') NULL,
    [TipologiaCom]         VARCHAR (8)   DEFAULT ('') NULL,
    [NoteCommessa]         VARCHAR (255) DEFAULT ('') NULL,
    [StatoDocumentazione]  SMALLINT      DEFAULT ((1)) NULL,
    [dtFineCantiere]       DATETIME      NULL,
    [RefCoordComm]         SMALLINT      NULL,
    [DtRichiestaDM37]      DATETIME      NULL,
    [DtConsegnaDM37]       DATETIME      NULL,
    CONSTRAINT [ExtraCommCli_PK] PRIMARY KEY CLUSTERED ([RifProgressivo] ASC),
    CONSTRAINT [FK_EXTRACOMMCLI_RIFPROGRESSIVO] FOREIGN KEY ([RifProgressivo]) REFERENCES [dbo].[AnagraficaCommesse] ([Progressivo]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ExtraCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ExtraCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ExtraCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ExtraCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ExtraCommCli] TO [Metodo98]
    AS [dbo];

