CREATE TABLE [dbo].[TP_GOI_TMP] (
    [CodArt]   VARCHAR (50)    NOT NULL,
    [Deposito] VARCHAR (10)    NOT NULL,
    [Giacenza] NUMERIC (16, 6) NOT NULL,
    [Utente]   VARCHAR (25)    NOT NULL,
    CONSTRAINT [PK_TP_GOI_TMP] PRIMARY KEY NONCLUSTERED ([CodArt] ASC, [Deposito] ASC, [Utente] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_GOI_TMP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_GOI_TMP] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_GOI_TMP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_GOI_TMP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_GOI_TMP] TO [Metodo98]
    AS [dbo];

