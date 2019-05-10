CREATE TABLE [dbo].[CGesReportFogliRiepilogoTeste] (
    [Progressivo]       DECIMAL (10)    NOT NULL,
    [TipoReport]        SMALLINT        DEFAULT (0) NULL,
    [Nome]              VARCHAR (50)    DEFAULT ('') NULL,
    [Ambiente]          VARCHAR (3)     DEFAULT ('') NULL,
    [AnnoInizio]        DECIMAL (5)     DEFAULT (0) NULL,
    [MeseInizio]        INT             DEFAULT (0) NULL,
    [AnnoFine]          DECIMAL (5)     DEFAULT (0) NULL,
    [MeseFine]          INT             DEFAULT (0) NULL,
    [Codice]            VARCHAR (5)     DEFAULT ('') NULL,
    [NumFoglio]         INT             DEFAULT (0) NULL,
    [UltimoFoglio]      SMALLINT        DEFAULT (0) NULL,
    [CodDestinazione01] VARCHAR (10)    DEFAULT ('') NULL,
    [CodDestinazione02] VARCHAR (10)    DEFAULT ('') NULL,
    [CodDestinazione03] VARCHAR (10)    DEFAULT ('') NULL,
    [CodDestinazione04] VARCHAR (10)    DEFAULT ('') NULL,
    [CodDestinazione05] VARCHAR (10)    DEFAULT ('') NULL,
    [CodDestinazione06] VARCHAR (10)    DEFAULT ('') NULL,
    [CodDestinazione07] VARCHAR (10)    DEFAULT ('') NULL,
    [CodDestinazione08] VARCHAR (10)    DEFAULT ('') NULL,
    [CodDestinazione09] VARCHAR (10)    DEFAULT ('') NULL,
    [CodDestinazione10] VARCHAR (10)    DEFAULT ('') NULL,
    [CodDestinazione11] VARCHAR (10)    DEFAULT ('') NULL,
    [CodDestinazione12] VARCHAR (10)    DEFAULT ('') NULL,
    [Produzione101]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione102]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione103]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione104]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione105]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione106]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione107]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione108]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione109]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione110]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione111]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione112]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar101]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar102]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar103]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar104]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar105]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar106]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar107]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar108]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar109]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar110]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar111]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar112]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione201]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione202]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione203]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione204]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione205]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione206]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione207]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione208]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione209]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione210]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione211]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione212]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis201]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis202]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis203]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis204]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis205]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis206]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis207]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis208]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis209]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis210]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis211]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis212]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [DesUM101]          VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM102]          VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM103]          VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM104]          VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM105]          VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM106]          VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM107]          VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM108]          VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM109]          VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM110]          VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM111]          VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM112]          VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM1]            VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM201]          VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM202]          VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM203]          VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM204]          VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM205]          VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM206]          VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM207]          VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM208]          VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM209]          VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM210]          VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM211]          VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM212]          VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM2]            VARCHAR (80)    DEFAULT ('') NULL,
    [Produzione1Sec01]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec02]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec03]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec04]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec05]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec06]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec07]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec08]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec09]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec10]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec11]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec12]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec01]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec02]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec03]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec04]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec05]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec06]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec07]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec08]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec09]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec10]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec11]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec12]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec01]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec02]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec03]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec04]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec05]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec06]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec07]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec08]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec09]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec10]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec11]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec12]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec01]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec02]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec03]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec04]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec05]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec06]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec07]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec08]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec09]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec10]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec11]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec12]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [DesUM1Sec01]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM1Sec02]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM1Sec03]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM1Sec04]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM1Sec05]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM1Sec06]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM1Sec07]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM1Sec08]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM1Sec09]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM1Sec10]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM1Sec11]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM1Sec12]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM1Sec]         VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM2Sec01]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM2Sec02]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM2Sec03]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM2Sec04]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM2Sec05]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM2Sec06]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM2Sec07]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM2Sec08]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM2Sec09]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM2Sec10]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM2Sec11]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM2Sec12]       VARCHAR (80)    DEFAULT ('') NULL,
    [DesUM2Sec]         VARCHAR (80)    DEFAULT ('') NULL,
    [DesIntestazione]   VARCHAR (80)    DEFAULT ('') NULL,
    [UtenteModifica]    VARCHAR (25)    NOT NULL,
    [DataModifica]      DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  UPDATE TRIGGER "TU_CGesReportFogliRiepilogoTeste" FOR TABLE "CGesReportFogliRiepilogoTeste"  */
CREATE TRIGGER TU_CGesReportFogliRiepilogoTeste ON CGesReportFogliRiepilogoTeste FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "CGesReportFogliRiepilogoTeste" FOR ALL CHILDREN IN "CGesReportFogliRiepilogoRighe"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE CGesReportFogliRiepilogoRighe
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   CGesReportFogliRiepilogoRighe T2, INSERTED I1, DELETED D1
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

/*  DELETE TRIGGER "TD_CGesReportFogliRiepilogoTeste" FOR TABLE "CGesReportFogliRiepilogoTeste"  */
CREATE TRIGGER TD_CGesReportFogliRiepilogoTeste ON CGesReportFogliRiepilogoTeste FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGesReportFogliRiepilogoRighe"  */
    DELETE CGesReportFogliRiepilogoRighe
    FROM   CGesReportFogliRiepilogoRighe T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesReportFogliRiepilogoTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesReportFogliRiepilogoTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesReportFogliRiepilogoTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesReportFogliRiepilogoTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesReportFogliRiepilogoTeste] TO [Metodo98]
    AS [dbo];

