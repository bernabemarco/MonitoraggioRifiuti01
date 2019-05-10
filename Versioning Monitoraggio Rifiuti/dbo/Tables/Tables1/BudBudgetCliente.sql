CREATE TABLE [dbo].[BudBudgetCliente] (
    [Stagione]          VARCHAR (3)     NOT NULL,
    [AnnoStagione]      VARCHAR (3)     NOT NULL,
    [TipologiaProdotto] VARCHAR (5)     NOT NULL,
    [Ambiente]          DECIMAL (5)     NOT NULL,
    [TipoCliente]       VARCHAR (5)     NOT NULL,
    [Cliente]           VARCHAR (7)     NOT NULL,
    [Quantita]          DECIMAL (16, 6) DEFAULT (0) NULL,
    [Percentuale]       DECIMAL (16, 6) DEFAULT (0) NULL,
    [Valore]            DECIMAL (19, 6) DEFAULT (0) NULL,
    [PercentualeV]      DECIMAL (16, 6) DEFAULT (0) NULL,
    [UtenteModifica]    VARCHAR (25)    NOT NULL,
    [DataModifica]      DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Stagione] ASC, [AnnoStagione] ASC, [TipologiaProdotto] ASC, [Ambiente] ASC, [TipoCliente] ASC, [Cliente] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudBudgetCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudBudgetCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudBudgetCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudBudgetCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudBudgetCliente] TO [Metodo98]
    AS [dbo];

