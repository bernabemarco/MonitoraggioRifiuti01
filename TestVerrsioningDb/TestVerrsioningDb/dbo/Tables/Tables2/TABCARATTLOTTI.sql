﻿CREATE TABLE [dbo].[TABCARATTLOTTI] (
    [CODICE]          DECIMAL (5)  NOT NULL,
    [NRRIGA]          SMALLINT     NOT NULL,
    [CARDESCRIZIONE]  VARCHAR (80) NULL,
    [CARTIPO]         SMALLINT     NULL,
    [CARNUMCARATTERI] SMALLINT     NULL,
    [UTENTEMODIFICA]  VARCHAR (25) NOT NULL,
    [DATAMODIFICA]    DATETIME     NOT NULL,
    [CARATTDEFAULT]   VARCHAR (80) NULL,
    [PRIORITA]        SMALLINT     CONSTRAINT [DF_TABCARATTLOTTI_PRIORITA] DEFAULT (0) NULL,
    [CRITERIO]        SMALLINT     CONSTRAINT [DF_TABCARATTLOTTI_CRITERIO] DEFAULT (0) NULL,
    [TIPOLOGIADATA]   SMALLINT     DEFAULT ((0)) NULL,
    [TIPOPESO]        SMALLINT     DEFAULT ((0)) NULL,
    CONSTRAINT [PK_TABCARATTLOTTI] PRIMARY KEY CLUSTERED ([CODICE] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [CARMDESCRIZIONE]
    ON [dbo].[TABCARATTLOTTI]([CARDESCRIZIONE] ASC) WITH (FILLFACTOR = 90);


GO

/*  INSERT TRIGGER "TI_TABCARATTLOTTI" FOR TABLE "TABCARATTLOTTI"  */
CREATE TRIGGER TI_TABCARATTLOTTI ON TABCARATTLOTTI FOR INSERT AS
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

    
    /*  PARENT "TABCATEGORIE" MUST EXIST WHEN INSERTING A CHILD IN "TABCARATTLOTTI"  */
    IF UPDATE(CODICE)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   TABCATEGORIE T1, INSERTED T2
           WHERE  T1.CODICE = T2.CODICE) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "TABCATEGORIE". Cannot create child in "TABCARATTLOTTI".'
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

/*  UPDATE TRIGGER "TU_TABCARATTLOTTI" FOR TABLE "TABCARATTLOTTI"  */
CREATE TRIGGER TU_TABCARATTLOTTI ON TABCARATTLOTTI FOR UPDATE AS
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

      
      /*  PARENT "TABCATEGORIE" MUST EXIST WHEN UPDATING A CHILD IN "TABCARATTLOTTI"  */
      IF UPDATE(CODICE)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   TABCATEGORIE T1, INSERTED T2
             WHERE  T1.CODICE = T2.CODICE) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"TABCATEGORIE" does not exist. Cannot modify child in "TABCARATTLOTTI".'
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
    ON OBJECT::[dbo].[TABCARATTLOTTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABCARATTLOTTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABCARATTLOTTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABCARATTLOTTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABCARATTLOTTI] TO [Metodo98]
    AS [dbo];
