CREATE TABLE [dbo].[TP_TabCategorieRaee] (
    [Codice]         NUMERIC (10)  NOT NULL,
    [Descrizione]    VARCHAR (250) NOT NULL,
    [UtenteModifica] VARCHAR (25)  NULL,
    [DataModifica]   DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_TabCategorieRaee] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_TabCategorieRaee] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_TabCategorieRaee] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_TabCategorieRaee] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_TabCategorieRaee] TO [Metodo98]
    AS [dbo];

