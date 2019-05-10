CREATE TABLE [dbo].[BudDocConsuntivoBudgetStagione] (
    [Stagione]        VARCHAR (3)   NOT NULL,
    [AnnoStagione]    VARCHAR (3)   NOT NULL,
    [TipoDocumento]   VARCHAR (3)   DEFAULT ('') NOT NULL,
    [StagioneDoc]     VARCHAR (3)   DEFAULT ('') NOT NULL,
    [AnnoStagioneDoc] VARCHAR (3)   DEFAULT ('') NOT NULL,
    [Note]            VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica]  VARCHAR (25)  NOT NULL,
    [DataModifica]    DATETIME      NOT NULL,
    [ErosionePerData] SMALLINT      DEFAULT (0) NULL,
    PRIMARY KEY CLUSTERED ([Stagione] ASC, [AnnoStagione] ASC, [TipoDocumento] ASC, [StagioneDoc] ASC, [AnnoStagioneDoc] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudDocConsuntivoBudgetStagione] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudDocConsuntivoBudgetStagione] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudDocConsuntivoBudgetStagione] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudDocConsuntivoBudgetStagione] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudDocConsuntivoBudgetStagione] TO [Metodo98]
    AS [dbo];

