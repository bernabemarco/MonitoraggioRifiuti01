CREATE TABLE [dbo].[GEM_LogProcesso5Righe] (
    [IdTesta]        DECIMAL (10)  NOT NULL,
    [IdRiga]         DECIMAL (10)  NOT NULL,
    [Descrizione]    VARCHAR (255) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    CONSTRAINT [GEM_LogProcesso5Righe_PK] PRIMARY KEY CLUSTERED ([IdTesta] ASC, [IdRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_LogProcesso5Righe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_LogProcesso5Righe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_LogProcesso5Righe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_LogProcesso5Righe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_LogProcesso5Righe] TO [Metodo98]
    AS [dbo];

