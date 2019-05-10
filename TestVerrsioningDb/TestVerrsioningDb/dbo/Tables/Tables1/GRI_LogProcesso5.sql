CREATE TABLE [dbo].[GRI_LogProcesso5] (
    [Progressivo]    DECIMAL (10)  NOT NULL,
    [DATALANCIO]     DATETIME      NOT NULL,
    [Descrizione]    VARCHAR (255) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    CONSTRAINT [GRI_LogProcesso5_PK] PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GRI_LogProcesso5] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GRI_LogProcesso5] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GRI_LogProcesso5] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GRI_LogProcesso5] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GRI_LogProcesso5] TO [Metodo98]
    AS [dbo];

