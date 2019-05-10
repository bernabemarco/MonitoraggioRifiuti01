CREATE TABLE [dbo].[BudStagionalitaArticoliRighe] (
    [Progressivo]    DECIMAL (10)    NOT NULL,
    [RifProgressivo] DECIMAL (10)    NOT NULL,
    [Anno]           DECIMAL (5)     DEFAULT (0) NULL,
    [Mese]           INT             DEFAULT (0) NULL,
    [Valore]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Note]           VARCHAR (100)   DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [BudStagionalitaArticoliRighe_AnnMes]
    ON [dbo].[BudStagionalitaArticoliRighe]([RifProgressivo] ASC, [Anno] ASC, [Mese] ASC) WITH (FILLFACTOR = 90);


GO

/*  INSERT TRIGGER "TI_BudStagionalitaArticoliRighe" FOR TABLE "BudStagionalitaArticoliRighe"  */
CREATE TRIGGER TI_BudStagionalitaArticoliRighe ON BudStagionalitaArticoliRighe FOR INSERT AS
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

    
    /*  PARENT "BudStagionalitaArticoli" MUST EXIST WHEN INSERTING A CHILD IN "BudStagionalitaArticoliRighe"  */
    IF UPDATE(RIFPROGRESSIVO)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   BudStagionalitaArticoli T1, INSERTED T2
           WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "BudStagionalitaArticoli". Cannot create child in "BudStagionalitaArticoliRighe".'
             GOTO ERROR
          END
    END

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO

/*  UPDATE TRIGGER "TU_BudStagionalitaArticoliRighe" FOR TABLE "BudStagionalitaArticoliRighe"  */
CREATE TRIGGER TU_BudStagionalitaArticoliRighe ON BudStagionalitaArticoliRighe FOR UPDATE AS
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

      
      /*  PARENT "BudStagionalitaArticoli" MUST EXIST WHEN UPDATING A CHILD IN "BudStagionalitaArticoliRighe"  */
      IF UPDATE(RIFPROGRESSIVO)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   BudStagionalitaArticoli T1, INSERTED T2
             WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"BudStagionalitaArticoli" does not exist. Cannot modify child in "BudStagionalitaArticoliRighe".'
               GOTO ERROR
            END
      END

      RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[BudStagionalitaArticoliRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudStagionalitaArticoliRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudStagionalitaArticoliRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudStagionalitaArticoliRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudStagionalitaArticoliRighe] TO [Metodo98]
    AS [dbo];

