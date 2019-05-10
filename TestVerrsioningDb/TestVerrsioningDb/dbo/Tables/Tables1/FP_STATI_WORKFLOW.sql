CREATE TABLE [dbo].[FP_STATI_WORKFLOW] (
    [Codice]         DECIMAL (5)   NOT NULL,
    [Descrizione]    VARCHAR (500) NULL,
    [Utentemodifica] VARCHAR (25)  NOT NULL,
    [Datamodifica]   DATETIME      NOT NULL,
    CONSTRAINT [PK_FP_STATI_WORKFLOW] PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FP_STATI_WORKFLOW] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FP_STATI_WORKFLOW] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FP_STATI_WORKFLOW] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FP_STATI_WORKFLOW] TO [Metodo98]
    AS [dbo];

