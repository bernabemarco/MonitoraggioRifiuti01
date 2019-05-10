CREATE TABLE [dbo].[CGesRipartizioni] (
    [Progressivo]      DECIMAL (10)  NOT NULL,
    [Ambiente]         VARCHAR (3)   DEFAULT ('') NULL,
    [CodConto]         VARCHAR (20)  DEFAULT ('') NULL,
    [AnnoValidita]     DECIMAL (5)   DEFAULT (0) NULL,
    [MeseValidita]     INT           DEFAULT (0) NULL,
    [CriterioRip]      SMALLINT      DEFAULT (0) NULL,
    [ModalitaRip]      SMALLINT      DEFAULT (0) NULL,
    [ModalitaErr]      SMALLINT      DEFAULT (0) NULL,
    [UnitaMisura]      VARCHAR (5)   DEFAULT ('') NULL,
    [ContoSelezionato] VARCHAR (20)  DEFAULT ('') NULL,
    [Note]             VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica]   VARCHAR (25)  NOT NULL,
    [DataModifica]     DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CGesRipartizioni_AmbConAM]
    ON [dbo].[CGesRipartizioni]([Ambiente] ASC, [CodConto] ASC, [AnnoValidita] ASC, [MeseValidita] ASC) WITH (FILLFACTOR = 90);


GO

/*  UPDATE TRIGGER "TU_CGesRipartizioni" FOR TABLE "CGesRipartizioni"  */
CREATE TRIGGER TU_CGesRipartizioni ON CGesRipartizioni FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "CGesRipartizioni" FOR ALL CHILDREN IN "CGesRipartizioniRighe"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE CGesRipartizioniRighe
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   CGesRipartizioniRighe T2, INSERTED I1, DELETED D1
         WHERE  T2.RIFPROGRESSIVO = D1.PROGRESSIVO
          AND  (I1.PROGRESSIVO != D1.PROGRESSIVO)
      END
      
      /*  MODIFY PARENT CODE OF "CGesRipartizioni" FOR ALL CHILDREN IN "CGesRipartizioniContoSel"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE CGesRipartizioniContoSel
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   CGesRipartizioniContoSel T2, INSERTED I1, DELETED D1
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

/*  DELETE TRIGGER "TD_CGesRipartizioni" FOR TABLE "CGesRipartizioni"  */
CREATE TRIGGER TD_CGesRipartizioni ON CGesRipartizioni FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGesRipartizioniRighe"  */
    DELETE CGesRipartizioniRighe
    FROM   CGesRipartizioniRighe T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    /*  DELETE ALL CHILDREN IN "CGesRipartizioniContoSel"  */
    DELETE CGesRipartizioniContoSel
    FROM   CGesRipartizioniContoSel T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesRipartizioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesRipartizioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesRipartizioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesRipartizioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesRipartizioni] TO [Metodo98]
    AS [dbo];

