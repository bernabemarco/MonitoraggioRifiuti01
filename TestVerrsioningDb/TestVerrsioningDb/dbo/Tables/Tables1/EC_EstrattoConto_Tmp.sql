CREATE TABLE [dbo].[EC_EstrattoConto_Tmp] (
    [RifLink]         VARCHAR (7)     DEFAULT ('') NOT NULL,
    [ABIBanca]        VARCHAR (6)     NULL,
    [ContoCorrente]   VARCHAR (15)    DEFAULT ('') NOT NULL,
    [DataOpBanca]     DATETIME        NULL,
    [DataValuta]      DATETIME        NULL,
    [Importo]         DECIMAL (19, 4) NULL,
    [Segno]           SMALLINT        DEFAULT ((0)) NOT NULL,
    [CausaleABI]      VARCHAR (5)     DEFAULT ('') NOT NULL,
    [NrAssegno]       VARCHAR (50)    DEFAULT ('') NOT NULL,
    [Stato]           SMALLINT        DEFAULT ((0)) NOT NULL,
    [SelGenMov]       SMALLINT        DEFAULT ((0)) NOT NULL,
    [SelRiconc]       SMALLINT        DEFAULT ((0)) NOT NULL,
    [RowKey]          VARBINARY (100) NULL,
    [IsNew]           SMALLINT        DEFAULT ((0)) NOT NULL,
    [UTENTEMODIFICA]  VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]    DATETIME        NOT NULL,
    [CliForGen]       VARCHAR (7)     DEFAULT ('') NOT NULL,
    [RifMovimento]    DECIMAL (18)    DEFAULT ((0)) NOT NULL,
    [ImportoScadenza] DECIMAL (19, 4) DEFAULT ((0)) NOT NULL,
    [IDSessione]      DECIMAL (5)     NOT NULL,
    [Progressivo]     DECIMAL (10)    NOT NULL,
    [CodFlusso]       DECIMAL (10)    NOT NULL,
    [CodBanca]        VARCHAR (7)     NOT NULL,
    CONSTRAINT [PK_EC_EstrattoConto_Tmp_Progressivo] PRIMARY KEY CLUSTERED ([IDSessione] ASC, [Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EC_EstrattoConto_Tmp] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EC_EstrattoConto_Tmp] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EC_EstrattoConto_Tmp] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EC_EstrattoConto_Tmp] TO [Metodo98]
    AS [dbo];

