CREATE TABLE [dbo].[BudAmbientiBudgetDoc] (
    [Codice]         DECIMAL (5)  NOT NULL,
    [IDDocumento]    DECIMAL (10) DEFAULT (0) NOT NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC, [IDDocumento] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudAmbientiBudgetDoc] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudAmbientiBudgetDoc] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudAmbientiBudgetDoc] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudAmbientiBudgetDoc] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudAmbientiBudgetDoc] TO [Metodo98]
    AS [dbo];

