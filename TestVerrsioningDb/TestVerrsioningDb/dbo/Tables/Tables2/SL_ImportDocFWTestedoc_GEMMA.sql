CREATE TABLE [dbo].[SL_ImportDocFWTestedoc_GEMMA] (
    [IdTesta]             INT           NOT NULL,
    [NUMRIFDOC]           VARCHAR (15)  NULL,
    [TipoDoc]             VARCHAR (3)   NULL,
    [DataDoc]             SMALLDATETIME NULL,
    [MovPnImportato]      SMALLINT      NULL,
    [CodCliente]          VARCHAR (7)   NULL,
    [CodAgente1]          VARCHAR (7)   NULL,
    [CodAgente2]          VARCHAR (7)   NULL,
    [CodAgente3]          VARCHAR (7)   NULL,
    [CodPag]              VARCHAR (4)   NULL,
    [UTENTEMODIFICA]      VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]        DATETIME      NULL,
    [NUMDESTDIVERSAMERCI] DECIMAL (5)   CONSTRAINT [DF__SL_Import__NUMDE__68DFDCB9] DEFAULT ((0)) NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SL_ImportDocFWTestedoc_GEMMA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SL_ImportDocFWTestedoc_GEMMA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SL_ImportDocFWTestedoc_GEMMA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SL_ImportDocFWTestedoc_GEMMA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SL_ImportDocFWTestedoc_GEMMA] TO [Metodo98]
    AS [dbo];

