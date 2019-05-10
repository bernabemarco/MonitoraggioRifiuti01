CREATE TABLE [dbo].[GEM_ParametriSync] (
    [PROGRESSIVO] INT          IDENTITY (1, 1) NOT NULL,
    [DATASYNC]    DATETIME     NOT NULL,
    [TABELLASYNC] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_GEM_ParametriSync] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_ParametriSync] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_ParametriSync] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_ParametriSync] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_ParametriSync] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_ParametriSync] TO [Metodo98]
    AS [dbo];

