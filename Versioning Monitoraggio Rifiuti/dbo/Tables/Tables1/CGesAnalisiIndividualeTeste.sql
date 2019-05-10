CREATE TABLE [dbo].[CGesAnalisiIndividualeTeste] (
    [Progressivo]           DECIMAL (10)    NOT NULL,
    [TipoReport]            SMALLINT        DEFAULT (0) NULL,
    [Nome]                  VARCHAR (50)    DEFAULT ('') NULL,
    [Ambiente]              VARCHAR (3)     DEFAULT ('') NULL,
    [AnnoInizio]            DECIMAL (5)     DEFAULT (0) NULL,
    [MeseInizio]            INT             DEFAULT (0) NULL,
    [AnnoFine]              DECIMAL (5)     DEFAULT (0) NULL,
    [MeseFine]              INT             DEFAULT (0) NULL,
    [CodDestinazione]       VARCHAR (10)    DEFAULT ('') NULL,
    [Produzione1]           DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1]            DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis1]            DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceTot1]            DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2]           DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar2]            DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2]            DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceTot2]            DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis1Sec]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceTot1Sec]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar2Sec]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceTot2Sec]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [DesDestinazione]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesTipo]               VARCHAR (80)    DEFAULT ('') NULL,
    [DesDivisione]          VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM1]                VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM2]                VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM1Sec]             VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM2Sec]             VARCHAR (80)    DEFAULT ('') NULL,
    [DesResponsabile]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesIntestazione]       VARCHAR (80)    DEFAULT ('') NULL,
    [TipoDestinazione]      SMALLINT        DEFAULT (0) NULL,
    [TipoMisurazione]       SMALLINT        DEFAULT (0) NULL,
    [Produzione101]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione102]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione103]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione104]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione105]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione106]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione107]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione108]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione109]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione110]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione111]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione112]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar101]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar102]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar103]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar104]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar105]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar106]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar107]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar108]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar109]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar110]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar111]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar112]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione201]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione202]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione203]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione204]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione205]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione206]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione207]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione208]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione209]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione210]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione211]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione212]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis201]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis202]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis203]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis204]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis205]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis206]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis207]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis208]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis209]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis210]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis211]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis212]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec01]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec02]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec03]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec04]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec05]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec06]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec07]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec08]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec09]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec10]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec11]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec12]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec01]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec02]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec03]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec04]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec05]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec06]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec07]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec08]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec09]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec10]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec11]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec12]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec01]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec02]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec03]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec04]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec05]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec06]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec07]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec08]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec09]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec10]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec11]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec12]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec01]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec02]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec03]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec04]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec05]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec06]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec07]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec08]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec09]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec10]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec11]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec12]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [DesPiede1]             VARCHAR (80)    DEFAULT ('') NULL,
    [DesPiede2]             VARCHAR (80)    DEFAULT ('') NULL,
    [DesPiede3]             VARCHAR (80)    DEFAULT ('') NULL,
    [DesPiede4]             VARCHAR (80)    DEFAULT ('') NULL,
    [DesPiede5]             VARCHAR (80)    DEFAULT ('') NULL,
    [Mese01]                VARCHAR (12)    DEFAULT ('') NULL,
    [Mese02]                VARCHAR (12)    DEFAULT ('') NULL,
    [Mese03]                VARCHAR (12)    DEFAULT ('') NULL,
    [Mese04]                VARCHAR (12)    DEFAULT ('') NULL,
    [Mese05]                VARCHAR (12)    DEFAULT ('') NULL,
    [Mese06]                VARCHAR (12)    DEFAULT ('') NULL,
    [Mese07]                VARCHAR (12)    DEFAULT ('') NULL,
    [Mese08]                VARCHAR (12)    DEFAULT ('') NULL,
    [Mese09]                VARCHAR (12)    DEFAULT ('') NULL,
    [Mese10]                VARCHAR (12)    DEFAULT ('') NULL,
    [Mese11]                VARCHAR (12)    DEFAULT ('') NULL,
    [Mese12]                VARCHAR (12)    DEFAULT ('') NULL,
    [DesTotale]             VARCHAR (12)    DEFAULT ('') NULL,
    [UtenteModifica]        VARCHAR (25)    NOT NULL,
    [DataModifica]          DATETIME        NOT NULL,
    [TipoRiclassificazione] VARCHAR (5)     DEFAULT ('') NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  UPDATE TRIGGER "TU_CGesAnalisiIndividualeTeste" FOR TABLE "CGesAnalisiIndividualeTeste"  */
CREATE TRIGGER TU_CGesAnalisiIndividualeTeste ON CGesAnalisiIndividualeTeste FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "CGesAnalisiIndividualeTeste" FOR ALL CHILDREN IN "CGesAnalisiIndividualeRighe"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE CGesAnalisiIndividualeRighe
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   CGesAnalisiIndividualeRighe T2, INSERTED I1, DELETED D1
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

/*  DELETE TRIGGER "TD_CGesAnalisiIndividualeTeste" FOR TABLE "CGesAnalisiIndividualeTeste"  */
CREATE TRIGGER TD_CGesAnalisiIndividualeTeste ON CGesAnalisiIndividualeTeste FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGesAnalisiIndividualeRighe"  */
    DELETE CGesAnalisiIndividualeRighe
    FROM   CGesAnalisiIndividualeRighe T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesAnalisiIndividualeTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesAnalisiIndividualeTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesAnalisiIndividualeTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesAnalisiIndividualeTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesAnalisiIndividualeTeste] TO [Metodo98]
    AS [dbo];

