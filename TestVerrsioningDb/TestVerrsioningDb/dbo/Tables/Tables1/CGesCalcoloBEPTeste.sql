CREATE TABLE [dbo].[CGesCalcoloBEPTeste] (
    [Progressivo]    DECIMAL (10) NOT NULL,
    [TipoReport]     SMALLINT     DEFAULT ((0)) NULL,
    [Nome]           VARCHAR (50) DEFAULT ('') NULL,
    [Ambiente]       VARCHAR (3)  DEFAULT ('') NULL,
    [AnnoInizio]     DECIMAL (5)  DEFAULT ((0)) NULL,
    [MeseInizio]     INT          DEFAULT ((0)) NULL,
    [AnnoFine]       DECIMAL (5)  DEFAULT ((0)) NULL,
    [MeseFine]       INT          DEFAULT ((0)) NULL,
    [DesPiede1]      VARCHAR (80) DEFAULT ('') NULL,
    [DesPiede2]      VARCHAR (80) DEFAULT ('') NULL,
    [DesPiede3]      VARCHAR (80) DEFAULT ('') NULL,
    [DesPiede4]      VARCHAR (80) DEFAULT ('') NULL,
    [DesPiede5]      VARCHAR (80) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO

/*  UPDATE TRIGGER "TU_CGesCalcoloBEPTeste" FOR TABLE "CGesCalcoloBEPTeste"  */
CREATE TRIGGER TU_CGesCalcoloBEPTeste ON CGesCalcoloBEPTeste FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "CGesCalcoloBEPTeste" FOR ALL CHILDREN IN "CGesCalcoloBEPRighe"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE CGesCalcoloBEPRighe
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   CGesCalcoloBEPRighe T2, INSERTED I1, DELETED D1
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

/*  DELETE TRIGGER "TD_CGesCalcoloBEPTeste" FOR TABLE "CGesCalcoloBEPTeste"  */
CREATE TRIGGER TD_CGesCalcoloBEPTeste ON CGesCalcoloBEPTeste FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGesCalcoloBEPRighe"  */
    DELETE CGesCalcoloBEPRighe
    FROM   CGesCalcoloBEPRighe T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesCalcoloBEPTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesCalcoloBEPTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesCalcoloBEPTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesCalcoloBEPTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesCalcoloBEPTeste] TO [Metodo98]
    AS [dbo];

