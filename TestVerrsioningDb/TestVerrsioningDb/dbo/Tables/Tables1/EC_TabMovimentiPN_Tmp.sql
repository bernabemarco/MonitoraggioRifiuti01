CREATE TABLE [dbo].[EC_TabMovimentiPN_Tmp] (
    [IDSessione]     DECIMAL (5)     NOT NULL,
    [Progressivo]    DECIMAL (10)    NOT NULL,
    [RifNrReg]       DECIMAL (10)    NOT NULL,
    [RifRiga]        VARCHAR (MAX)   NOT NULL,
    [RifLink]        VARCHAR (7)     DEFAULT ('') NOT NULL,
    [Descrizione]    VARCHAR (80)    NOT NULL,
    [CodBanca]       VARCHAR (7)     NOT NULL,
    [ContoCorrente]  VARCHAR (15)    DEFAULT ('') NOT NULL,
    [ABI]            VARCHAR (6)     DEFAULT ('') NOT NULL,
    [CAB]            VARCHAR (6)     DEFAULT ('') NOT NULL,
    [DataReg]        DATETIME        NOT NULL,
    [CodCausale]     DECIMAL (5)     NOT NULL,
    [CodCausAbiEC]   VARCHAR (5)     DEFAULT ('') NOT NULL,
    [Segno]          SMALLINT        NOT NULL,
    [Importo]        DECIMAL (19, 4) NOT NULL,
    [Stato]          SMALLINT        NOT NULL,
    [SelRiconc]      SMALLINT        DEFAULT ((0)) NOT NULL,
    [ExistsScad]     SMALLINT        DEFAULT ((0)) NOT NULL,
    [IsNew]          SMALLINT        DEFAULT ((1)) NOT NULL,
    [RifMovimento]   DECIMAL (18)    NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [CliForGen]      VARCHAR (7)     DEFAULT ('') NOT NULL,
    [Expand]         SMALLINT        DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_EC_TabMovimentiPN_Tmp] PRIMARY KEY CLUSTERED ([IDSessione] ASC, [Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EC_TabMovimentiPN_Tmp] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EC_TabMovimentiPN_Tmp] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EC_TabMovimentiPN_Tmp] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EC_TabMovimentiPN_Tmp] TO [Metodo98]
    AS [dbo];

