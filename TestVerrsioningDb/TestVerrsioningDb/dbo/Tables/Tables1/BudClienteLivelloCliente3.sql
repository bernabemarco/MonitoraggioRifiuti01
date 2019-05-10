CREATE TABLE [dbo].[BudClienteLivelloCliente3] (
    [Cliente]         VARCHAR (7)  NOT NULL,
    [LivelloCliente3] VARCHAR (5)  DEFAULT ('') NULL,
    [UtenteModifica]  VARCHAR (25) NOT NULL,
    [DataModifica]    DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Cliente] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudClienteLivelloCliente3] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudClienteLivelloCliente3] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudClienteLivelloCliente3] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudClienteLivelloCliente3] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudClienteLivelloCliente3] TO [Metodo98]
    AS [dbo];

