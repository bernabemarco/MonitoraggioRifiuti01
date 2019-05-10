CREATE TABLE [dbo].[BudBudgetModelloVariante5] (
    [Stagione]           VARCHAR (3)     NOT NULL,
    [AnnoStagione]       VARCHAR (3)     NOT NULL,
    [TipologiaProdotto]  VARCHAR (5)     NOT NULL,
    [Ambiente]           DECIMAL (5)     NOT NULL,
    [TipoCliente]        VARCHAR (5)     NOT NULL,
    [Famiglia]           VARCHAR (5)     NOT NULL,
    [TipoBudget]         VARCHAR (5)     NOT NULL,
    [ModelloBudget]      VARCHAR (5)     NOT NULL,
    [Modello]            VARCHAR (50)    NOT NULL,
    [Variante1]          VARCHAR (11)    NOT NULL,
    [Variante2]          VARCHAR (11)    NOT NULL,
    [Variante3]          VARCHAR (11)    NOT NULL,
    [Variante4]          VARCHAR (11)    NOT NULL,
    [Variante5]          VARCHAR (11)    NOT NULL,
    [Tipologia]          VARCHAR (3)     DEFAULT ('') NULL,
    [Variante]           VARCHAR (8)     DEFAULT ('') NULL,
    [Quantita]           DECIMAL (16, 6) DEFAULT (0) NULL,
    [Percentuale]        DECIMAL (16, 6) DEFAULT (0) NULL,
    [Valore]             DECIMAL (19, 6) DEFAULT (0) NULL,
    [PercentualeV]       DECIMAL (16, 6) DEFAULT (0) NULL,
    [UtenteModifica]     VARCHAR (25)    NOT NULL,
    [DataModifica]       DATETIME        NOT NULL,
    [PrezzoMedio]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [ValoreListino]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [PrezzoMedioListino] DECIMAL (19, 6) DEFAULT (0) NULL,
    PRIMARY KEY CLUSTERED ([Stagione] ASC, [AnnoStagione] ASC, [TipologiaProdotto] ASC, [Ambiente] ASC, [TipoCliente] ASC, [Famiglia] ASC, [TipoBudget] ASC, [ModelloBudget] ASC, [Modello] ASC, [Variante1] ASC, [Variante2] ASC, [Variante3] ASC, [Variante4] ASC, [Variante5] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudBudgetModelloVariante5] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudBudgetModelloVariante5] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudBudgetModelloVariante5] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudBudgetModelloVariante5] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudBudgetModelloVariante5] TO [Metodo98]
    AS [dbo];

