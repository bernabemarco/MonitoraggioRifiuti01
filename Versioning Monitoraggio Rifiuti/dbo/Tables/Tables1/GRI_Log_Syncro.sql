CREATE TABLE [dbo].[GRI_Log_Syncro] (
    [PROGRESSIVO]  INT            IDENTITY (1, 1) NOT NULL,
    [Note]         VARCHAR (1000) NULL,
    [DATAMODIFICA] DATETIME       CONSTRAINT [DF_GRI_LOGSYNCRO_DATAMODIFICA] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_GRI_Log_Syncro] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GRI_Log_Syncro] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GRI_Log_Syncro] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GRI_Log_Syncro] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GRI_Log_Syncro] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GRI_Log_Syncro] TO [Metodo98]
    AS [dbo];

