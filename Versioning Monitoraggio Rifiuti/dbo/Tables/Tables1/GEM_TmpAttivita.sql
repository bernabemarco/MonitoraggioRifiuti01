CREATE TABLE [dbo].[GEM_TmpAttivita] (
    [idSessione]     INT             NOT NULL,
    [idAttivita]     DECIMAL (5)     NOT NULL,
    [SCONTO]         DECIMAL (16, 6) NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    CONSTRAINT [GEM_TmpAttivita_PK] PRIMARY KEY CLUSTERED ([idSessione] ASC, [idAttivita] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_TmpAttivita] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_TmpAttivita] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_TmpAttivita] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_TmpAttivita] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_TmpAttivita] TO [Metodo98]
    AS [dbo];

