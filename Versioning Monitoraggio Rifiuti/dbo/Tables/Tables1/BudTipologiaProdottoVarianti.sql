CREATE TABLE [dbo].[BudTipologiaProdottoVarianti] (
    [Codice]         VARCHAR (5)   NOT NULL,
    [Tipologia1]     VARCHAR (3)   DEFAULT ('') NULL,
    [Tipologia2]     VARCHAR (3)   DEFAULT ('') NULL,
    [Tipologia3]     VARCHAR (3)   DEFAULT ('') NULL,
    [Tipologia4]     VARCHAR (3)   DEFAULT ('') NULL,
    [Tipologia5]     VARCHAR (3)   DEFAULT ('') NULL,
    [Note]           VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudTipologiaProdottoVarianti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudTipologiaProdottoVarianti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudTipologiaProdottoVarianti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudTipologiaProdottoVarianti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudTipologiaProdottoVarianti] TO [Metodo98]
    AS [dbo];

