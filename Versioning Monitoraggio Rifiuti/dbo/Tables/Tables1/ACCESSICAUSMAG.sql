﻿CREATE TABLE [dbo].[ACCESSICAUSMAG] (
    [CODCAUMAG]      DECIMAL (5)  NOT NULL,
    [NOMEUTENTE]     VARCHAR (25) NOT NULL,
    [FLAGVISUALIZZA] SMALLINT     CONSTRAINT [DF_ACCESSICM_FLAGVISUALIZZA] DEFAULT (0) NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_ACCESSICAUSMAG] PRIMARY KEY CLUSTERED ([CODCAUMAG] ASC, [NOMEUTENTE] ASC) WITH (FILLFACTOR = 90)
);


GO
/*  UPDATE TRIGGER "TU_ACCESSICAUSMAG" FOR TABLE "ACCESSICAUSMAG"  */
CREATE TRIGGER TU_ACCESSICAUSMAG ON ACCESSICAUSMAG FOR UPDATE AS
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

      
      /*  PARENT "TABCAUSALIMAG" MUST EXIST WHEN UPDATING A CHILD IN "ACCESSICAUSMAG"  */
      IF UPDATE(CODCAUMAG)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   TABCAUSALIMAG T1, INSERTED T2
             WHERE  T1.CODICE = T2.CODCAUMAG) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"TABCAUSALIMAG" does not exist. Cannot modify child in "ACCESSICAUSMAG".'
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
/*  INSERT TRIGGER "TI_ACCESSICAUSMAG" FOR TABLE "ACCESSICAUSMAG"  */
CREATE TRIGGER TI_ACCESSICAUSMAG ON ACCESSICAUSMAG FOR INSERT AS
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

    
    /*  PARENT "TABCAUSALIMAG" MUST EXIST WHEN INSERTING A CHILD IN "ACCESSICAUSMAG"  */
    IF UPDATE(CODCAUMAG)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   TABCAUSALIMAG T1, INSERTED T2
           WHERE  T1.CODICE = T2.CODCAUMAG) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "TABCAUSALIMAG". Cannot create child in "ACCESSICAUSMAG".'
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
    ON OBJECT::[dbo].[ACCESSICAUSMAG] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ACCESSICAUSMAG] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ACCESSICAUSMAG] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ACCESSICAUSMAG] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ACCESSICAUSMAG] TO [Metodo98]
    AS [dbo];
