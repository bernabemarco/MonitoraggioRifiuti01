CREATE TABLE [dbo].[BudBudgetLivelloCliente3] (
    [Stagione]          VARCHAR (3)     NOT NULL,
    [AnnoStagione]      VARCHAR (3)     NOT NULL,
    [TipologiaProdotto] VARCHAR (5)     NOT NULL,
    [Ambiente]          DECIMAL (5)     NOT NULL,
    [LivelloCliente1]   VARCHAR (5)     NOT NULL,
    [LivelloCliente2]   VARCHAR (5)     NOT NULL,
    [LivelloCliente3]   VARCHAR (5)     NOT NULL,
    [Quantita]          DECIMAL (16, 6) DEFAULT (0) NULL,
    [Percentuale]       DECIMAL (16, 6) DEFAULT (0) NULL,
    [Valore]            DECIMAL (19, 6) DEFAULT (0) NULL,
    [PercentualeV]      DECIMAL (16, 6) DEFAULT (0) NULL,
    [UtenteModifica]    VARCHAR (25)    NOT NULL,
    [DataModifica]      DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Stagione] ASC, [AnnoStagione] ASC, [TipologiaProdotto] ASC, [Ambiente] ASC, [LivelloCliente1] ASC, [LivelloCliente2] ASC, [LivelloCliente3] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudBudgetLivelloCliente3] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudBudgetLivelloCliente3] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudBudgetLivelloCliente3] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudBudgetLivelloCliente3] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudBudgetLivelloCliente3] TO [Metodo98]
    AS [dbo];

