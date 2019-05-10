CREATE TABLE [dbo].[CGesRipartizioniRighe] (
    [Progressivo]     DECIMAL (10)    NOT NULL,
    [RifProgressivo]  DECIMAL (10)    NOT NULL,
    [CodDestinazione] VARCHAR (10)    DEFAULT ('') NULL,
    [Valore]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [Percentuale]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Note]            VARCHAR (100)   DEFAULT ('') NULL,
    [UtenteModifica]  VARCHAR (25)    NOT NULL,
    [DataModifica]    DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CGesRipartizioniRighe_Dest]
    ON [dbo].[CGesRipartizioniRighe]([RifProgressivo] ASC, [CodDestinazione] ASC) WITH (FILLFACTOR = 90);


GO

/*  INSERT TRIGGER "TI_CGesRipartizioniRighe" FOR TABLE "CGesRipartizioniRighe"  */
CREATE TRIGGER TI_CGesRipartizioniRighe ON CGesRipartizioniRighe FOR INSERT AS
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

    
    /*  PARENT "CGesRipartizioni" MUST EXIST WHEN INSERTING A CHILD IN "CGesRipartizioniRighe"  */
    IF UPDATE(RIFPROGRESSIVO)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   CGesRipartizioni T1, INSERTED T2
           WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "CGesRipartizioni". Cannot create child in "CGesRipartizioniRighe".'
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

/*  UPDATE TRIGGER "TU_CGesRipartizioniRighe" FOR TABLE "CGesRipartizioniRighe"  */
CREATE TRIGGER TU_CGesRipartizioniRighe ON CGesRipartizioniRighe FOR UPDATE AS
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

      
      /*  PARENT "CGesRipartizioni" MUST EXIST WHEN UPDATING A CHILD IN "CGesRipartizioniRighe"  */
      IF UPDATE(RIFPROGRESSIVO)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   CGesRipartizioni T1, INSERTED T2
             WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"CGesRipartizioni" does not exist. Cannot modify child in "CGesRipartizioniRighe".'
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
    ON OBJECT::[dbo].[CGesRipartizioniRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesRipartizioniRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesRipartizioniRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesRipartizioniRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesRipartizioniRighe] TO [Metodo98]
    AS [dbo];

