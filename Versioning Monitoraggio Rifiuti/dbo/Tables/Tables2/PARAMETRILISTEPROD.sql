﻿CREATE TABLE [dbo].[PARAMETRILISTEPROD] (
    [CODICE]                     VARCHAR (3)   NOT NULL,
    [DESCRIZIONE]                VARCHAR (80)  NULL,
    [NOTE]                       VARCHAR (100) NULL,
    [TIPOLISTA]                  SMALLINT      DEFAULT (0) NOT NULL,
    [CONTATORELISTA]             DECIMAL (5)   NULL,
    [TIPORIGA]                   VARCHAR (3)   NULL,
    [TIPOUM]                     DECIMAL (5)   NULL,
    [USATIPOORD]                 SMALLINT      DEFAULT (0) NULL,
    [CAUSALEMOV]                 DECIMAL (5)   NULL,
    [CODDEPOSITOMOV]             VARCHAR (10)  NULL,
    [SEQDEPMOV]                  VARCHAR (5)   NULL,
    [CAUSALEMOVCOLL]             DECIMAL (5)   NULL,
    [CODDEPMOVCOLL]              VARCHAR (10)  NULL,
    [SEQDEPMOVCOLL]              VARCHAR (5)   NULL,
    [CAUSALESCARTO]              DECIMAL (5)   NULL,
    [CODDEPOSITOSCR]             VARCHAR (10)  NULL,
    [SEQDEPSCR]                  VARCHAR (5)   NULL,
    [CAUSALESCRCOLL]             DECIMAL (5)   NULL,
    [CODDEPSCRCOLL]              VARCHAR (10)  NULL,
    [SEQDEPSCRCOLL]              VARCHAR (5)   NULL,
    [DATAMODIFICA]               DATETIME      NOT NULL,
    [UTENTEMODIFICA]             VARCHAR (25)  NOT NULL,
    [CAUSALEPREL]                DECIMAL (5)   NULL,
    [CODDEPOSITOPREL]            VARCHAR (10)  NULL,
    [SEQDEPPREL]                 VARCHAR (5)   NULL,
    [CAUSALEPRELCOLL]            DECIMAL (5)   NULL,
    [CODDEPPRELCOLL]             VARCHAR (10)  NULL,
    [SEQDEPPRELCOLL]             VARCHAR (5)   NULL,
    [CAUSALESCARTOPREL]          DECIMAL (5)   NULL,
    [CODDEPOSITOSCRPREL]         VARCHAR (10)  NULL,
    [SEQDEPSCRPREL]              VARCHAR (5)   NULL,
    [CAUSALESCRCOLLPREL]         DECIMAL (5)   NULL,
    [CODDEPSCRCOLLPREL]          VARCHAR (10)  NULL,
    [SEQDEPSCRCOLLPREL]          VARCHAR (5)   NULL,
    [NUMEROMAXRIGHE]             SMALLINT      CONSTRAINT [DF_PARAMETRILISTEPROD_NUMEROMAXRIGHE] DEFAULT (1000) NULL,
    [FLGPRELEVARESIDUOIMPEGNATO] SMALLINT      NULL,
    CONSTRAINT [PK_PARAMETRILISTEPROD] PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CKC_TIPOLISTA_PARAMETR] CHECK ([TIPOLISTA] = 3 or [TIPOLISTA] = 2 or [TIPOLISTA] = 1 or [TIPOLISTA] = 0),
    CONSTRAINT [CKC_USATIPOORD_PARAMETR] CHECK ([USATIPOORD] = 0 or [USATIPOORD] = 1)
);


GO

/*  UPDATE TRIGGER "TU_PARAMETRILISTEPROD" FOR TABLE "PARAMETRILISTEPROD"  */
CREATE TRIGGER TU_PARAMETRILISTEPROD ON PARAMETRILISTEPROD FOR UPDATE AS
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

      
      /*  CANNOT ALTER COLUMN PARENT CODE IN "PARAMETRILISTEPROD" IF CHILDREN STILL EXIST IN "TESTELISTAMOV"  */
      IF UPDATE(CODICE)
      BEGIN
         IF EXISTS (SELECT 1
                    FROM   TESTELISTAMOV T2, INSERTED I1, DELETED D1
                    WHERE  T2.CODICELISTA = D1.CODICE
                     AND  (I1.CODICE != D1.CODICE))
            BEGIN
               SELECT @ERRNO  = 30005,
                      @ERRMSG = 'Children still exist in "TESTELISTAMOV". Cannot ALTER COLUMN parent code in "PARAMETRILISTEPROD".'
               GOTO ERROR
            END
      END
      
      /*  ALTER COLUMN PARENT CODE OF "PARAMETRILISTEPROD" FOR ALL CHILDREN IN "ACCESSILISTEMOV"  */
      IF UPDATE(CODICE)
      BEGIN
         UPDATE ACCESSILISTEMOV
          SET   CODLISTA = I1.CODICE
         FROM   ACCESSILISTEMOV T2, INSERTED I1, DELETED D1
         WHERE  T2.CODLISTA = D1.CODICE
          AND  (I1.CODICE != D1.CODICE)
      END

      RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO

/*  DELETE TRIGGER "TD_PARAMETRILISTEPROD" FOR TABLE "PARAMETRILISTEPROD"  */
CREATE TRIGGER TD_PARAMETRILISTEPROD ON PARAMETRILISTEPROD FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  CANNOT DELETE PARENT "PARAMETRILISTEPROD" IF CHILDREN STILL EXIST IN "TESTELISTAMOV"  */
    IF EXISTS (SELECT 1
               FROM   TESTELISTAMOV T2, DELETED T1
               WHERE  T2.CODICELISTA = T1.CODICE)
       BEGIN
          SELECT @ERRNO  = 30006,
                 @ERRMSG = 'Children still exist in "TESTELISTAMOV". Cannot delete parent "PARAMETRILISTEPROD".'
          GOTO ERROR
       END
    
    /*  DELETE ALL CHILDREN IN "ACCESSILISTEMOV"  */
    DELETE ACCESSILISTEMOV
    FROM   ACCESSILISTEMOV T2, DELETED T1
    WHERE  T2.CODLISTA = T1.CODICE

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[PARAMETRILISTEPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PARAMETRILISTEPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PARAMETRILISTEPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PARAMETRILISTEPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PARAMETRILISTEPROD] TO [Metodo98]
    AS [dbo];

