CREATE TABLE [dbo].[BudStagionalitaArticoli] (
    [Progressivo]    DECIMAL (10) NOT NULL,
    [Articolo]       VARCHAR (50) DEFAULT ('') NULL,
    [Descrizione]    VARCHAR (80) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [BudStagionalitaArticoli_Dis]
    ON [dbo].[BudStagionalitaArticoli]([Articolo] ASC) WITH (FILLFACTOR = 90);


GO

/*  UPDATE TRIGGER "TU_BudStagionalitaArticoli" FOR TABLE "BudStagionalitaArticoli"  */
CREATE TRIGGER TU_BudStagionalitaArticoli ON BudStagionalitaArticoli FOR UPDATE AS
BEGIN
   DECLARE
      @MAXCARD  INT,
      @NUMROWS  INT,
      @NUMNULL  INT,
      @ERRNO    INT,
      @ERRMSG   VARCHAR(255)

      SELECT  @NUMROWS = @@ROWCOUNT
      IF @NUMROWS = 0
         RETURN

      
      /*  MODIFY PARENT CODE OF "BudStagionalitaArticoli" FOR ALL CHILDREN IN "BudStagionalitaArticoliRighe"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE BudStagionalitaArticoliRighe
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   BudStagionalitaArticoliRighe T2, INSERTED I1, DELETED D1
         WHERE  T2.RIFPROGRESSIVO = D1.PROGRESSIVO
          AND  (I1.PROGRESSIVO != D1.PROGRESSIVO)
      END
      
      RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO

/*  DELETE TRIGGER "TD_BudStagionalitaArticoli" FOR TABLE "BudStagionalitaArticoli"  */
CREATE TRIGGER TD_BudStagionalitaArticoli ON BudStagionalitaArticoli FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "BudStagionalitaArticoliRighe"  */
    DELETE BudStagionalitaArticoliRighe
    FROM   BudStagionalitaArticoliRighe T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[BudStagionalitaArticoli] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudStagionalitaArticoli] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudStagionalitaArticoli] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudStagionalitaArticoli] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudStagionalitaArticoli] TO [Metodo98]
    AS [dbo];

