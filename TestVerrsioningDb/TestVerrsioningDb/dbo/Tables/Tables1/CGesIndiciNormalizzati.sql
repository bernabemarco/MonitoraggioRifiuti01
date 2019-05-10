CREATE TABLE [dbo].[CGesIndiciNormalizzati] (
    [Progressivo]     DECIMAL (10)  NOT NULL,
    [Ambiente]        VARCHAR (3)   DEFAULT ('') NULL,
    [CodDestinazione] VARCHAR (10)  DEFAULT ('') NULL,
    [AnnoValidita]    DECIMAL (5)   DEFAULT (0) NULL,
    [MeseValidita]    INT           DEFAULT (0) NULL,
    [Note]            VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica]  VARCHAR (25)  NOT NULL,
    [DataModifica]    DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CGesIndiciNormalizzati_AmbDesAM]
    ON [dbo].[CGesIndiciNormalizzati]([Ambiente] ASC, [CodDestinazione] ASC, [AnnoValidita] ASC, [MeseValidita] ASC) WITH (FILLFACTOR = 90);


GO

/*  UPDATE TRIGGER "TU_CGesIndiciNormalizzati" FOR TABLE "CGesIndiciNormalizzati"  */
CREATE TRIGGER TU_CGesIndiciNormalizzati ON CGesIndiciNormalizzati FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "CGesIndiciNormalizzati" FOR ALL CHILDREN IN "CGesIndiciNormalizzatiRighe"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE CGesIndiciNormalizzatiRighe
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   CGesIndiciNormalizzatiRighe T2, INSERTED I1, DELETED D1
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

/*  DELETE TRIGGER "TD_CGesIndiciNormalizzati" FOR TABLE "CGesIndiciNormalizzati"  */
CREATE TRIGGER TD_CGesIndiciNormalizzati ON CGesIndiciNormalizzati FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGesIndiciNormalizzatiRighe"  */
    DELETE CGesIndiciNormalizzatiRighe
    FROM   CGesIndiciNormalizzatiRighe T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesIndiciNormalizzati] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesIndiciNormalizzati] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesIndiciNormalizzati] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesIndiciNormalizzati] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesIndiciNormalizzati] TO [Metodo98]
    AS [dbo];

