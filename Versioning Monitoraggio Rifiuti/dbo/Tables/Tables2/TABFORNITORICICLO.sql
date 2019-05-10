﻿CREATE TABLE [dbo].[TABFORNITORICICLO] (
    [PROGRESSIVO]    DECIMAL (10) NOT NULL,
    [NUMEROFASE]     INT          NOT NULL,
    [CODFORN]        VARCHAR (7)  NOT NULL,
    [PRIORITA]       INT          NULL,
    [LISTINOTRASF]   DECIMAL (5)  NULL,
    [UTENTEMODIFICA] VARCHAR (25) NULL,
    [DATAMODIFICA]   DATETIME     NULL,
    CONSTRAINT [TABFORNITORICICLO_PK] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC, [NUMEROFASE] ASC, [CODFORN] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  INSERT TRIGGER "TI_TABFORNITORICICLO" FOR TABLE "TABFORNITORICICLO"  */
CREATE TRIGGER TI_TABFORNITORICICLO ON TABFORNITORICICLO FOR INSERT AS
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

    
    /*  PARENT "RIGHECICLOPROD" MUST EXIST WHEN INSERTING A CHILD IN "TABFORNITORICICLO"  */
    IF UPDATE(PROGRESSIVO) OR
       UPDATE(NUMEROFASE)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   RIGHECICLOPROD T1, INSERTED T2
           WHERE  T1.PROGRESSIVO = T2.PROGRESSIVO
            AND   T1.NUMEROFASE = T2.NUMEROFASE) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "RIGHECICLOPROD". Cannot create child in "TABFORNITORICICLO".'
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

/*  UPDATE TRIGGER "TU_TABFORNITORICICLO" FOR TABLE "TABFORNITORICICLO"  */
CREATE TRIGGER TU_TABFORNITORICICLO ON TABFORNITORICICLO FOR UPDATE AS
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

      
      /*  PARENT "RIGHECICLOPROD" MUST EXIST WHEN UPDATING A CHILD IN "TABFORNITORICICLO"  */
      IF UPDATE(PROGRESSIVO) OR
         UPDATE(NUMEROFASE)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   RIGHECICLOPROD T1, INSERTED T2
             WHERE  T1.PROGRESSIVO = T2.PROGRESSIVO
              AND   T1.NUMEROFASE = T2.NUMEROFASE) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"RIGHECICLOPROD" does not exist. Cannot modify child in "TABFORNITORICICLO".'
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
    ON OBJECT::[dbo].[TABFORNITORICICLO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABFORNITORICICLO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABFORNITORICICLO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABFORNITORICICLO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABFORNITORICICLO] TO [Metodo98]
    AS [dbo];

