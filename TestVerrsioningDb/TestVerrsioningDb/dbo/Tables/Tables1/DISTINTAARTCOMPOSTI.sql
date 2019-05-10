﻿CREATE TABLE [dbo].[DISTINTAARTCOMPOSTI] (
    [PROGRESSIVO]       DECIMAL (10)    NOT NULL,
    [IDENTIFICATIVODBA] VARCHAR (6)     NULL,
    [ARTCOMPOSTO]       VARCHAR (50)    NULL,
    [VERSIONEDBA]       VARCHAR (10)    NULL,
    [DSCVERSIONE]       VARCHAR (80)    NULL,
    [STATOVERSIONE]     SMALLINT        DEFAULT (0) NULL,
    [VALIDITADBA]       DATETIME        NOT NULL,
    [DBASTANDARD]       SMALLINT        DEFAULT (0) NULL,
    [NOTEDBA]           VARCHAR (255)   NULL,
    [UM]                VARCHAR (3)     NOT NULL,
    [QUANTITARIF]       DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [UTENTEMODIFICA]    VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]      DATETIME        NOT NULL,
    [RIFARTICOLO]       VARCHAR (50)    NULL,
    CONSTRAINT [PK_DISTINTAARTCOMPOSTI] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CKC_DBASTANDARD_DISTINTA] CHECK ([DBASTANDARD] = 0 or [DBASTANDARD] = 1)
);


GO
CREATE NONCLUSTERED INDEX [ARTCOMPOSTO]
    ON [dbo].[DISTINTAARTCOMPOSTI]([ARTCOMPOSTO] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ARTVALDBA]
    ON [dbo].[DISTINTAARTCOMPOSTI]([ARTCOMPOSTO] ASC, [VALIDITADBA] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ARTVALDBA1]
    ON [dbo].[DISTINTAARTCOMPOSTI]([ARTCOMPOSTO] ASC, [VERSIONEDBA] ASC, [VALIDITADBA] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ARTVALDBA2]
    ON [dbo].[DISTINTAARTCOMPOSTI]([ARTCOMPOSTO] ASC, [DBASTANDARD] ASC, [VALIDITADBA] ASC) WITH (FILLFACTOR = 90);


GO

/*  UPDATE TRIGGER "TU_DISTINTAARTCOMPOSTI" FOR TABLE "DISTINTAARTCOMPOSTI"  */
CREATE TRIGGER TU_DISTINTAARTCOMPOSTI ON DISTINTAARTCOMPOSTI FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "DISTINTAARTCOMPOSTI" FOR ALL CHILDREN IN "DISTINTABASE"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE DISTINTABASE
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   DISTINTABASE T2, INSERTED I1, DELETED D1
         WHERE  T2.RIFPROGRESSIVO = D1.PROGRESSIVO
          AND  (I1.PROGRESSIVO != D1.PROGRESSIVO)
      END
      
      /*  MODIFY PARENT CODE OF "DISTINTAARTCOMPOSTI" FOR ALL CHILDREN IN "EXTRADISTINTA"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE EXTRADISTINTA
          SET   PROGRESSIVO = I1.PROGRESSIVO
         FROM   EXTRADISTINTA T2, INSERTED I1, DELETED D1
         WHERE  T2.PROGRESSIVO = D1.PROGRESSIVO
          AND  (I1.PROGRESSIVO != D1.PROGRESSIVO)
      END

      RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO

/*  DELETE TRIGGER "TD_DISTINTAARTCOMPOSTI" FOR TABLE "DISTINTAARTCOMPOSTI"  */
CREATE TRIGGER TD_DISTINTAARTCOMPOSTI ON DISTINTAARTCOMPOSTI FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "DISTINTABASE"  */
    DELETE DISTINTABASE
    FROM   DISTINTABASE T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    /*  DELETE ALL CHILDREN IN "EXTRADISTINTA"  */
    DELETE EXTRADISTINTA
    FROM   EXTRADISTINTA T2, DELETED T1
    WHERE  T2.PROGRESSIVO = T1.PROGRESSIVO

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[DISTINTAARTCOMPOSTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[DISTINTAARTCOMPOSTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[DISTINTAARTCOMPOSTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[DISTINTAARTCOMPOSTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[DISTINTAARTCOMPOSTI] TO [Metodo98]
    AS [dbo];

