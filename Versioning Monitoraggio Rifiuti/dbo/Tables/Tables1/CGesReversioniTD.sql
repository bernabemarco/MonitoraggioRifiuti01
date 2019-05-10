CREATE TABLE [dbo].[CGesReversioniTD] (
    [Progressivo]        DECIMAL (10)  NOT NULL,
    [Ambiente]           VARCHAR (3)   DEFAULT ('') NULL,
    [CodTipoDestOrigine] VARCHAR (3)   DEFAULT ('') NULL,
    [TipoTariffa]        SMALLINT      DEFAULT (0) NULL,
    [CodConto]           VARCHAR (20)  DEFAULT ('') NULL,
    [AnnoValidita]       DECIMAL (5)   DEFAULT (0) NULL,
    [MeseValidita]       INT           DEFAULT (0) NULL,
    [CriterioRev]        SMALLINT      DEFAULT (0) NULL,
    [ModalitaRev]        SMALLINT      DEFAULT (0) NULL,
    [ModalitaErr]        SMALLINT      DEFAULT (0) NULL,
    [TipoReversione]     SMALLINT      DEFAULT (0) NULL,
    [ModalitaCosto]      SMALLINT      DEFAULT (0) NULL,
    [UnitaMisura]        VARCHAR (5)   DEFAULT ('') NULL,
    [ContoSelezionato]   VARCHAR (20)  DEFAULT ('') NULL,
    [Normalizzate]       SMALLINT      DEFAULT (0) NULL,
    [Note]               VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica]     VARCHAR (25)  NOT NULL,
    [DataModifica]       DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CGesReversioniTD_AmbDTCAM]
    ON [dbo].[CGesReversioniTD]([Ambiente] ASC, [CodTipoDestOrigine] ASC, [TipoTariffa] ASC, [CodConto] ASC, [AnnoValidita] ASC, [MeseValidita] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CGesReversioniTD_AmbDC]
    ON [dbo].[CGesReversioniTD]([Ambiente] ASC, [CodTipoDestOrigine] ASC, [CodConto] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CGesReversioniTD_AmbDTAM]
    ON [dbo].[CGesReversioniTD]([Ambiente] ASC, [CodTipoDestOrigine] ASC, [TipoTariffa] ASC, [AnnoValidita] ASC, [MeseValidita] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CGesReversioniTD_AMC]
    ON [dbo].[CGesReversioniTD]([AnnoValidita] ASC, [MeseValidita] ASC, [CodConto] ASC) WITH (FILLFACTOR = 90);


GO

/*  UPDATE TRIGGER "TU_CGesReversioniTD" FOR TABLE "CGesReversioniTD"  */
CREATE TRIGGER TU_CGesReversioniTD ON CGesReversioniTD FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "CGesReversioniTD" FOR ALL CHILDREN IN "CGesReversioniTDRighe"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE CGesReversioniTDRighe
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   CGesReversioniTDRighe T2, INSERTED I1, DELETED D1
         WHERE  T2.RIFPROGRESSIVO = D1.PROGRESSIVO
          AND  (I1.PROGRESSIVO != D1.PROGRESSIVO)
      END
      
      /*  MODIFY PARENT CODE OF "CGesReversioniTD" FOR ALL CHILDREN IN "CGesReversioniTDContoSel"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE CGesReversioniTDContoSel
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   CGesReversioniTDContoSel T2, INSERTED I1, DELETED D1
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

/*  DELETE TRIGGER "TD_CGesReversioniTD" FOR TABLE "CGesReversioniTD"  */
CREATE TRIGGER TD_CGesReversioniTD ON CGesReversioniTD FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGesReversioniTDRighe"  */
    DELETE CGesReversioniTDRighe
    FROM   CGesReversioniTDRighe T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    /*  DELETE ALL CHILDREN IN "CGesReversioniTDContoSel"  */
    DELETE CGesReversioniTDContoSel
    FROM   CGesReversioniTDContoSel T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesReversioniTD] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesReversioniTD] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesReversioniTD] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesReversioniTD] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesReversioniTD] TO [Metodo98]
    AS [dbo];

