CREATE TABLE [dbo].[TP_BLOCCO_ARTICOLI] (
    [Codice]       VARCHAR (50) NOT NULL,
    [Magazzino]    CHAR (10)    NOT NULL,
    [DataBlocco]   DATETIME     NULL,
    [UtenteBlocco] VARCHAR (25) NULL,
    CONSTRAINT [PK__TP_BLOCCO_ARTICOLI] PRIMARY KEY CLUSTERED ([Codice] ASC, [Magazzino] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_BLOCCO_ARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_BLOCCO_ARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_BLOCCO_ARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_BLOCCO_ARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_BLOCCO_ARTICOLI] TO [Metodo98]
    AS [dbo];

