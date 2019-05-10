CREATE TABLE [dbo].[EC_EstrattoConto] (
    [Progressivo]    DECIMAL (18)    NOT NULL,
    [CodBanca]       VARCHAR (7)     NULL,
    [CodFlusso]      DECIMAL (10)    NOT NULL,
    [ABIBanca]       VARCHAR (6)     NULL,
    [ContoCorrente]  VARCHAR (50)    DEFAULT ('') NOT NULL,
    [DataOpBanca]    DATETIME        NULL,
    [DataValuta]     DATETIME        NULL,
    [Importo]        DECIMAL (19, 6) NULL,
    [Segno]          SMALLINT        DEFAULT ((0)) NOT NULL,
    [CausaleABI]     VARCHAR (20)    NULL,
    [NrAssegno]      VARCHAR (50)    DEFAULT ('') NOT NULL,
    [DataRiconc]     DATETIME        NULL,
    [Stato]          SMALLINT        DEFAULT ((0)) NOT NULL,
    [RowKey]         VARBINARY (100) NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [CliForGen]      VARCHAR (7)     DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_EC_EstrattoConto] PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EC_EstrattoConto] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EC_EstrattoConto] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EC_EstrattoConto] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EC_EstrattoConto] TO [Metodo98]
    AS [dbo];

