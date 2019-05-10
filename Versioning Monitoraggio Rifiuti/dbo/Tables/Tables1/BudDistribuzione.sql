CREATE TABLE [dbo].[BudDistribuzione] (
    [Progressivo]      DECIMAL (10) NOT NULL,
    [CodDistribuzione] VARCHAR (3)  DEFAULT ('') NULL,
    [Descrizione]      VARCHAR (80) DEFAULT ('') NULL,
    [UtenteModifica]   VARCHAR (25) NOT NULL,
    [DataModifica]     DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [BudDistribuzione_Dis]
    ON [dbo].[BudDistribuzione]([CodDistribuzione] ASC) WITH (FILLFACTOR = 90);


GO

/*  UPDATE TRIGGER "TU_BudDistribuzione" FOR TABLE "BudDistribuzione"  */
CREATE TRIGGER TU_BudDistribuzione ON BudDistribuzione FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "BudDistribuzione" FOR ALL CHILDREN IN "BudDistribuzioneRighe"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE BudDistribuzioneRighe
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   BudDistribuzioneRighe T2, INSERTED I1, DELETED D1
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

/*  DELETE TRIGGER "TD_BudDistribuzione" FOR TABLE "BudDistribuzione"  */
CREATE TRIGGER TD_BudDistribuzione ON BudDistribuzione FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "BudDistribuzioneRighe"  */
    DELETE BudDistribuzioneRighe
    FROM   BudDistribuzioneRighe T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[BudDistribuzione] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudDistribuzione] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudDistribuzione] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudDistribuzione] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudDistribuzione] TO [Metodo98]
    AS [dbo];

