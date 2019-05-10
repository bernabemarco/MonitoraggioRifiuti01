CREATE TABLE [dbo].[BudWControlloBudget] (
    [NrTerminale]       DECIMAL (5)  NOT NULL,
    [Stagione]          VARCHAR (3)  NOT NULL,
    [AnnoStagione]      VARCHAR (3)  NOT NULL,
    [TipologiaProdotto] VARCHAR (5)  NOT NULL,
    [Ambiente]          DECIMAL (5)  NOT NULL,
    [TipoCliente]       VARCHAR (5)  NOT NULL,
    [Famiglia]          VARCHAR (5)  NOT NULL,
    [TipoBudget]        VARCHAR (5)  NOT NULL,
    [ModelloBudget]     VARCHAR (5)  NOT NULL,
    [Modello]           VARCHAR (50) NOT NULL,
    [Articolo]          VARCHAR (50) NOT NULL,
    [UtenteModifica]    VARCHAR (25) NOT NULL,
    [DataModifica]      DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [Stagione] ASC, [AnnoStagione] ASC, [TipologiaProdotto] ASC, [Ambiente] ASC, [TipoCliente] ASC, [Famiglia] ASC, [TipoBudget] ASC, [ModelloBudget] ASC, [Modello] ASC, [Articolo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudWControlloBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudWControlloBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudWControlloBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudWControlloBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudWControlloBudget] TO [Metodo98]
    AS [dbo];

