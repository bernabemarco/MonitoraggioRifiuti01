CREATE TABLE [dbo].[CGesIndiciNormalizzatiRighe] (
    [Progressivo]     DECIMAL (10)    NOT NULL,
    [RifProgressivo]  DECIMAL (10)    NOT NULL,
    [Anno]            DECIMAL (5)     DEFAULT (0) NULL,
    [Mese]            INT             DEFAULT (0) NULL,
    [ValoreVariabile] DECIMAL (19, 6) DEFAULT (0) NULL,
    [ValoreFisso]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Note]            VARCHAR (100)   DEFAULT ('') NULL,
    [UtenteModifica]  VARCHAR (25)    NOT NULL,
    [DataModifica]    DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CGesIndiciNormalizzatiRighe_AnnMes]
    ON [dbo].[CGesIndiciNormalizzatiRighe]([RifProgressivo] ASC, [Anno] ASC, [Mese] ASC) WITH (FILLFACTOR = 90);


GO

/*  INSERT TRIGGER "TI_CGesIndiciNormalizzatiRighe" FOR TABLE "CGesIndiciNormalizzatiRighe"  */
CREATE TRIGGER TI_CGesIndiciNormalizzatiRighe ON CGesIndiciNormalizzatiRighe FOR INSERT AS
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

    
    /*  PARENT "CGesIndiciNormalizzati" MUST EXIST WHEN INSERTING A CHILD IN "CGesIndiciNormalizzatiRighe"  */
    IF UPDATE(RIFPROGRESSIVO)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   CGesIndiciNormalizzati T1, INSERTED T2
           WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "CGesIndiciNormalizzati". Cannot create child in "CGesIndiciNormalizzatiRighe".'
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

/*  UPDATE TRIGGER "TU_CGesIndiciNormalizzatiRighe" FOR TABLE "CGesIndiciNormalizzatiRighe"  */
CREATE TRIGGER TU_CGesIndiciNormalizzatiRighe ON CGesIndiciNormalizzatiRighe FOR UPDATE AS
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

      
      /*  PARENT "CGesIndiciNormalizzati" MUST EXIST WHEN UPDATING A CHILD IN "CGesIndiciNormalizzatiRighe"  */
      IF UPDATE(RIFPROGRESSIVO)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   CGesIndiciNormalizzati T1, INSERTED T2
             WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"CGesIndiciNormalizzati" does not exist. Cannot modify child in "CGesIndiciNormalizzatiRighe".'
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
    ON OBJECT::[dbo].[CGesIndiciNormalizzatiRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesIndiciNormalizzatiRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesIndiciNormalizzatiRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesIndiciNormalizzatiRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesIndiciNormalizzatiRighe] TO [Metodo98]
    AS [dbo];

