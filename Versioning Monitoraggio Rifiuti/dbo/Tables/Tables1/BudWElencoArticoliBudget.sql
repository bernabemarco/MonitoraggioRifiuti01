CREATE TABLE [dbo].[BudWElencoArticoliBudget] (
    [NrTerminale]     DECIMAL (5)     NOT NULL,
    [Articolo]        VARCHAR (50)    NOT NULL,
    [Quantita]        DECIMAL (16, 6) DEFAULT (0) NULL,
    [Valore]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [QuantitaCalcolo] DECIMAL (16, 6) DEFAULT (0) NULL,
    [ValoreCalcolo]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [UtenteModifica]  VARCHAR (25)    NOT NULL,
    [DataModifica]    DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [Articolo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudWElencoArticoliBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudWElencoArticoliBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudWElencoArticoliBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudWElencoArticoliBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudWElencoArticoliBudget] TO [Metodo98]
    AS [dbo];

