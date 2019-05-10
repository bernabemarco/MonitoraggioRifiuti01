CREATE TABLE [dbo].[CGesMovimentiMetodo] (
    [Progressivo]      DECIMAL (10)    NOT NULL,
    [Ambiente]         VARCHAR (3)     DEFAULT ('') NULL,
    [Anno]             DECIMAL (5)     DEFAULT (0) NULL,
    [Mese]             INT             DEFAULT (0) NULL,
    [CodContoRaccordo] VARCHAR (30)    DEFAULT ('') NULL,
    [CodDestinazione]  VARCHAR (10)    DEFAULT ('') NULL,
    [Valore]           DECIMAL (19, 6) DEFAULT (0) NULL,
    [NumTransazione1]  DECIMAL (10)    DEFAULT (0) NULL,
    [NumTransazione2]  DECIMAL (10)    DEFAULT (0) NULL,
    [NumTransazione3]  DECIMAL (10)    DEFAULT (0) NULL,
    [UtenteModifica]   VARCHAR (25)    NOT NULL,
    [DataModifica]     DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  UPDATE TRIGGER "TU_CGesMovimentiMetodo" FOR TABLE "CGesMovimentiMetodo"  */
CREATE TRIGGER TU_CGesMovimentiMetodo ON CGesMovimentiMetodo FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "CGesMovimentiMetodo" FOR ALL CHILDREN IN "CGesMovimentiMetodoDettaglio"  */
      IF UPDATE(Progressivo)
      BEGIN
         UPDATE CGesMovimentiMetodoDettaglio
          SET   RifProgressivo = I1.Progressivo
         FROM   CGesMovimentiMetodoDettaglio T2, INSERTED I1, DELETED D1
         WHERE  T2.RifProgressivo = D1.Progressivo
          AND  (I1.Progressivo != D1.Progressivo)
      END
      
      RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO

/*  DELETE TRIGGER "TD_CGesMovimentiMetodo" FOR TABLE "CGesMovimentiMetodo"  */
CREATE TRIGGER TD_CGesMovimentiMetodo ON CGesMovimentiMetodo FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGesMovimentiMetodoDettaglio"  */
    DELETE CGesMovimentiMetodoDettaglio
    FROM   CGesMovimentiMetodoDettaglio T2, DELETED T1
    WHERE  T2.RifProgressivo = T1.Progressivo
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesMovimentiMetodo] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesMovimentiMetodo] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesMovimentiMetodo] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesMovimentiMetodo] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesMovimentiMetodo] TO [Metodo98]
    AS [dbo];

