CREATE TABLE [dbo].[BudDocStoricoBudgetData] (
    [Stagione]       VARCHAR (3)   NOT NULL,
    [AnnoStagione]   VARCHAR (3)   NOT NULL,
    [TipoDocumento]  VARCHAR (3)   NOT NULL,
    [DataInizio]     DATETIME      NULL,
    [DataFine]       DATETIME      NULL,
    [Note]           VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Stagione] ASC, [AnnoStagione] ASC, [TipoDocumento] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudDocStoricoBudgetData] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudDocStoricoBudgetData] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudDocStoricoBudgetData] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudDocStoricoBudgetData] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudDocStoricoBudgetData] TO [Metodo98]
    AS [dbo];

