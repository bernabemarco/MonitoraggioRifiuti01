CREATE TABLE [dbo].[CGesFoglioRiepilogo] (
    [Progressivo]           DECIMAL (10) NOT NULL,
    [Codice]                VARCHAR (5)  DEFAULT ('') NULL,
    [NumFoglio]             INT          DEFAULT (0) NULL,
    [Descrizione]           VARCHAR (80) DEFAULT ('') NULL,
    [TipoRiclassificazione] VARCHAR (5)  DEFAULT ('') NULL,
    [DesColonna01]          VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna02]          VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna03]          VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna04]          VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna05]          VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna06]          VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna07]          VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna08]          VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna09]          VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna10]          VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna11]          VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna12]          VARCHAR (20) DEFAULT ('') NULL,
    [DesColonnaTot]         VARCHAR (20) DEFAULT ('') NULL,
    [DesIndice]             VARCHAR (80) DEFAULT ('') NULL,
    [DesTitolo]             VARCHAR (80) DEFAULT ('') NULL,
    [DesPiede01]            VARCHAR (80) DEFAULT ('') NULL,
    [DesPiede02]            VARCHAR (80) DEFAULT ('') NULL,
    [DesPiede03]            VARCHAR (80) DEFAULT ('') NULL,
    [DesPiede04]            VARCHAR (80) DEFAULT ('') NULL,
    [DesPiede05]            VARCHAR (80) DEFAULT ('') NULL,
    [DesPiede06]            VARCHAR (80) DEFAULT ('') NULL,
    [DesPiede07]            VARCHAR (80) DEFAULT ('') NULL,
    [DesPiede08]            VARCHAR (80) DEFAULT ('') NULL,
    [UtenteModifica]        VARCHAR (25) NOT NULL,
    [DataModifica]          DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CGesFoglioRiepilogo_CodNum]
    ON [dbo].[CGesFoglioRiepilogo]([Codice] ASC, [NumFoglio] ASC) WITH (FILLFACTOR = 90);


GO

/*  UPDATE TRIGGER "TU_CGesFoglioRiepilogo" FOR TABLE "CGesFoglioRiepilogo"  */
CREATE TRIGGER TU_CGesFoglioRiepilogo ON CGesFoglioRiepilogo FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "CGesFoglioRiepilogo" FOR ALL CHILDREN IN "CGesFoglioRiepilogoRighe"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE CGesFoglioRiepilogoRighe
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   CGesFoglioRiepilogoRighe T2, INSERTED I1, DELETED D1
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

/*  DELETE TRIGGER "TD_CGesFoglioRiepilogo" FOR TABLE "CGesFoglioRiepilogo"  */
CREATE TRIGGER TD_CGesFoglioRiepilogo ON CGesFoglioRiepilogo FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGesFoglioRiepilogoRighe"  */
    DELETE CGesFoglioRiepilogoRighe
    FROM   CGesFoglioRiepilogoRighe T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesFoglioRiepilogo] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesFoglioRiepilogo] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesFoglioRiepilogo] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesFoglioRiepilogo] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesFoglioRiepilogo] TO [Metodo98]
    AS [dbo];

