CREATE TABLE [dbo].[CGCPDettaglioCiclo] (
    [Progressivo]    DECIMAL (10)  NOT NULL,
    [GruppoCosti]    VARCHAR (3)   DEFAULT ('') NULL,
    [Anno]           DECIMAL (5)   DEFAULT (0) NULL,
    [Mese]           INT           DEFAULT (0) NULL,
    [Note]           VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CGCPDettaglioCiclo_GAM]
    ON [dbo].[CGCPDettaglioCiclo]([GruppoCosti] ASC, [Anno] ASC, [Mese] ASC) WITH (FILLFACTOR = 90);


GO

/*  DELETE TRIGGER "TD_CGCPDettaglioCiclo" FOR TABLE "CGCPDettaglioCiclo"  */
CREATE TRIGGER TD_CGCPDettaglioCiclo ON CGCPDettaglioCiclo FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGCPDettaglioCicloRighe"  */
    DELETE CGCPDettaglioCicloRighe
    FROM   CGCPDettaglioCicloRighe T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO

/*  UPDATE TRIGGER "TU_CGCPDettaglioCiclo" FOR TABLE "CGCPDettaglioCiclo"  */
CREATE TRIGGER TU_CGCPDettaglioCiclo ON CGCPDettaglioCiclo FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "CGCPDettaglioCiclo" FOR ALL CHILDREN IN "CGCPDettaglioCicloRighe"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE CGCPDettaglioCicloRighe
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   CGCPDettaglioCicloRighe T2, INSERTED I1, DELETED D1
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
    ON OBJECT::[dbo].[CGCPDettaglioCiclo] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPDettaglioCiclo] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPDettaglioCiclo] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPDettaglioCiclo] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPDettaglioCiclo] TO [Metodo98]
    AS [dbo];

