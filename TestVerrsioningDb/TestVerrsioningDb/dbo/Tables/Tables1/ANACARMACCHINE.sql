﻿CREATE TABLE [dbo].[ANACARMACCHINE] (
    [CODMACCHINA]    VARCHAR (5)   NOT NULL,
    [NRRIGA]         INT           NOT NULL,
    [VALORE]         VARCHAR (100) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    CONSTRAINT [PK_ANACARMACCHINE] PRIMARY KEY CLUSTERED ([CODMACCHINA] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  INSERT TRIGGER "TI_ANACARMACCHINE" FOR TABLE "ANACARMACCHINE"  */
CREATE TRIGGER TI_ANACARMACCHINE ON ANACARMACCHINE FOR INSERT AS
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

    
    /*  PARENT "TABELLAMACCHINE" MUST EXIST WHEN INSERTING A CHILD IN "ANACARMACCHINE"  */
    IF UPDATE(CODMACCHINA)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   TABELLAMACCHINE T1, INSERTED T2
           WHERE  T1.CODICE = T2.CODMACCHINA) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "TABELLAMACCHINE". Cannot create child in "ANACARMACCHINE".'
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

/*  UPDATE TRIGGER "TU_ANACARMACCHINE" FOR TABLE "ANACARMACCHINE"  */
CREATE TRIGGER TU_ANACARMACCHINE ON ANACARMACCHINE FOR UPDATE AS
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

      
      /*  PARENT "TABELLAMACCHINE" MUST EXIST WHEN UPDATING A CHILD IN "ANACARMACCHINE"  */
      IF UPDATE(CODMACCHINA)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   TABELLAMACCHINE T1, INSERTED T2
             WHERE  T1.CODICE = T2.CODMACCHINA) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"TABELLAMACCHINE" does not exist. Cannot ALTER COLUMN child in "ANACARMACCHINE".'
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
    ON OBJECT::[dbo].[ANACARMACCHINE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ANACARMACCHINE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ANACARMACCHINE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ANACARMACCHINE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ANACARMACCHINE] TO [Metodo98]
    AS [dbo];

