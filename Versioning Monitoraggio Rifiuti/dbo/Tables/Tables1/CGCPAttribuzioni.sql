CREATE TABLE [dbo].[CGCPAttribuzioni] (
    [Progressivo]     DECIMAL (10)  NOT NULL,
    [TipoScheda]      VARCHAR (5)   DEFAULT ('') NULL,
    [Voce]            VARCHAR (10)  DEFAULT ('') NULL,
    [Tipo]            SMALLINT      DEFAULT (1) NULL,
    [VoceRiferimento] VARCHAR (10)  DEFAULT ('') NULL,
    [Anno]            DECIMAL (5)   DEFAULT (0) NULL,
    [Mese]            INT           DEFAULT (0) NULL,
    [Note]            VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica]  VARCHAR (25)  NOT NULL,
    [DataModifica]    DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CGCPAttribuzioni_TVTVAM]
    ON [dbo].[CGCPAttribuzioni]([TipoScheda] ASC, [Voce] ASC, [Tipo] ASC, [VoceRiferimento] ASC, [Anno] ASC, [Mese] ASC) WITH (FILLFACTOR = 90);


GO

/*  UPDATE TRIGGER "TU_CGCPAttribuzioni" FOR TABLE "CGCPAttribuzioni"  */
CREATE TRIGGER TU_CGCPAttribuzioni ON CGCPAttribuzioni FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "CGCPAttribuzioni" FOR ALL CHILDREN IN "CGCPAttribuzioniRighe"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE CGCPAttribuzioniRighe
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   CGCPAttribuzioniRighe T2, INSERTED I1, DELETED D1
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

/*  DELETE TRIGGER "TD_CGCPAttribuzioni" FOR TABLE "CGCPAttribuzioni"  */
CREATE TRIGGER TD_CGCPAttribuzioni ON CGCPAttribuzioni FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGCPAttribuzioniRighe"  */
    DELETE CGCPAttribuzioniRighe
    FROM   CGCPAttribuzioniRighe T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPAttribuzioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPAttribuzioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPAttribuzioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPAttribuzioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPAttribuzioni] TO [Metodo98]
    AS [dbo];

