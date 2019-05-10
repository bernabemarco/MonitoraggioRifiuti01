CREATE TABLE [dbo].[TabOpeVend] (
    [Codice]         DECIMAL (18)  NOT NULL,
    [Descrizione]    VARCHAR (100) NOT NULL,
    [CodiceBadge]    VARCHAR (13)  NOT NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    [CODCONTO]       VARCHAR (7)   DEFAULT ('') NULL,
    [STATO]          SMALLINT      DEFAULT (0) NOT NULL,
    CONSTRAINT [PK_TabOpeVend] PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TabOpeVend] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TabOpeVend] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TabOpeVend] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TabOpeVend] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TabOpeVend] TO [Metodo98]
    AS [dbo];

