CREATE TABLE [dbo].[BudWBudgetModello] (
    [NrTerminale]    DECIMAL (5)     NOT NULL,
    [TipoCliente]    VARCHAR (5)     NOT NULL,
    [Famiglia]       VARCHAR (5)     NOT NULL,
    [TipoBudget]     VARCHAR (5)     NOT NULL,
    [ModelloBudget]  VARCHAR (5)     NOT NULL,
    [Modello]        VARCHAR (50)    NOT NULL,
    [Quantita]       DECIMAL (16, 6) DEFAULT (0) NULL,
    [Percentuale]    DECIMAL (16, 6) DEFAULT (0) NULL,
    [Valore]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [PercentualeV]   DECIMAL (16, 6) DEFAULT (0) NULL,
    [PrezzoMedio]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [TipoCliente] ASC, [Famiglia] ASC, [TipoBudget] ASC, [ModelloBudget] ASC, [Modello] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudWBudgetModello] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudWBudgetModello] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudWBudgetModello] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudWBudgetModello] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudWBudgetModello] TO [Metodo98]
    AS [dbo];

