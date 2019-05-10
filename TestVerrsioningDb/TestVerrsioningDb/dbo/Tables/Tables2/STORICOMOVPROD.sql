﻿CREATE TABLE [dbo].[STORICOMOVPROD] (
    [PROGRESSIVO]    DECIMAL (10)  NOT NULL,
    [ESERCIZIO]      DECIMAL (5)   NOT NULL,
    [RIFTESTA]       DECIMAL (10)  DEFAULT (0) NULL,
    [DATAMOV]        DATETIME      NULL,
    [TIPOMOV]        SMALLINT      DEFAULT (0) NULL,
    [STATOMOV]       SMALLINT      DEFAULT (0) NULL,
    [NOTE]           VARCHAR (255) NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    CONSTRAINT [PK_STORICOMOVPROD] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CKC_STATOMOV_STORICOM] CHECK ([STATOMOV] >= 0 and [STATOMOV] <= 1 and ([STATOMOV] = 1 or [STATOMOV] = 0)),
    CONSTRAINT [CKC_TIPOMOV_STORICOM] CHECK ([TIPOMOV] = 3 or [TIPOMOV] = 2 or [TIPOMOV] = 1 or [TIPOMOV] = 0)
);


GO
CREATE NONCLUSTERED INDEX [STORICOMOVPROD_RIFCOMM]
    ON [dbo].[STORICOMOVPROD]([RIFTESTA] ASC) WITH (FILLFACTOR = 90);


GO

/*  UPDATE TRIGGER "TU_STORICOMOVPROD" FOR TABLE "STORICOMOVPROD"  */
CREATE TRIGGER TU_STORICOMOVPROD ON STORICOMOVPROD FOR UPDATE AS
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

      
      /*  ALTER COLUMN PARENT CODE OF "STORICOMOVPROD" FOR ALL CHILDREN IN "STORICOMOVORDPROD"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE STORICOMOVORDPROD
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   STORICOMOVORDPROD T2, INSERTED I1, DELETED D1
         WHERE  T2.RIFPROGRESSIVO = D1.PROGRESSIVO
          AND  (I1.PROGRESSIVO != D1.PROGRESSIVO)
      END

      RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO

/*  DELETE TRIGGER "TD_STORICOMOVPROD" FOR TABLE "STORICOMOVPROD"  */
CREATE TRIGGER TD_STORICOMOVPROD ON STORICOMOVPROD FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "STORICOMOVORDPROD"  */
    DELETE STORICOMOVORDPROD
    FROM   STORICOMOVORDPROD T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[STORICOMOVPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[STORICOMOVPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[STORICOMOVPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[STORICOMOVPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[STORICOMOVPROD] TO [Metodo98]
    AS [dbo];

