CREATE TABLE [dbo].[SL_ImportDocFWTestedoc] (
    [IdTesta]        INT           NOT NULL,
    [NUMRIFDOC]      VARCHAR (15)  NULL,
    [TipoDoc]        VARCHAR (3)   CONSTRAINT [DF__SL_Import__TipoD__0981B675] DEFAULT ('') NULL,
    [DataDoc]        SMALLDATETIME NULL,
    [MovPnImportato] BIT           CONSTRAINT [DF_SL_SL_ImportPNPaghe] DEFAULT (0) NULL,
    [CodCliente]     VARCHAR (7)   NULL,
    [CodAgente1]     VARCHAR (7)   NULL,
    [CodAgente2]     VARCHAR (7)   NULL,
    [CodAgente3]     VARCHAR (7)   NULL,
    [CodPag]         VARCHAR (4)   NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NULL,
    CONSTRAINT [PK_SL_ImportDocFWTestedoc] PRIMARY KEY CLUSTERED ([IdTesta] ASC, [UTENTEMODIFICA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SL_ImportDocFWTestedoc] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SL_ImportDocFWTestedoc] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SL_ImportDocFWTestedoc] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SL_ImportDocFWTestedoc] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SL_ImportDocFWTestedoc] TO [Metodo98]
    AS [dbo];

