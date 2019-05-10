CREATE TABLE [dbo].[CGesFlussoGrandezzeFisiche] (
    [Progressivo]      DECIMAL (10)    NOT NULL,
    [Ambiente]         VARCHAR (3)     DEFAULT ('') NULL,
    [UMOrigine]        VARCHAR (5)     DEFAULT ('') NULL,
    [CodDestOrigine]   VARCHAR (10)    DEFAULT ('') NULL,
    [AnnoValidita]     DECIMAL (5)     DEFAULT (0) NULL,
    [MeseValidita]     INT             DEFAULT (0) NULL,
    [CriterioRip]      SMALLINT        DEFAULT (0) NULL,
    [ModalitaRip]      SMALLINT        DEFAULT (0) NULL,
    [ModalitaErr]      SMALLINT        DEFAULT (0) NULL,
    [UnitaMisura]      VARCHAR (5)     DEFAULT ('') NULL,
    [ContoSelezionato] VARCHAR (20)    DEFAULT ('') NULL,
    [UMDestinazione]   VARCHAR (5)     DEFAULT ('') NULL,
    [CoeffConversione] DECIMAL (19, 6) DEFAULT (0) NULL,
    [Note]             VARCHAR (100)   DEFAULT ('') NULL,
    [UtenteModifica]   VARCHAR (25)    NOT NULL,
    [DataModifica]     DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CGesFlussoGrandezzeFisiche_AmbUMDAM]
    ON [dbo].[CGesFlussoGrandezzeFisiche]([Ambiente] ASC, [UMOrigine] ASC, [CodDestOrigine] ASC, [AnnoValidita] ASC, [MeseValidita] ASC) WITH (FILLFACTOR = 90);


GO

/*  UPDATE TRIGGER "TU_CGesFlussoGrandezzeFisiche" FOR TABLE "CGesFlussoGrandezzeFisiche"  */
CREATE TRIGGER TU_CGesFlussoGrandezzeFisiche ON CGesFlussoGrandezzeFisiche FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "CGesFlussoGrandezzeFisiche" FOR ALL CHILDREN IN "CGesFlussoGrandezzeFisicheRighe"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE CGesFlussoGrandezzeFisicheRighe
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   CGesFlussoGrandezzeFisicheRighe T2, INSERTED I1, DELETED D1
         WHERE  T2.RIFPROGRESSIVO = D1.PROGRESSIVO
          AND  (I1.PROGRESSIVO != D1.PROGRESSIVO)
      END
      
      /*  MODIFY PARENT CODE OF "CGesFlussoGrandezzeFisiche" FOR ALL CHILDREN IN "CGesFlussoGrandezzeFisicheContoSel"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE CGesFlussoGrandezzeFisicheContoSel
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   CGesFlussoGrandezzeFisicheContoSel T2, INSERTED I1, DELETED D1
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

/*  DELETE TRIGGER "TD_CGesFlussoGrandezzeFisiche" FOR TABLE "CGesFlussoGrandezzeFisiche"  */
CREATE TRIGGER TD_CGesFlussoGrandezzeFisiche ON CGesFlussoGrandezzeFisiche FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGesFlussoGrandezzeFisicheRighe"  */
    DELETE CGesFlussoGrandezzeFisicheRighe
    FROM   CGesFlussoGrandezzeFisicheRighe T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    /*  DELETE ALL CHILDREN IN "CGesFlussoGrandezzeFisicheContoSel"  */
    DELETE CGesFlussoGrandezzeFisicheContoSel
    FROM   CGesFlussoGrandezzeFisicheContoSel T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesFlussoGrandezzeFisiche] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesFlussoGrandezzeFisiche] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesFlussoGrandezzeFisiche] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesFlussoGrandezzeFisiche] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesFlussoGrandezzeFisiche] TO [Metodo98]
    AS [dbo];

