CREATE TABLE [dbo].[FRCContiCoDir] (
    [Codice]         INT          NOT NULL,
    [Descrizione]    VARCHAR (80) DEFAULT ('') NULL,
    [Conto]          VARCHAR (7)  DEFAULT ('') NULL,
    [GiraSegno]      SMALLINT     DEFAULT ((0)) NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCContiCoDir] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCContiCoDir] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCContiCoDir] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCContiCoDir] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCContiCoDir] TO [Metodo98]
    AS [dbo];

