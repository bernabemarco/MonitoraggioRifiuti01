CREATE TABLE [dbo].[CGesFormuleBilancio] (
    [Progressivo]             DECIMAL (10)    NOT NULL,
    [Codice]                  VARCHAR (20)    DEFAULT ('') NULL,
    [Descrizione]             VARCHAR (80)    DEFAULT ('') NULL,
    [Note]                    VARCHAR (2000)  DEFAULT ('') NULL,
    [Formula]                 VARCHAR (500)   DEFAULT ('') NULL,
    [UtenteModifica]          VARCHAR (25)    NOT NULL,
    [DataModifica]            DATETIME        NOT NULL,
    [ValoreMinimo]            DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [ValoreMassimo]           DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [MoltiplicatoreEtichette] DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [ValoreOttimale]          DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [ConAltreFormule]         SMALLINT        DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CGesFormuleBilancio_Codice]
    ON [dbo].[CGesFormuleBilancio]([Codice] ASC) WITH (FILLFACTOR = 90);


GO

/*  UPDATE TRIGGER "TU_CGesFormuleBilancio" FOR TABLE "CGesFormuleBilancio"  */
CREATE TRIGGER TU_CGesFormuleBilancio ON CGesFormuleBilancio FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "CGesFormuleBilancio" FOR ALL CHILDREN IN "CGesValoriFormuleBilancio"  */
      IF UPDATE(Progressivo)
      BEGIN
         UPDATE CGesValoriFormuleBilancio
          SET   ProgressivoFormula = I1.Progressivo
         FROM   CGesValoriFormuleBilancio T2, INSERTED I1, DELETED D1
         WHERE  T2.ProgressivoFormula = D1.Progressivo
          AND  (I1.Progressivo != D1.Progressivo)
      END
      
      RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO

/*  DELETE TRIGGER "TD_CGesFormuleBilancio" FOR TABLE "CGesFormuleBilancio"  */
CREATE TRIGGER TD_CGesFormuleBilancio ON CGesFormuleBilancio FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGesValoriFormuleBilancio"  */
    DELETE CGesValoriFormuleBilancio
    FROM   CGesValoriFormuleBilancio T2, DELETED T1
    WHERE  T2.ProgressivoFormula = T1.Progressivo
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesFormuleBilancio] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesFormuleBilancio] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesFormuleBilancio] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesFormuleBilancio] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesFormuleBilancio] TO [Metodo98]
    AS [dbo];

