CREATE TABLE [dbo].[CGCPValoriSchedeTeste] (
    [Progressivo]     DECIMAL (10)    NOT NULL,
    [Articolo]        VARCHAR (50)    DEFAULT ('') NULL,
    [Anno]            DECIMAL (5)     DEFAULT (0) NULL,
    [Mese]            INT             DEFAULT (0) NULL,
    [Aggregato]       VARCHAR (10)    DEFAULT ('') NULL,
    [TipoScheda]      VARCHAR (5)     DEFAULT ('') NULL,
    [DataCalcolo]     DATETIME        NULL,
    [Minuti]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [UtenteModifica]  VARCHAR (25)    NOT NULL,
    [DataModifica]    DATETIME        NOT NULL,
    [FlagArticoloODP] SMALLINT        DEFAULT (0) NULL,
    [IDTesta]         DECIMAL (10)    DEFAULT (0) NULL,
    [IDRiga]          INT             DEFAULT (0) NULL,
    [Tipo]            SMALLINT        DEFAULT (0) NULL,
    [QtaGestione]     DECIMAL (16, 6) DEFAULT (0) NULL,
    [QtaVersata]      DECIMAL (16, 6) DEFAULT (0) NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  UPDATE TRIGGER "TU_CGCPValoriSchedeTeste" FOR TABLE "CGCPValoriSchedeTeste"  */
CREATE TRIGGER TU_CGCPValoriSchedeTeste ON CGCPValoriSchedeTeste FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "CGCPValoriSchedeTeste" FOR ALL CHILDREN IN "CGCPValoriSchedeRighe"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE CGCPValoriSchedeRighe
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   CGCPValoriSchedeRighe T2, INSERTED I1, DELETED D1
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

/*  DELETE TRIGGER "TD_CGCPValoriSchedeTeste" FOR TABLE "CGCPValoriSchedeTeste"  */
CREATE TRIGGER TD_CGCPValoriSchedeTeste ON CGCPValoriSchedeTeste FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGCPValoriSchedeRighe"  */
    DELETE CGCPValoriSchedeRighe
    FROM   CGCPValoriSchedeRighe T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPValoriSchedeTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPValoriSchedeTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPValoriSchedeTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPValoriSchedeTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPValoriSchedeTeste] TO [Metodo98]
    AS [dbo];

