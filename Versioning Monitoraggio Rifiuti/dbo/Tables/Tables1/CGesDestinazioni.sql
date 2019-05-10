CREATE TABLE [dbo].[CGesDestinazioni] (
    [Progressivo]      DECIMAL (10)  NOT NULL,
    [CodDestinazione]  VARCHAR (10)  DEFAULT ('') NULL,
    [Descrizione]      VARCHAR (80)  DEFAULT ('') NULL,
    [TipoDestinazione] VARCHAR (3)   DEFAULT ('') NULL,
    [Divisione]        VARCHAR (3)   DEFAULT ('') NULL,
    [Responsabile]     VARCHAR (3)   DEFAULT ('') NULL,
    [TipoReversioni]   SMALLINT      DEFAULT (0) NULL,
    [TipoMisurazione]  SMALLINT      DEFAULT (0) NULL,
    [UMPrimaria]       VARCHAR (5)   DEFAULT ('') NULL,
    [UMSecondaria]     VARCHAR (5)   DEFAULT ('') NULL,
    [UMPrimaria2]      VARCHAR (5)   DEFAULT ('') NULL,
    [UMSecondaria2]    VARCHAR (5)   DEFAULT ('') NULL,
    [TipoRiferimento]  SMALLINT      DEFAULT (0) NULL,
    [ContoSelezionato] VARCHAR (500) DEFAULT ('') NULL,
    [RiclCosti]        VARCHAR (5)   DEFAULT ('') NULL,
    [RiclRicavi]       VARCHAR (5)   DEFAULT ('') NULL,
    [CodCentroRif]     VARCHAR (10)  DEFAULT ('') NULL,
    [UtenteModifica]   VARCHAR (25)  NOT NULL,
    [DataModifica]     DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CGesDestinazioni_CodDes]
    ON [dbo].[CGesDestinazioni]([CodDestinazione] ASC) WITH (FILLFACTOR = 90);


GO

/*  UPDATE TRIGGER "TU_CGesDestinazioni" FOR TABLE "CGesDestinazioni"  */
CREATE TRIGGER TU_CGesDestinazioni ON CGesDestinazioni FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "CGesDestinazioni" FOR ALL CHILDREN IN "CGesDestinazioniDestRep"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE CGesDestinazioniDestRep
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   CGesDestinazioniDestRep T2, INSERTED I1, DELETED D1
         WHERE  T2.RIFPROGRESSIVO = D1.PROGRESSIVO
          AND  (I1.PROGRESSIVO != D1.PROGRESSIVO)
      END
      
      /*  MODIFY PARENT CODE OF "CGesDestinazioni" FOR ALL CHILDREN IN "CGesDestinazioniDestRif"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE CGesDestinazioniDestRif
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   CGesDestinazioniDestRif T2, INSERTED I1, DELETED D1
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

/*  DELETE TRIGGER "TD_CGesDestinazioni" FOR TABLE "CGesDestinazioni"  */
CREATE TRIGGER TD_CGesDestinazioni ON CGesDestinazioni FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGesDestinazioniDestRep"  */
    DELETE CGesDestinazioniDestRep
    FROM   CGesDestinazioniDestRep T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    /*  DELETE ALL CHILDREN IN "CGesDestinazioniDestRif"  */
    DELETE CGesDestinazioniDestRif
    FROM   CGesDestinazioniDestRif T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesDestinazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesDestinazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesDestinazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesDestinazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesDestinazioni] TO [Metodo98]
    AS [dbo];

