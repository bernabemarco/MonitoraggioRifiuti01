CREATE TABLE [dbo].[TP_TIPIAGPV] (
    [Entita]   CHAR (7) NOT NULL,
    [Priorita] SMALLINT NULL,
    CONSTRAINT [PK_TP_TIPIAGPV] PRIMARY KEY CLUSTERED ([Entita] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_TIPIAGPV] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_TIPIAGPV] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_TIPIAGPV] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_TIPIAGPV] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_TIPIAGPV] TO [Metodo98]
    AS [dbo];

