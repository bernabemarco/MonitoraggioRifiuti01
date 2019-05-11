﻿CREATE TABLE [dbo].[TABLISTINIFORTRASF] (
    [CODFOR]         VARCHAR (7)  NOT NULL,
    [NRLISTINO]      DECIMAL (5)  NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_TABLISTINIFORTRASF] PRIMARY KEY CLUSTERED ([CODFOR] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  INSERT TRIGGER "TI_TABLISTINIFORTRASF" FOR TABLE "TABLISTINIFORTRASF"  */
CREATE TRIGGER TI_TABLISTINIFORTRASF ON TABLISTINIFORTRASF FOR INSERT AS
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

    
    /*  PARENT "TABLISTINITRASFORMAZIONE" MUST EXIST WHEN INSERTING A CHILD IN "TABLISTINIFORTRASF"  */
    IF UPDATE(NRLISTINO)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   TABLISTINITRASFORMAZIONE T1, INSERTED T2
           WHERE  T1.NRLISTINO = T2.NRLISTINO) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "TABLISTINITRASFORMAZIONE". Cannot create child in "TABLISTINIFORTRASF".'
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

/*  UPDATE TRIGGER "TU_TABLISTINIFORTRASF" FOR TABLE "TABLISTINIFORTRASF"  */
CREATE TRIGGER TU_TABLISTINIFORTRASF ON TABLISTINIFORTRASF FOR UPDATE AS
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

      
      /*  PARENT "TABLISTINITRASFORMAZIONE" MUST EXIST WHEN UPDATING A CHILD IN "TABLISTINIFORTRASF"  */
      IF UPDATE(NRLISTINO)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   TABLISTINITRASFORMAZIONE T1, INSERTED T2
             WHERE  T1.NRLISTINO = T2.NRLISTINO) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"TABLISTINITRASFORMAZIONE" does not exist. Cannot ALTER COLUMN child in "TABLISTINIFORTRASF".'
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
    ON OBJECT::[dbo].[TABLISTINIFORTRASF] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABLISTINIFORTRASF] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABLISTINIFORTRASF] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABLISTINIFORTRASF] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABLISTINIFORTRASF] TO [Metodo98]
    AS [dbo];
