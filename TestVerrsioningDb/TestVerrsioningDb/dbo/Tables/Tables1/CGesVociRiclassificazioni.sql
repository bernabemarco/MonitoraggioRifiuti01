CREATE TABLE [dbo].[CGesVociRiclassificazioni] (
    [Tipo]               VARCHAR (5)   NOT NULL,
    [Voce]               VARCHAR (10)  NOT NULL,
    [Descrizione]        VARCHAR (80)  DEFAULT ('') NULL,
    [OrdineStampa]       INT           DEFAULT (0) NULL,
    [TabulazioneStampa]  SMALLINT      DEFAULT (1) NULL,
    [RiferimentoPerc]    SMALLINT      DEFAULT (0) NULL,
    [Indice]             SMALLINT      DEFAULT (0) NULL,
    [SegnoVoce]          SMALLINT      DEFAULT (1) NULL,
    [Grassetto]          SMALLINT      DEFAULT (0) NULL,
    [Dettaglio]          SMALLINT      DEFAULT (0) NULL,
    [RigaDescrittiva]    SMALLINT      DEFAULT (0) NULL,
    [TipoLegame]         SMALLINT      DEFAULT (0) NULL,
    [SaldoCDCReversioni] SMALLINT      DEFAULT (0) NULL,
    [DescrizioneIndice]  VARCHAR (80)  DEFAULT ('') NULL,
    [ValorePerIndice]    SMALLINT      DEFAULT (0) NULL,
    [Colore]             SMALLINT      DEFAULT (0) NULL,
    [ColoreSeNegativo]   SMALLINT      DEFAULT (0) NULL,
    [Note]               VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica]     VARCHAR (25)  NOT NULL,
    [DataModifica]       DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Tipo] ASC, [Voce] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  DELETE TRIGGER "TD_CGesVociRiclassificazioni" FOR TABLE "CGesVociRiclassificazioni"  */
CREATE TRIGGER TD_CGesVociRiclassificazioni ON CGesVociRiclassificazioni FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGesLegamiRiclassificazioni"  */
    DELETE CGesLegamiRiclassificazioni
    FROM   CGesLegamiRiclassificazioni T2, DELETED T1
    WHERE  (T2.Tipo = T1.Tipo AND T2.Voce = T1.Voce) OR (T2.Tipo = T1.Tipo AND T2.VoceLegata = T1.Voce)
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO

/*  UPDATE TRIGGER "TU_CGesVociRiclassificazioni" FOR TABLE "CGesVociRiclassificazioni"  */
CREATE TRIGGER TU_CGesVociRiclassificazioni ON CGesVociRiclassificazioni FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "CGesVociRiclassificazioni" FOR ALL CHILDREN IN "CGesLegamiRiclassificazioni"  */
      IF UPDATE(Voce)
      BEGIN
         UPDATE CGesLegamiRiclassificazioni
          SET   CGesLegamiRiclassificazioni.Voce = I1.Voce
         FROM   CGesLegamiRiclassificazioni T2, INSERTED I1, DELETED D1
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
    ON OBJECT::[dbo].[CGesVociRiclassificazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesVociRiclassificazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesVociRiclassificazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesVociRiclassificazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesVociRiclassificazioni] TO [Metodo98]
    AS [dbo];

