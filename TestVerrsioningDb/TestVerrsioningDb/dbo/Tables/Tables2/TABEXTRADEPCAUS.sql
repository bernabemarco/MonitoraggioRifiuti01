﻿CREATE TABLE [dbo].[TABEXTRADEPCAUS] (
    [CODCAUSALE]     DECIMAL (5)  NOT NULL,
    [NRRECORDSET]    VARCHAR (50) NOT NULL,
    [PIUMENO]        VARCHAR (1)  DEFAULT (' ') NULL,
    [Q_V]            SMALLINT     NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_TABEXTRADEPCAUS] PRIMARY KEY CLUSTERED ([CODCAUSALE] ASC, [NRRECORDSET] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CKC_PIUMENO_TABEXTRAD] CHECK ([PIUMENO] = '-' or [PIUMENO] = '+' or [PIUMENO] = 'A' or [PIUMENO] = ' ')
);


GO

/*  INSERT TRIGGER "TI_TABEXTRADEPCAUS" FOR TABLE "TABEXTRADEPCAUS"  */
CREATE TRIGGER TI_TABEXTRADEPCAUS ON TABEXTRADEPCAUS FOR INSERT AS
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

    
    /*  PARENT "TABCAUSALIMAG" MUST EXIST WHEN INSERTING A CHILD IN "TABEXTRADEPCAUS"  */
    IF UPDATE(CODCAUSALE)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   TABCAUSALIMAG T1, INSERTED T2
           WHERE  T1.CODICE = T2.CODCAUSALE) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "TABCAUSALIMAG". Cannot create child in "TABEXTRADEPCAUS".'
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

/*  UPDATE TRIGGER "TU_TABEXTRADEPCAUS" FOR TABLE "TABEXTRADEPCAUS"  */
CREATE TRIGGER TU_TABEXTRADEPCAUS ON TABEXTRADEPCAUS FOR UPDATE AS
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

      
      /*  PARENT "TABCAUSALIMAG" MUST EXIST WHEN UPDATING A CHILD IN "TABEXTRADEPCAUS"  */
      IF UPDATE(CODCAUSALE)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   TABCAUSALIMAG T1, INSERTED T2
             WHERE  T1.CODICE = T2.CODCAUSALE) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"TABCAUSALIMAG" does not exist. Cannot modify child in "TABEXTRADEPCAUS".'
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
    ON OBJECT::[dbo].[TABEXTRADEPCAUS] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABEXTRADEPCAUS] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABEXTRADEPCAUS] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABEXTRADEPCAUS] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABEXTRADEPCAUS] TO [Metodo98]
    AS [dbo];

