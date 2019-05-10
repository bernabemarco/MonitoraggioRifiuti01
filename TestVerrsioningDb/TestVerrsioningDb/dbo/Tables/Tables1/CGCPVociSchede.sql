CREATE TABLE [dbo].[CGCPVociSchede] (
    [Tipo]            VARCHAR (5)   NOT NULL,
    [Voce]            VARCHAR (10)  NOT NULL,
    [Descrizione]     VARCHAR (80)  DEFAULT ('') NULL,
    [OrdineStampa]    INT           DEFAULT (0) NULL,
    [RigaDescrittiva] SMALLINT      DEFAULT (0) NULL,
    [TipoLegame]      SMALLINT      DEFAULT (0) NULL,
    [Grassetto]       SMALLINT      DEFAULT (0) NULL,
    [Sottolinea]      SMALLINT      DEFAULT (0) NULL,
    [SegnoVoce]       SMALLINT      DEFAULT (1) NULL,
    [Colore]          SMALLINT      DEFAULT (0) NULL,
    [Tipologia]       SMALLINT      DEFAULT (0) NULL,
    [RigaDaStampare]  SMALLINT      DEFAULT (0) NULL,
    [RiferimentoPerc] SMALLINT      DEFAULT (0) NULL,
    [CodiceStampa]    VARCHAR (80)  DEFAULT ('') NULL,
    [Prezzo]          SMALLINT      DEFAULT (0) NULL,
    [UtileMargine]    SMALLINT      DEFAULT (0) NULL,
    [Attribuzione]    SMALLINT      DEFAULT (0) NULL,
    [Note]            VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica]  VARCHAR (25)  NOT NULL,
    [DataModifica]    DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Tipo] ASC, [Voce] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  DELETE TRIGGER "TD_CGCPVociSchede" FOR TABLE "CGCPVociSchede"  */
CREATE TRIGGER TD_CGCPVociSchede ON CGCPVociSchede FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGCPLegamiSchede"  */
    DELETE CGCPLegamiSchede
    FROM   CGCPLegamiSchede T2, DELETED T1
    WHERE  (T2.Tipo = T1.Tipo AND T2.Voce = T1.Voce) OR (T2.Tipo = T1.Tipo AND T2.VoceLegata = T1.Voce)
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO

/*  UPDATE TRIGGER "TU_CGCPVociSchede" FOR TABLE "CGCPVociSchede"  */
CREATE TRIGGER TU_CGCPVociSchede ON CGCPVociSchede FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "CGCPVociSchede" FOR ALL CHILDREN IN "CGCPLegamiSchede"  */
      IF UPDATE(Voce)
      BEGIN
         UPDATE CGCPLegamiSchede
          SET   CGCPLegamiSchede.Voce = I1.Voce
         FROM   CGCPLegamiSchede T2, INSERTED I1, DELETED D1
         WHERE  T2.Voce = D1.Voce AND T2.Tipo = D1.Tipo
          AND  (I1.Voce != D1.Voce AND I1.Tipo = D1.Tipo)
      END
      
      RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPVociSchede] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPVociSchede] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPVociSchede] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPVociSchede] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPVociSchede] TO [Metodo98]
    AS [dbo];

