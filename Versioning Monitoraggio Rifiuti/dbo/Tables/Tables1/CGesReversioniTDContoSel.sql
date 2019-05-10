CREATE TABLE [dbo].[CGesReversioniTDContoSel] (
    [Progressivo]       DECIMAL (10) NOT NULL,
    [RifProgressivo]    DECIMAL (10) NOT NULL,
    [ContoSelezionato]  VARCHAR (20) DEFAULT ('') NULL,
    [MastroSelezionato] VARCHAR (5)  DEFAULT ('') NULL,
    [UtenteModifica]    VARCHAR (25) NOT NULL,
    [DataModifica]      DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  INSERT TRIGGER "TI_CGesReversioniTDContoSel" FOR TABLE "CGesReversioniTDContoSel"  */
CREATE TRIGGER TI_CGesReversioniTDContoSel ON CGesReversioniTDContoSel FOR INSERT AS
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

    
    /*  PARENT "CGesReversioniTD" MUST EXIST WHEN INSERTING A CHILD IN "CGesReversioniTDContoSel"  */
    IF UPDATE(RIFPROGRESSIVO)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   CGesReversioniTD T1, INSERTED T2
           WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "CGesReversioniTD". Cannot create child in "CGesReversioniTDContoSel".'
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

/*  UPDATE TRIGGER "TU_CGesReversioniTDContoSel" FOR TABLE "CGesReversioniTDContoSel"  */
CREATE TRIGGER TU_CGesReversioniTDContoSel ON CGesReversioniTDContoSel FOR UPDATE AS
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

      
      /*  PARENT "CGesReversioniTD" MUST EXIST WHEN UPDATING A CHILD IN "CGesReversioniTDContoSel"  */
      IF UPDATE(RIFPROGRESSIVO)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   CGesReversioniTD T1, INSERTED T2
             WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"CGesReversioniTD" does not exist. Cannot modify child in "CGesReversioniTDContoSel".'
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
    ON OBJECT::[dbo].[CGesReversioniTDContoSel] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesReversioniTDContoSel] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesReversioniTDContoSel] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesReversioniTDContoSel] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesReversioniTDContoSel] TO [Metodo98]
    AS [dbo];

