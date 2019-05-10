CREATE TABLE [dbo].[RigheVBanco] (
    [Progressivo]         DECIMAL (10)    DEFAULT (0) NOT NULL,
    [NrRiga]              DECIMAL (5)     DEFAULT (0) NOT NULL,
    [Posizione]           DECIMAL (5)     NULL,
    [Articolo]            VARCHAR (50)    NOT NULL,
    [ControPartita]       VARCHAR (7)     NULL,
    [CodNumListino]       DECIMAL (5)     NOT NULL,
    [UM]                  VARCHAR (3)     NOT NULL,
    [Quantita]            DECIMAL (16, 6) DEFAULT (0) NULL,
    [PrezzoUnitLordo]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [PUniImponibile]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [PUniImposta]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [PUniLordoIvato]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [PUniNettoIvato]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [PrezzoUnitLordoEuro] DECIMAL (19, 6) DEFAULT (0) NULL,
    [PUniImponibileEuro]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [PUniImpostaEuro]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [PUniLordoIvatoEuro]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [PUniNettoIvatoEuro]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [ScontiEstesi]        VARCHAR (20)    NULL,
    [ScontoCalc]          DECIMAL (8, 5)  DEFAULT (0) NULL,
    [CodIVA]              DECIMAL (5)     NOT NULL,
    [totImponibile]       DECIMAL (19, 4) DEFAULT (0) NULL,
    [totImposta]          DECIMAL (19, 4) DEFAULT (0) NULL,
    [TotLordoIvato]       DECIMAL (19, 4) DEFAULT (0) NULL,
    [TotNettoIvato]       DECIMAL (19, 4) DEFAULT (0) NULL,
    [totImponibileEuro]   DECIMAL (19, 4) DEFAULT (0) NULL,
    [totImpostaEuro]      DECIMAL (19, 4) DEFAULT (0) NULL,
    [TotLordoIvatoEuro]   DECIMAL (19, 4) DEFAULT (0) NULL,
    [TotNettoIvatoEuro]   DECIMAL (19, 4) DEFAULT (0) NULL,
    [UTENTEMODIFICA]      VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]        DATETIME        NOT NULL,
    [FlagRiga]            SMALLINT        NULL,
    [DSCRIGA]             VARCHAR (255)   NULL,
    [RIFTESTEDOC]         DECIMAL (10)    CONSTRAINT [DF_RIFTESTEDOC] DEFAULT (0) NULL,
    [TipoRiga]            CHAR (1)        NULL,
    [CodOpeVend]          DECIMAL (18)    NULL,
    [Promozione]          VARCHAR (50)    NULL,
    [Turno]               DECIMAL (18)    NULL,
    [Cassiere]            VARCHAR (25)    NULL,
    [IDRiga]              DECIMAL (10)    DEFAULT (0) NULL,
    CONSTRAINT [RigheVBanco_PK] PRIMARY KEY CLUSTERED ([Progressivo] ASC, [NrRiga] ASC) WITH (FILLFACTOR = 90)
);


GO




/*  INSERT TRIGGER "TI_RIGHEVBANCO" FOR TABLE "RIGHEVBANCO"  */
CREATE TRIGGER TI_RIGHEVBANCO ON RIGHEVBANCO FOR INSERT AS
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

    
    /*  PARENT "TESTEVBANCO" MUST EXIST WHEN INSERTING A CHILD IN "RIGHEVBANCO"  */
    IF UPDATE(PROGRESSIVO)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   TESTEVBANCO T1, INSERTED T2
           WHERE  T1.PROGRESSIVO = T2.PROGRESSIVO) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'PARENT DOES NOT EXIST IN "TESTEVBANCO". CANNOT CREATE CHILD IN "RIGHEVBANCO".'
             GOTO ERROR
          END
    END

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO

/*  UPDATE TRIGGER "TU_RIGHEVBANCO" FOR TABLE "RIGHEVBANCO"  */
CREATE TRIGGER TU_RIGHEVBANCO ON RIGHEVBANCO FOR UPDATE AS
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

      
      /*  PARENT "TESTEVBANCO" MUST EXIST WHEN UPDATING A CHILD IN "RIGHEVBANCO"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   TESTEVBANCO T1, INSERTED T2
             WHERE  T1.PROGRESSIVO = T2.PROGRESSIVO) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"TESTEVBANCO" DOES NOT EXIST. CANNOT MODIFY CHILD IN "RIGHEVBANCO".'
               GOTO ERROR
            END
      END

      RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[RigheVBanco] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[RigheVBanco] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[RigheVBanco] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[RigheVBanco] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[RigheVBanco] TO [Metodo98]
    AS [dbo];

