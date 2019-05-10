CREATE TABLE [dbo].[BudDurataStagioneBudget] (
    [Stagione]             VARCHAR (3)   NOT NULL,
    [AnnoStagione]         VARCHAR (3)   NOT NULL,
    [DataInizio]           DATETIME      NULL,
    [DataFine]             DATETIME      NULL,
    [TipoDocBudget]        VARCHAR (3)   DEFAULT ('') NULL,
    [Listino]              DECIMAL (5)   DEFAULT (0) NULL,
    [VersioneDB]           VARCHAR (10)  DEFAULT ('') NULL,
    [ArticoliEsistenti]    SMALLINT      DEFAULT (0) NULL,
    [BudgetPuntuale]       SMALLINT      DEFAULT (0) NULL,
    [Periodicita]          SMALLINT      DEFAULT (0) NULL,
    [CodDistribuzione]     VARCHAR (3)   DEFAULT ('') NULL,
    [DataDocumentiIFP]     SMALLINT      DEFAULT (0) NULL,
    [DataConsegnaIFP]      SMALLINT      DEFAULT (0) NULL,
    [TipoDocConsuntivo]    VARCHAR (3)   DEFAULT ('') NULL,
    [BudgetCliente]        SMALLINT      DEFAULT (0) NULL,
    [CodiceMPS]            VARCHAR (3)   DEFAULT ('') NULL,
    [Note]                 VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica]       VARCHAR (25)  NOT NULL,
    [DataModifica]         DATETIME      NOT NULL,
    [ErosioneMese]         SMALLINT      DEFAULT (0) NULL,
    [CodiceCommerciale]    SMALLINT      DEFAULT (0) NULL,
    [MultiSelezione]       SMALLINT      DEFAULT (0) NULL,
    [ProporzionaSuStorico] SMALLINT      DEFAULT (0) NULL,
    [ConsideraFigli]       SMALLINT      DEFAULT (0) NULL,
    PRIMARY KEY CLUSTERED ([Stagione] ASC, [AnnoStagione] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudDurataStagioneBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudDurataStagioneBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudDurataStagioneBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudDurataStagioneBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudDurataStagioneBudget] TO [Metodo98]
    AS [dbo];

