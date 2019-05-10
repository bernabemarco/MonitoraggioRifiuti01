CREATE TABLE [dbo].[CGesRipartizioniContoSel] (
    [Progressivo]       DECIMAL (10) NOT NULL,
    [RifProgressivo]    DECIMAL (10) NOT NULL,
    [ContoSelezionato]  VARCHAR (20) DEFAULT ('') NULL,
    [MastroSelezionato] VARCHAR (5)  DEFAULT ('') NULL,
    [UtenteModifica]    VARCHAR (25) NOT NULL,
    [DataModifica]      DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  INSERT TRIGGER "TI_CGesRipartizioniContoSel" FOR TABLE "CGesRipartizioniContoSel"  */
CREATE TRIGGER TI_CGesRipartizioniContoSel ON CGesRipartizioniContoSel FOR INSERT AS
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

    
    /*  PARENT "CGesRipartizioni" MUST EXIST WHEN INSERTING A CHILD IN "CGesRipartizioniContoSel"  */
    IF UPDATE(RIFPROGRESSIVO)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   CGesRipartizioni T1, INSERTED T2
           WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "CGesRipartizioni". Cannot create child in "CGesRipartizioniContoSel".'
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

/*  UPDATE TRIGGER "TU_CGesRipartizioniContoSel" FOR TABLE "CGesRipartizioniContoSel"  */
CREATE TRIGGER TU_CGesRipartizioniContoSel ON CGesRipartizioniContoSel FOR UPDATE AS
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

      
      /*  PARENT "CGesRipartizioni" MUST EXIST WHEN UPDATING A CHILD IN "CGesRipartizioniContoSel"  */
      IF UPDATE(RIFPROGRESSIVO)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   CGesRipartizioni T1, INSERTED T2
             WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"CGesRipartizioni" does not exist. Cannot modify child in "CGesRipartizioniContoSel".'
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
    ON OBJECT::[dbo].[CGesRipartizioniContoSel] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesRipartizioniContoSel] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesRipartizioniContoSel] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesRipartizioniContoSel] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesRipartizioniContoSel] TO [Metodo98]
    AS [dbo];

