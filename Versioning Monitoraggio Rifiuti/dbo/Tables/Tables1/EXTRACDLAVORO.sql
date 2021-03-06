﻿CREATE TABLE [dbo].[EXTRACDLAVORO] (
    [CODCDL]         VARCHAR (5)  NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_EXTRACDLAVORO] PRIMARY KEY CLUSTERED ([CODCDL] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  INSERT TRIGGER "TI_EXTRACDLAVORO" FOR TABLE "EXTRACDLAVORO"  */
CREATE TRIGGER TI_EXTRACDLAVORO ON EXTRACDLAVORO FOR INSERT AS
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

    
    /*  PARENT "TABELLACDLAVORO" MUST EXIST WHEN INSERTING A CHILD IN "EXTRACDLAVORO"  */
    IF UPDATE(CODCDL)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   TABELLACDLAVORO T1, INSERTED T2
           WHERE  T1.CODICE = T2.CODCDL) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "TABELLACDLAVORO". Cannot create child in "EXTRACDLAVORO".'
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

/*  UPDATE TRIGGER "TU_EXTRACDLAVORO" FOR TABLE "EXTRACDLAVORO"  */
CREATE TRIGGER TU_EXTRACDLAVORO ON EXTRACDLAVORO FOR UPDATE AS
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

      
      /*  PARENT "TABELLACDLAVORO" MUST EXIST WHEN UPDATING A CHILD IN "EXTRACDLAVORO"  */
      IF UPDATE(CODCDL)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   TABELLACDLAVORO T1, INSERTED T2
             WHERE  T1.CODICE = T2.CODCDL) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"TABELLACDLAVORO" does not exist. Cannot ALTER COLUMN child in "EXTRACDLAVORO".'
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
    ON OBJECT::[dbo].[EXTRACDLAVORO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EXTRACDLAVORO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[EXTRACDLAVORO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EXTRACDLAVORO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EXTRACDLAVORO] TO [Metodo98]
    AS [dbo];

