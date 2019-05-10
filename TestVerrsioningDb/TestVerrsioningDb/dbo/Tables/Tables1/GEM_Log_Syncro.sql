CREATE TABLE [dbo].[GEM_Log_Syncro] (
    [PROGRESSIVO]  INT            IDENTITY (1, 1) NOT NULL,
    [Note]         VARCHAR (1000) NULL,
    [DATAMODIFICA] DATETIME       CONSTRAINT [DF_GEM_LOGSYNCRO_DATAMODIFICA] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_GEM_Log_Syncro] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_Log_Syncro] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_Log_Syncro] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_Log_Syncro] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Log_Syncro] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_Log_Syncro] TO [Metodo98]
    AS [dbo];

