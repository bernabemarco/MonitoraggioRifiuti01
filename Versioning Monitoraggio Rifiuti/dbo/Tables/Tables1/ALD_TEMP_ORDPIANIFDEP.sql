CREATE TABLE [dbo].[ALD_TEMP_ORDPIANIFDEP] (
    [TipoDoc]               VARCHAR (3)     NOT NULL,
    [CodDep]                VARCHAR (10)    NOT NULL,
    [CodFor]                VARCHAR (7)     NOT NULL,
    [CodArt]                VARCHAR (50)    NOT NULL,
    [IDSESSIONE]            DECIMAL (5)     NOT NULL,
    [IDTESTARP]             DECIMAL (10)    NOT NULL,
    [IDRIGARP]              INT             NOT NULL,
    [UTENTEMODIFICA]        VARCHAR (50)    NOT NULL,
    [DATAMODIFICA]          DATETIME        NOT NULL,
    [Qta]                   DECIMAL (18, 6) NULL,
    [DATACONSEGNA]          DATETIME        NULL,
    [DATACONSEGNARICHIESTA] DATETIME        NULL,
    [CHK]                   SMALLINT        CONSTRAINT [DF_ALD_TEMP_ORDPIANIFDEP_CHK] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_ALD_TEMP_ORDPIANIFDEP] PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [IDTESTARP] ASC, [IDRIGARP] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TEMP_ORDPIANIFDEP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TEMP_ORDPIANIFDEP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TEMP_ORDPIANIFDEP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TEMP_ORDPIANIFDEP] TO [Metodo98]
    AS [dbo];

