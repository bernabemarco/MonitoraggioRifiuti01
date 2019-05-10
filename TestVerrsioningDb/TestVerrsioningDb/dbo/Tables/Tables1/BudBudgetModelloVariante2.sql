CREATE TABLE [dbo].[BudBudgetModelloVariante2] (
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
    PRIMARY KEY CLUSTERED ([Stagione] ASC, [AnnoStagione] ASC, [TipologiaProdotto] ASC, [Ambiente] ASC, [TipoCliente] ASC, [Famiglia] ASC, [TipoBudget] ASC, [ModelloBudget] ASC, [Modello] ASC, [Variante1] ASC, [Variante2] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  DELETE TRIGGER "TD_BudBudgetModelloVariante2" FOR TABLE "BudBudgetModelloVariante2"  */
CREATE TRIGGER TD_BudBudgetModelloVariante2 ON BudBudgetModelloVariante2 FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "BudBudgetModelloVariante3"  */
    DELETE BudBudgetModelloVariante3
    FROM   BudBudgetModelloVariante3 T2, DELETED T1
    WHERE  T2.Stagione = T1.Stagione AND T2.AnnoStagione = T1.AnnoStagione AND 
           T2.TipologiaProdotto = T1.TipologiaProdotto AND T2.Ambiente = T1.Ambiente AND 
           T2.TipoCliente = T1.TipoCliente AND T2.Famiglia = T1.Famiglia AND 
           T2.TipoBudget = T1.TipoBudget AND T2.ModelloBudget = T1.ModelloBudget AND 
           T2.Modello = T1.Modello AND T2.Variante1 = T1.Variante1 AND 
           T2.Variante2 = T1.Variante2
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[BudBudgetModelloVariante2] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudBudgetModelloVariante2] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudBudgetModelloVariante2] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudBudgetModelloVariante2] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudBudgetModelloVariante2] TO [Metodo98]
    AS [dbo];

