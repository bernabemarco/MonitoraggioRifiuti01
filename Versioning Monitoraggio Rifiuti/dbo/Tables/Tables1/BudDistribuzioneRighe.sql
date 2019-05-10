CREATE TABLE [dbo].[BudDistribuzioneRighe] (
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
CREATE UNIQUE NONCLUSTERED INDEX [BudDistribuzioneRighe_AnnMes]
    ON [dbo].[BudDistribuzioneRighe]([RifProgressivo] ASC, [Anno] ASC, [Mese] ASC) WITH (FILLFACTOR = 90);


GO

/*  INSERT TRIGGER "TI_BudDistribuzioneRighe" FOR TABLE "BudDistribuzioneRighe"  */
CREATE TRIGGER TI_BudDistribuzioneRighe ON BudDistribuzioneRighe FOR INSERT AS
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

    
    /*  PARENT "BudDistribuzione" MUST EXIST WHEN INSERTING A CHILD IN "BudDistribuzioneRighe"  */
    IF UPDATE(RIFPROGRESSIVO)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   BudDistribuzione T1, INSERTED T2
           WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "BudDistribuzione". Cannot create child in "BudDistribuzioneRighe".'
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

/*  UPDATE TRIGGER "TU_BudDistribuzioneRighe" FOR TABLE "BudDistribuzioneRighe"  */
CREATE TRIGGER TU_BudDistribuzioneRighe ON BudDistribuzioneRighe FOR UPDATE AS
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

      
      /*  PARENT "BudDistribuzione" MUST EXIST WHEN UPDATING A CHILD IN "BudDistribuzioneRighe"  */
      IF UPDATE(RIFPROGRESSIVO)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   BudDistribuzione T1, INSERTED T2
             WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"BudDistribuzione" does not exist. Cannot modify child in "BudDistribuzioneRighe".'
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
    ON OBJECT::[dbo].[BudDistribuzioneRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudDistribuzioneRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudDistribuzioneRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudDistribuzioneRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudDistribuzioneRighe] TO [Metodo98]
    AS [dbo];

