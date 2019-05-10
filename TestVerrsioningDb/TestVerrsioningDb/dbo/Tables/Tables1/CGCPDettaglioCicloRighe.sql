CREATE TABLE [dbo].[CGCPDettaglioCicloRighe] (
    [Progressivo]    DECIMAL (10)    NOT NULL,
    [RifProgressivo] DECIMAL (10)    NOT NULL,
    [Raggruppamento] VARCHAR (5)     DEFAULT ('') NULL,
    [Percentuale]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [Note]           VARCHAR (100)   DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    [Percentuale2]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [Percentuale3]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [Percentuale4]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [Percentuale5]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [PercentualeF]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [Percentuale2F]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Percentuale3F]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Percentuale4F]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Percentuale5F]  DECIMAL (19, 6) DEFAULT (0) NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CGCPDettaglioCicloRighe_Rag]
    ON [dbo].[CGCPDettaglioCicloRighe]([RifProgressivo] ASC, [Raggruppamento] ASC) WITH (FILLFACTOR = 90);


GO

/*  INSERT TRIGGER "TI_CGCPDettaglioCicloRighe" FOR TABLE "CGCPDettaglioCicloRighe"  */
CREATE TRIGGER TI_CGCPDettaglioCicloRighe ON CGCPDettaglioCicloRighe FOR INSERT AS
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

    
    /*  PARENT "CGCPDettaglioCiclo" MUST EXIST WHEN INSERTING A CHILD IN "CGCPDettaglioCicloRighe"  */
    IF UPDATE(RIFPROGRESSIVO)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   CGCPDettaglioCiclo T1, INSERTED T2
           WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "CGCPDettaglioCiclo". Cannot create child in "CGCPDettaglioCicloRighe".'
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

/*  UPDATE TRIGGER "TU_CGCPDettaglioCicloRighe" FOR TABLE "CGCPDettaglioCicloRighe"  */
CREATE TRIGGER TU_CGCPDettaglioCicloRighe ON CGCPDettaglioCicloRighe FOR UPDATE AS
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

      
      /*  PARENT "CGCPDettaglioCiclo" MUST EXIST WHEN UPDATING A CHILD IN "CGCPDettaglioCicloRighe"  */
      IF UPDATE(RIFPROGRESSIVO)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   CGCPDettaglioCiclo T1, INSERTED T2
             WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"CGCPDettaglioCiclo" does not exist. Cannot modify child in "CGCPDettaglioCicloRighe".'
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
    ON OBJECT::[dbo].[CGCPDettaglioCicloRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPDettaglioCicloRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPDettaglioCicloRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPDettaglioCicloRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPDettaglioCicloRighe] TO [Metodo98]
    AS [dbo];

