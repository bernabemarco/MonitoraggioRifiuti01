﻿CREATE TABLE [dbo].[TABAGENTIGRUPPO] (
    [CODGRUPPO]      DECIMAL (5)   NOT NULL,
    [FORMID]         INT           NOT NULL,
    [AGENTE]         VARCHAR (128) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    CONSTRAINT [PK_TABAGENTIGRUPPO] PRIMARY KEY CLUSTERED ([CODGRUPPO] ASC, [FORMID] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  UPDATE TRIGGER "TU_TABAGENTIGRUPPO" FOR TABLE "TABAGENTIGRUPPO"  */
CREATE TRIGGER TU_TABAGENTIGRUPPO ON TABAGENTIGRUPPO FOR UPDATE AS
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

      
      /*  PARENT "TABGRUPPIUTENTE" MUST EXIST WHEN UPDATING A CHILD IN "TABAGENTIGRUPPO"  */
      IF UPDATE(CODGRUPPO)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   TABGRUPPIUTENTE T1, INSERTED T2
             WHERE  T1.CODICE = T2.CODGRUPPO) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"TABGRUPPIUTENTE" does not exist. Cannot modify child in "TABAGENTIGRUPPO".'
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

/*  INSERT TRIGGER "TI_TABAGENTIGRUPPO" FOR TABLE "TABAGENTIGRUPPO"  */
CREATE TRIGGER TI_TABAGENTIGRUPPO ON TABAGENTIGRUPPO FOR INSERT AS
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

    
    /*  PARENT "TABGRUPPIUTENTE" MUST EXIST WHEN INSERTING A CHILD IN "TABAGENTIGRUPPO"  */
    IF UPDATE(CODGRUPPO)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   TABGRUPPIUTENTE T1, INSERTED T2
           WHERE  T1.CODICE = T2.CODGRUPPO) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "TABGRUPPIUTENTE". Cannot create child in "TABAGENTIGRUPPO".'
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
    ON OBJECT::[dbo].[TABAGENTIGRUPPO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABAGENTIGRUPPO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABAGENTIGRUPPO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABAGENTIGRUPPO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABAGENTIGRUPPO] TO [Metodo98]
    AS [dbo];
