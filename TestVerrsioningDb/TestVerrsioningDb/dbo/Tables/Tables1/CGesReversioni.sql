CREATE TABLE [dbo].[CGesReversioni] (
    [Progressivo]      DECIMAL (10)  NOT NULL,
    [Ambiente]         VARCHAR (3)   DEFAULT ('') NULL,
    [CodDestOrigine]   VARCHAR (10)  DEFAULT ('') NULL,
    [TipoTariffa]      SMALLINT      DEFAULT (0) NULL,
    [CodConto]         VARCHAR (20)  DEFAULT ('') NULL,
    [AnnoValidita]     DECIMAL (5)   DEFAULT (0) NULL,
    [MeseValidita]     INT           DEFAULT (0) NULL,
    [CriterioRev]      SMALLINT      DEFAULT (0) NULL,
    [ModalitaRev]      SMALLINT      DEFAULT (0) NULL,
    [ModalitaErr]      SMALLINT      DEFAULT (0) NULL,
    [TipoReversione]   SMALLINT      DEFAULT (0) NULL,
    [ModalitaCosto]    SMALLINT      DEFAULT (0) NULL,
    [UnitaMisura]      VARCHAR (5)   DEFAULT ('') NULL,
    [ContoSelezionato] VARCHAR (20)  DEFAULT ('') NULL,
    [Normalizzate]     SMALLINT      DEFAULT (0) NULL,
    [Note]             VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica]   VARCHAR (25)  NOT NULL,
    [DataModifica]     DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CGesReversioni_AmbDTCAM]
    ON [dbo].[CGesReversioni]([Ambiente] ASC, [CodDestOrigine] ASC, [TipoTariffa] ASC, [CodConto] ASC, [AnnoValidita] ASC, [MeseValidita] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CGesReversioni_AmbDC]
    ON [dbo].[CGesReversioni]([Ambiente] ASC, [CodDestOrigine] ASC, [CodConto] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CGesReversioni_AmbDTAM]
    ON [dbo].[CGesReversioni]([Ambiente] ASC, [CodDestOrigine] ASC, [TipoTariffa] ASC, [AnnoValidita] ASC, [MeseValidita] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CGesReversioni_AMC]
    ON [dbo].[CGesReversioni]([AnnoValidita] ASC, [MeseValidita] ASC, [CodConto] ASC) WITH (FILLFACTOR = 90);


GO

/*  UPDATE TRIGGER "TU_CGesReversioni" FOR TABLE "CGesReversioni"  */
CREATE TRIGGER TU_CGesReversioni ON CGesReversioni FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "CGesReversioni" FOR ALL CHILDREN IN "CGesReversioniRighe"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE CGesReversioniRighe
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   CGesReversioniRighe T2, INSERTED I1, DELETED D1
         WHERE  T2.RIFPROGRESSIVO = D1.PROGRESSIVO
          AND  (I1.PROGRESSIVO != D1.PROGRESSIVO)
      END
      
      /*  MODIFY PARENT CODE OF "CGesReversioni" FOR ALL CHILDREN IN "CGesReversioniContoSel"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE CGesReversioniContoSel
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   CGesReversioniContoSel T2, INSERTED I1, DELETED D1
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

/*  DELETE TRIGGER "TD_CGesReversioni" FOR TABLE "CGesReversioni"  */
CREATE TRIGGER TD_CGesReversioni ON CGesReversioni FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGesReversioniRighe"  */
    DELETE CGesReversioniRighe
    FROM   CGesReversioniRighe T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    /*  DELETE ALL CHILDREN IN "CGesReversioniContoSel"  */
    DELETE CGesReversioniContoSel
    FROM   CGesReversioniContoSel T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesReversioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesReversioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesReversioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesReversioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesReversioni] TO [Metodo98]
    AS [dbo];

