CREATE TABLE [dbo].[TabRaggrCes] (
    [Codice]         DECIMAL (5)   NOT NULL,
    [Descrizione]    VARCHAR (80)  NULL,
    [Note]           VARCHAR (255) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    CONSTRAINT [TabRaggrCes_PK] PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TabRaggrCes] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TabRaggrCes] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TabRaggrCes] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TabRaggrCes] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TabRaggrCes] TO [Metodo98]
    AS [dbo];

