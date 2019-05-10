CREATE TABLE [dbo].[CGCPFoglioSchedeRighe] (
    [Progressivo]    DECIMAL (10)  NOT NULL,
    [RifProgressivo] DECIMAL (10)  NOT NULL,
    [Voce]           VARCHAR (10)  DEFAULT ('') NULL,
    [Colonna]        SMALLINT      DEFAULT (0) NULL,
    [Note]           VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  INSERT TRIGGER "TI_CGCPFoglioSchedeRighe" FOR TABLE "CGCPFoglioSchedeRighe"  */
CREATE TRIGGER TI_CGCPFoglioSchedeRighe ON CGCPFoglioSchedeRighe FOR INSERT AS
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

    
    /*  PARENT "CGCPFoglioSchede" MUST EXIST WHEN INSERTING A CHILD IN "CGCPFoglioSchedeRighe"  */
    IF UPDATE(RIFPROGRESSIVO)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   CGCPFoglioSchede T1, INSERTED T2
           WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "CGCPFoglioSchede". Cannot create child in "CGCPFoglioSchedeRighe".'
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

/*  UPDATE TRIGGER "TU_CGCPFoglioSchedeRighe" FOR TABLE "CGCPFoglioSchedeRighe"  */
CREATE TRIGGER TU_CGCPFoglioSchedeRighe ON CGCPFoglioSchedeRighe FOR UPDATE AS
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

      
      /*  PARENT "CGCPFoglioSchede" MUST EXIST WHEN UPDATING A CHILD IN "CGCPFoglioSchedeRighe"  */
      IF UPDATE(RIFPROGRESSIVO)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   CGCPFoglioSchede T1, INSERTED T2
             WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"CGCPFoglioSchede" does not exist. Cannot modify child in "CGCPFoglioSchedeRighe".'
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
    ON OBJECT::[dbo].[CGCPFoglioSchedeRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPFoglioSchedeRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPFoglioSchedeRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPFoglioSchedeRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPFoglioSchedeRighe] TO [Metodo98]
    AS [dbo];

