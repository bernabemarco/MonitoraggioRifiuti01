﻿CREATE TABLE [dbo].[ANACARUTENSILI] (
    [UTENSILE]       VARCHAR (15)  NOT NULL,
    [NRRIGA]         INT           NOT NULL,
    [VALORE]         VARCHAR (100) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    CONSTRAINT [PK_ANACARUTENSILI] PRIMARY KEY CLUSTERED ([UTENSILE] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  INSERT TRIGGER "TI_ANACARUTENSILI" FOR TABLE "ANACARUTENSILI"  */
CREATE TRIGGER TI_ANACARUTENSILI ON ANACARUTENSILI FOR INSERT AS
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

    
    /*  PARENT "TABUTENSILI" MUST EXIST WHEN INSERTING A CHILD IN "ANACARUTENSILI"  */
    IF UPDATE(UTENSILE)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   TABUTENSILI T1, INSERTED T2
           WHERE  T1.CODICE = T2.UTENSILE) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "TABUTENSILI". Cannot create child in "ANACARUTENSILI".'
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

/*  UPDATE TRIGGER "TU_ANACARUTENSILI" FOR TABLE "ANACARUTENSILI"  */
CREATE TRIGGER TU_ANACARUTENSILI ON ANACARUTENSILI FOR UPDATE AS
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

      
      /*  PARENT "TABUTENSILI" MUST EXIST WHEN UPDATING A CHILD IN "ANACARUTENSILI"  */
      IF UPDATE(UTENSILE)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   TABUTENSILI T1, INSERTED T2
             WHERE  T1.CODICE = T2.UTENSILE) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"TABUTENSILI" does not exist. Cannot ALTER COLUMN child in "ANACARUTENSILI".'
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
    ON OBJECT::[dbo].[ANACARUTENSILI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ANACARUTENSILI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ANACARUTENSILI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ANACARUTENSILI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ANACARUTENSILI] TO [Metodo98]
    AS [dbo];

