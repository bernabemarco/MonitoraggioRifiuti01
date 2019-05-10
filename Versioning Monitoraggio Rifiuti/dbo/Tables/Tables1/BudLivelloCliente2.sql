CREATE TABLE [dbo].[BudLivelloCliente2] (
    [Codice]          VARCHAR (5)   NOT NULL,
    [Descrizione]     VARCHAR (100) DEFAULT ('') NULL,
    [LivelloCliente1] VARCHAR (5)   DEFAULT ('') NULL,
    [Note]            VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica]  VARCHAR (25)  NOT NULL,
    [DataModifica]    DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudLivelloCliente2] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudLivelloCliente2] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudLivelloCliente2] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudLivelloCliente2] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudLivelloCliente2] TO [Metodo98]
    AS [dbo];

