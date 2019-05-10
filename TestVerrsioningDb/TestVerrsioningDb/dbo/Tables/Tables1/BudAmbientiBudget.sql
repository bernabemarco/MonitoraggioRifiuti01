CREATE TABLE [dbo].[BudAmbientiBudget] (
    [Codice]         DECIMAL (5)   NOT NULL,
    [Descrizione]    VARCHAR (100) DEFAULT ('') NULL,
    [Tipo]           SMALLINT      DEFAULT (0) NULL,
    [Definitivo]     SMALLINT      DEFAULT (0) NULL,
    [IDMPS]          DECIMAL (10)  DEFAULT (0) NULL,
    [Note]           VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  DELETE TRIGGER "TD_BudAmbientiBudget" FOR TABLE "BudAmbientiBudget"  */
CREATE TRIGGER TD_BudAmbientiBudget ON BudAmbientiBudget FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "BudAmbientiBudgetDoc"  */
    DELETE BudAmbientiBudgetDoc
    FROM   BudAmbientiBudgetDoc T2, DELETED T1
    WHERE  T2.Codice = T1.Codice
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[BudAmbientiBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudAmbientiBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudAmbientiBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudAmbientiBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudAmbientiBudget] TO [Metodo98]
    AS [dbo];

