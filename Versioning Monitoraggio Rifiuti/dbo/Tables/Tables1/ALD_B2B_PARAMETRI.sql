CREATE TABLE [dbo].[ALD_B2B_PARAMETRI] (
    [Codice]           INT           NOT NULL,
    [OutDir]           VARCHAR (250) NOT NULL,
    [OutDirInvio]      VARCHAR (250) NULL,
    [LogDir]           VARCHAR (250) NULL,
    [PathPerFattPAHTM] VARCHAR (250) NULL,
    [UTENTEMODIFICA]   VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]     DATETIME      NOT NULL,
    [PathPDF]          VARCHAR (250) NULL,
    [DirTemplate]      VARCHAR (250) NULL,
    [UrlPerFattPAHTM]  VARCHAR (250) NULL,
    CONSTRAINT [PK_ALD_B2B_PARAMETRI] PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_B2B_PARAMETRI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_B2B_PARAMETRI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_B2B_PARAMETRI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_B2B_PARAMETRI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_B2B_PARAMETRI] TO [Metodo98]
    AS [dbo];

