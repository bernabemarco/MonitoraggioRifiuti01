CREATE TABLE [dbo].[EXTRATESTEFOGLICOMMCLI] (
    [PROGRESSIVO]          DECIMAL (10)    NOT NULL,
    [UTENTEMODIFICA]       VARCHAR (25)    NULL,
    [DATAMODIFICA]         DATETIME        NOT NULL,
    [ResponsabileCommessa] VARCHAR (80)    DEFAULT ('') NULL,
    [ALDFattoreK]          DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [ReferenteCliente]     VARCHAR (100)   NULL,
    [RifOffCRM]            VARCHAR (30)    NULL,
    [SiglaSconto]          VARCHAR (10)    NULL,
    [SedeIntervento]       VARCHAR (255)   NULL,
    [IdDivisione]          SMALLINT        DEFAULT ((0)) NULL,
    [CodPagamento]         VARCHAR (4)     NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EXTRATESTEFOGLICOMMCLI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EXTRATESTEFOGLICOMMCLI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[EXTRATESTEFOGLICOMMCLI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EXTRATESTEFOGLICOMMCLI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EXTRATESTEFOGLICOMMCLI] TO [Metodo98]
    AS [dbo];

