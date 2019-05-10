CREATE TABLE [dbo].[CGesGruppiDestinazioni] (
    [Progressivo]           DECIMAL (10) NOT NULL,
    [CodGruppo]             VARCHAR (10) DEFAULT ('') NULL,
    [Descrizione]           VARCHAR (80) DEFAULT ('') NULL,
    [TipoRiclassificazione] VARCHAR (5)  DEFAULT ('') NULL,
    [UnitaMisura]           VARCHAR (5)  DEFAULT ('') NULL,
    [UnitaMisura2]          VARCHAR (5)  DEFAULT ('') NULL,
    [UtenteModifica]        VARCHAR (25) NOT NULL,
    [DataModifica]          DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CGesGruppiDestinazioni_CodGru]
    ON [dbo].[CGesGruppiDestinazioni]([CodGruppo] ASC) WITH (FILLFACTOR = 90);


GO

/*  DELETE TRIGGER "TD_CGesGruppiDestinazioni" FOR TABLE "CGesGruppiDestinazioni"  */
CREATE TRIGGER TD_CGesGruppiDestinazioni ON CGesGruppiDestinazioni FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGesGruppiDestinazioniRighe"  */
    DELETE CGesGruppiDestinazioniRighe
    FROM   CGesGruppiDestinazioniRighe T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO

/*  UPDATE TRIGGER "TU_CGesGruppiDestinazioni" FOR TABLE "CGesGruppiDestinazioni"  */
CREATE TRIGGER TU_CGesGruppiDestinazioni ON CGesGruppiDestinazioni FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "CGesGruppiDestinazioni" FOR ALL CHILDREN IN "CGesGruppiDestinazioniRighe"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE CGesGruppiDestinazioniRighe
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   CGesGruppiDestinazioniRighe T2, INSERTED I1, DELETED D1
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
GRANT DELETE
    ON OBJECT::[dbo].[CGesGruppiDestinazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesGruppiDestinazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesGruppiDestinazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesGruppiDestinazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesGruppiDestinazioni] TO [Metodo98]
    AS [dbo];

