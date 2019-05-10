CREATE TABLE [dbo].[BudWConfrontoBudgetRighe] (
    [NrTerminale]     DECIMAL (5)     NOT NULL,
    [NumRiga]         DECIMAL (10)    NOT NULL,
    [Codice]          VARCHAR (50)    DEFAULT ('') NULL,
    [Descrizione]     VARCHAR (200)   DEFAULT ('') NULL,
    [Grassetto]       SMALLINT        DEFAULT (0) NULL,
    [Indentazione]    SMALLINT        DEFAULT (0) NULL,
    [QuantitaRif]     DECIMAL (16, 6) DEFAULT (0) NULL,
    [PercentualeRif]  DECIMAL (16, 6) DEFAULT (0) NULL,
    [ValoreRif]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [PercentualeVRif] DECIMAL (16, 6) DEFAULT (0) NULL,
    [QuantitaCon]     DECIMAL (16, 6) DEFAULT (0) NULL,
    [PercentualeCon]  DECIMAL (16, 6) DEFAULT (0) NULL,
    [ValoreCon]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [PercentualeVCon] DECIMAL (16, 6) DEFAULT (0) NULL,
    [QuantitaDif]     DECIMAL (16, 6) DEFAULT (0) NULL,
    [QuantitaDifPerc] DECIMAL (16, 6) DEFAULT (0) NULL,
    [ValoreDif]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [ValoreDifPerc]   DECIMAL (16, 6) DEFAULT (0) NULL,
    [DesTipologia]    VARCHAR (200)   DEFAULT ('') NULL,
    [UtenteModifica]  VARCHAR (25)    NOT NULL,
    [DataModifica]    DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [NumRiga] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudWConfrontoBudgetRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudWConfrontoBudgetRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudWConfrontoBudgetRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudWConfrontoBudgetRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudWConfrontoBudgetRighe] TO [Metodo98]
    AS [dbo];

