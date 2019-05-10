CREATE TABLE [dbo].[CGesFlussoGrandezzeFisicheContoSel] (
    [Progressivo]       DECIMAL (10) NOT NULL,
    [RifProgressivo]    DECIMAL (10) NOT NULL,
    [ContoSelezionato]  VARCHAR (20) DEFAULT ('') NULL,
    [MastroSelezionato] VARCHAR (5)  DEFAULT ('') NULL,
    [UtenteModifica]    VARCHAR (25) NOT NULL,
    [DataModifica]      DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  INSERT TRIGGER "TI_CGesFlussoGrandezzeFisicheContoSel" FOR TABLE "CGesFlussoGrandezzeFisicheContoSel"  */
CREATE TRIGGER TI_CGesFlussoGrandezzeFisicheContoSel ON CGesFlussoGrandezzeFisicheContoSel FOR INSERT AS
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

    
    /*  PARENT "CGesFlussoGrandezzeFisiche" MUST EXIST WHEN INSERTING A CHILD IN "CGesFlussoGrandezzeFisicheContoSel"  */
    IF UPDATE(RIFPROGRESSIVO)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   CGesFlussoGrandezzeFisiche T1, INSERTED T2
           WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "CGesFlussoGrandezzeFisiche". Cannot create child in "CGesFlussoGrandezzeFisicheContoSel".'
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

/*  UPDATE TRIGGER "TU_CGesFlussoGrandezzeFisicheContoSel" FOR TABLE "CGesFlussoGrandezzeFisicheContoSel"  */
CREATE TRIGGER TU_CGesFlussoGrandezzeFisicheContoSel ON CGesFlussoGrandezzeFisicheContoSel FOR UPDATE AS
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

      
      /*  PARENT "CGesFlussoGrandezzeFisiche" MUST EXIST WHEN UPDATING A CHILD IN "CGesFlussoGrandezzeFisicheContoSel"  */
      IF UPDATE(RIFPROGRESSIVO)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   CGesFlussoGrandezzeFisiche T1, INSERTED T2
             WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"CGesFlussoGrandezzeFisiche" does not exist. Cannot modify child in "CGesFlussoGrandezzeFisicheContoSel".'
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
    ON OBJECT::[dbo].[CGesFlussoGrandezzeFisicheContoSel] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesFlussoGrandezzeFisicheContoSel] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesFlussoGrandezzeFisicheContoSel] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesFlussoGrandezzeFisicheContoSel] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesFlussoGrandezzeFisicheContoSel] TO [Metodo98]
    AS [dbo];

