CREATE TABLE [dbo].[TP_TipidiSconto] (
    [Codice]         SMALLINT     NOT NULL,
    [Descrizione]    VARCHAR (50) NULL,
    [FlagTipo]       SMALLINT     NULL,
    [UtenteModifica] VARCHAR (25) NULL,
    [DataModifica]   DATETIME     NULL,
    CONSTRAINT [PK_TP_TipidiSconto] PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_TipidiSconto] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_TipidiSconto] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_TipidiSconto] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_TipidiSconto] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_TipidiSconto] TO [Metodo98]
    AS [dbo];

