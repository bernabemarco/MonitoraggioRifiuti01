CREATE TABLE [dbo].[BudTipologiaProdotto] (
    [Codice]         VARCHAR (5)   NOT NULL,
    [Descrizione]    VARCHAR (100) DEFAULT ('') NULL,
    [UM]             VARCHAR (3)   DEFAULT ('') NULL,
    [Note]           VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudTipologiaProdotto] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudTipologiaProdotto] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudTipologiaProdotto] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudTipologiaProdotto] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudTipologiaProdotto] TO [Metodo98]
    AS [dbo];

