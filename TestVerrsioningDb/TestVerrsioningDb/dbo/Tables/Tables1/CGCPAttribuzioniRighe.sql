CREATE TABLE [dbo].[CGCPAttribuzioniRighe] (
    [Progressivo]     DECIMAL (10)    NOT NULL,
    [RifProgressivo]  DECIMAL (10)    NOT NULL,
    [Categoria]       DECIMAL (5)     DEFAULT (0) NULL,
    [Articolo]        VARCHAR (50)    DEFAULT ('') NULL,
    [OggettoCalcolo]  VARCHAR (10)    DEFAULT ('') NULL,
    [ValoreVariabile] DECIMAL (19, 6) DEFAULT (0) NULL,
    [ValoreFisso]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Percentuale]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [UtenteModifica]  VARCHAR (25)    NOT NULL,
    [DataModifica]    DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  UPDATE TRIGGER "TU_CGCPAttribuzioniRighe" FOR TABLE "CGCPAttribuzioniRighe"  */
CREATE TRIGGER TU_CGCPAttribuzioniRighe ON CGCPAttribuzioniRighe FOR UPDATE AS
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

      
      /*  PARENT "CGCPAttribuzioni" MUST EXIST WHEN UPDATING A CHILD IN "CGCPAttribuzioniRighe"  */
      IF UPDATE(RIFPROGRESSIVO)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   CGCPAttribuzioni T1, INSERTED T2
             WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"CGCPAttribuzioni" does not exist. Cannot modify child in "CGCPAttribuzioniRighe".'
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

/*  INSERT TRIGGER "TI_CGCPAttribuzioniRighe" FOR TABLE "CGCPAttribuzioniRighe"  */
CREATE TRIGGER TI_CGCPAttribuzioniRighe ON CGCPAttribuzioniRighe FOR INSERT AS
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

    
    /*  PARENT "CGCPAttribuzioni" MUST EXIST WHEN INSERTING A CHILD IN "CGCPAttribuzioniRighe"  */
    IF UPDATE(RIFPROGRESSIVO)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   CGCPAttribuzioni T1, INSERTED T2
           WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "CGCPAttribuzioni". Cannot create child in "CGCPAttribuzioniRighe".'
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
    ON OBJECT::[dbo].[CGCPAttribuzioniRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPAttribuzioniRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPAttribuzioniRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPAttribuzioniRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPAttribuzioniRighe] TO [Metodo98]
    AS [dbo];

