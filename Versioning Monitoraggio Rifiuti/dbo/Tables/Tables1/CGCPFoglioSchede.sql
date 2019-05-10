CREATE TABLE [dbo].[CGCPFoglioSchede] (
    [Progressivo]    DECIMAL (10) NOT NULL,
    [Codice]         VARCHAR (5)  DEFAULT ('') NULL,
    [Descrizione]    VARCHAR (80) DEFAULT ('') NULL,
    [TipoScheda]     VARCHAR (5)  DEFAULT ('') NULL,
    [DesColonna01]   VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna02]   VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna03]   VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna04]   VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna05]   VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna06]   VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna07]   VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna08]   VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna09]   VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna10]   VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna11]   VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna12]   VARCHAR (20) DEFAULT ('') NULL,
    [DesTitolo]      VARCHAR (80) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CGCPFoglioSchede_Cod]
    ON [dbo].[CGCPFoglioSchede]([Codice] ASC) WITH (FILLFACTOR = 90);


GO

/*  UPDATE TRIGGER "TU_CGCPFoglioSchede" FOR TABLE "CGCPFoglioSchede"  */
CREATE TRIGGER TU_CGCPFoglioSchede ON CGCPFoglioSchede FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "CGCPFoglioSchede" FOR ALL CHILDREN IN "CGCPFoglioSchedeRighe"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE CGCPFoglioSchedeRighe
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   CGCPFoglioSchedeRighe T2, INSERTED I1, DELETED D1
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

/*  DELETE TRIGGER "TD_CGCPFoglioSchede" FOR TABLE "CGCPFoglioSchede"  */
CREATE TRIGGER TD_CGCPFoglioSchede ON CGCPFoglioSchede FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGCPFoglioSchedeRighe"  */
    DELETE CGCPFoglioSchedeRighe
    FROM   CGCPFoglioSchedeRighe T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPFoglioSchede] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPFoglioSchede] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPFoglioSchede] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPFoglioSchede] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPFoglioSchede] TO [Metodo98]
    AS [dbo];

