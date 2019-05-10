CREATE TABLE [dbo].[TP_STATO_OF] (
    [Data]           DATETIME     NOT NULL,
    [ProgressivoDoc] NUMERIC (10) NULL,
    [Utente]         VARCHAR (30) NOT NULL,
    [Mag]            VARCHAR (10) NOT NULL,
    [Dep]            VARCHAR (7)  NOT NULL,
    [Fatt]           VARCHAR (7)  NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_STATO_OF] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_STATO_OF] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_STATO_OF] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_STATO_OF] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_STATO_OF] TO [Metodo98]
    AS [dbo];

