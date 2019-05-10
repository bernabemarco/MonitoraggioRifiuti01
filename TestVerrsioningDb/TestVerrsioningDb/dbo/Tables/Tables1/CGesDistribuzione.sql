CREATE TABLE [dbo].[CGesDistribuzione] (
    [Progressivo]      DECIMAL (10) NOT NULL,
    [Ambiente]         VARCHAR (3)  DEFAULT ('') NULL,
    [CodDistribuzione] VARCHAR (3)  DEFAULT ('') NULL,
    [Descrizione]      VARCHAR (80) DEFAULT ('') NULL,
    [UtenteModifica]   VARCHAR (25) NOT NULL,
    [DataModifica]     DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CGesDistribuzione_AmbDis]
    ON [dbo].[CGesDistribuzione]([Ambiente] ASC, [CodDistribuzione] ASC) WITH (FILLFACTOR = 90);


GO

/*  UPDATE TRIGGER "TU_CGesDistribuzione" FOR TABLE "CGesDistribuzione"  */
CREATE TRIGGER TU_CGesDistribuzione ON CGesDistribuzione FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "CGesDistribuzione" FOR ALL CHILDREN IN "CGesDistribuzioneRighe"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE CGesDistribuzioneRighe
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   CGesDistribuzioneRighe T2, INSERTED I1, DELETED D1
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

/*  DELETE TRIGGER "TD_CGesDistribuzione" FOR TABLE "CGesDistribuzione"  */
CREATE TRIGGER TD_CGesDistribuzione ON CGesDistribuzione FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGesDistribuzioneRighe"  */
    DELETE CGesDistribuzioneRighe
    FROM   CGesDistribuzioneRighe T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesDistribuzione] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesDistribuzione] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesDistribuzione] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesDistribuzione] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesDistribuzione] TO [Metodo98]
    AS [dbo];

