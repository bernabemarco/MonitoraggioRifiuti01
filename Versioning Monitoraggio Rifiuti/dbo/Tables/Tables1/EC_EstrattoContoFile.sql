CREATE TABLE [dbo].[EC_EstrattoContoFile] (
    [ABIBanca]       VARCHAR (6)     NULL,
    [ContoCorrente]  VARCHAR (15)    DEFAULT ('') NOT NULL,
    [DataOpBanca]    DATETIME        NULL,
    [DataValuta]     DATETIME        NULL,
    [Importo]        DECIMAL (19, 4) NULL,
    [Segno]          SMALLINT        DEFAULT ((0)) NOT NULL,
    [CausaleABI]     VARCHAR (5)     DEFAULT ('') NOT NULL,
    [NrAssegno]      VARCHAR (50)    DEFAULT ('') NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [CliForGen]      VARCHAR (7)     DEFAULT ('') NOT NULL,
    [RagioneSociale] VARCHAR (150)   DEFAULT ('') NOT NULL,
    [CfOPiva]        VARCHAR (16)    DEFAULT ('') NOT NULL,
    [RecordRaw]      VARCHAR (650)   DEFAULT ('') NOT NULL,
    [Progressivo]    DECIMAL (10)    NOT NULL,
    [CodFlusso]      DECIMAL (10)    NOT NULL,
    [CodBanca]       VARCHAR (7)     NOT NULL,
    CONSTRAINT [PK_EC_EstrattoContoFile_Progressivo_CodFlusso_CodBanca] PRIMARY KEY CLUSTERED ([Progressivo] ASC, [CodFlusso] ASC, [CodBanca] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EC_EstrattoContoFile] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EC_EstrattoContoFile] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EC_EstrattoContoFile] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EC_EstrattoContoFile] TO [Metodo98]
    AS [dbo];

