CREATE TABLE [dbo].[BudBudgetTipoCliente] (
    [Stagione]          VARCHAR (3)     NOT NULL,
    [AnnoStagione]      VARCHAR (3)     NOT NULL,
    [TipologiaProdotto] VARCHAR (5)     NOT NULL,
    [Ambiente]          DECIMAL (5)     NOT NULL,
    [TipoCliente]       VARCHAR (5)     NOT NULL,
    [Quantita]          DECIMAL (16, 6) DEFAULT (0) NULL,
    [Percentuale]       DECIMAL (16, 6) DEFAULT (0) NULL,
    [Valore]            DECIMAL (19, 6) DEFAULT (0) NULL,
    [PercentualeV]      DECIMAL (16, 6) DEFAULT (0) NULL,
    [UtenteModifica]    VARCHAR (25)    NOT NULL,
    [DataModifica]      DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Stagione] ASC, [AnnoStagione] ASC, [TipologiaProdotto] ASC, [Ambiente] ASC, [TipoCliente] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  DELETE TRIGGER "TD_BudBudgetTipoCliente" FOR TABLE "BudBudgetTipoCliente"  */
CREATE TRIGGER TD_BudBudgetTipoCliente ON BudBudgetTipoCliente FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "BudBudgetCliente"  */
    DELETE BudBudgetCliente
    FROM   BudBudgetCliente T2, DELETED T1
    WHERE  T2.Stagione = T1.Stagione AND T2.AnnoStagione = T1.AnnoStagione AND 
           T2.TipologiaProdotto = T1.TipologiaProdotto AND T2.Ambiente = T1.Ambiente AND 
           T2.TipoCliente = T1.TipoCliente
    
    /*  DELETE ALL CHILDREN IN "BudBudgetFamiglia"  */
    DELETE BudBudgetFamiglia
    FROM   BudBudgetFamiglia T2, DELETED T1
    WHERE  T2.Stagione = T1.Stagione AND T2.AnnoStagione = T1.AnnoStagione AND 
           T2.TipologiaProdotto = T1.TipologiaProdotto AND T2.Ambiente = T1.Ambiente AND 
           T2.TipoCliente = T1.TipoCliente
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[BudBudgetTipoCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudBudgetTipoCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudBudgetTipoCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudBudgetTipoCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudBudgetTipoCliente] TO [Metodo98]
    AS [dbo];

