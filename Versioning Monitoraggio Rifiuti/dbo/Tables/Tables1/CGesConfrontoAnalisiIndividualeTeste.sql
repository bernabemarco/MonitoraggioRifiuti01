CREATE TABLE [dbo].[CGesConfrontoAnalisiIndividualeTeste] (
    [Progressivo]           DECIMAL (10)    NOT NULL,
    [TipoReport]            SMALLINT        DEFAULT (0) NULL,
    [Nome]                  VARCHAR (50)    DEFAULT ('') NULL,
    [AmbienteRif]           VARCHAR (3)     DEFAULT ('') NULL,
    [AnnoInizioRif]         DECIMAL (5)     DEFAULT (0) NULL,
    [MeseInizioRif]         INT             DEFAULT (0) NULL,
    [AnnoFineRif]           DECIMAL (5)     DEFAULT (0) NULL,
    [MeseFineRif]           INT             DEFAULT (0) NULL,
    [AmbienteC1]            VARCHAR (3)     DEFAULT ('') NULL,
    [AnnoInizioC1]          DECIMAL (5)     DEFAULT (0) NULL,
    [MeseInizioC1]          INT             DEFAULT (0) NULL,
    [AnnoFineC1]            DECIMAL (5)     DEFAULT (0) NULL,
    [MeseFineC1]            INT             DEFAULT (0) NULL,
    [AmbienteC2]            VARCHAR (3)     DEFAULT ('') NULL,
    [AnnoInizioC2]          DECIMAL (5)     DEFAULT (0) NULL,
    [MeseInizioC2]          INT             DEFAULT (0) NULL,
    [AnnoFineC2]            DECIMAL (5)     DEFAULT (0) NULL,
    [MeseFineC2]            INT             DEFAULT (0) NULL,
    [AmbienteC3]            VARCHAR (3)     DEFAULT ('') NULL,
    [AnnoInizioC3]          DECIMAL (5)     DEFAULT (0) NULL,
    [MeseInizioC3]          INT             DEFAULT (0) NULL,
    [AnnoFineC3]            DECIMAL (5)     DEFAULT (0) NULL,
    [MeseFineC3]            INT             DEFAULT (0) NULL,
    [CodDestinazione]       VARCHAR (10)    DEFAULT ('') NULL,
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
    [IndiceVar101]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar102]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar103]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar104]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione201]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione202]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione203]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione204]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis201]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis202]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis203]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis204]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec01]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec02]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec03]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione1Sec04]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec01]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec02]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec03]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec04]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec01]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec02]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec03]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Produzione2Sec04]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec01]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec02]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec03]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec04]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceVar101]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceVar102]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceVar103]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceVar104]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceFis201]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceFis202]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceFis203]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceFis204]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceVar1Sec01]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceVar1Sec02]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceVar1Sec03]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceVar1Sec04]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceFis2Sec01]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceFis2Sec02]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceFis2Sec03]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceFis2Sec04]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceVar101]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceVar102]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceVar103]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceVar104]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceFis201]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceFis202]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceFis203]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceFis204]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceVar1Sec01]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceVar1Sec02]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceVar1Sec03]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceVar1Sec04]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceFis2Sec01]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceFis2Sec02]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceFis2Sec03]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceFis2Sec04]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [DesPiede1]             VARCHAR (80)    DEFAULT ('') NULL,
    [DesPiede2]             VARCHAR (80)    DEFAULT ('') NULL,
    [DesPiede3]             VARCHAR (80)    DEFAULT ('') NULL,
    [DesPiede4]             VARCHAR (80)    DEFAULT ('') NULL,
    [DesPiede5]             VARCHAR (80)    DEFAULT ('') NULL,
    [UtenteModifica]        VARCHAR (25)    NOT NULL,
    [DataModifica]          DATETIME        NOT NULL,
    [TipoRiclassificazione] VARCHAR (5)     DEFAULT ('') NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  UPDATE TRIGGER "TU_CGesConfrontoAnalisiIndividualeTeste" FOR TABLE "CGesConfrontoAnalisiIndividualeTeste"  */
CREATE TRIGGER TU_CGesConfrontoAnalisiIndividualeTeste ON CGesConfrontoAnalisiIndividualeTeste FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "CGesConfrontoAnalisiIndividualeTeste" FOR ALL CHILDREN IN "CGesConfrontoAnalisiIndividualeRighe"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE CGesConfrontoAnalisiIndividualeRighe
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   CGesConfrontoAnalisiIndividualeRighe T2, INSERTED I1, DELETED D1
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

/*  DELETE TRIGGER "TD_CGesConfrontoAnalisiIndividualeTeste" FOR TABLE "CGesConfrontoAnalisiIndividualeTeste"  */
CREATE TRIGGER TD_CGesConfrontoAnalisiIndividualeTeste ON CGesConfrontoAnalisiIndividualeTeste FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGesConfrontoAnalisiIndividualeRighe"  */
    DELETE CGesConfrontoAnalisiIndividualeRighe
    FROM   CGesConfrontoAnalisiIndividualeRighe T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesConfrontoAnalisiIndividualeTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesConfrontoAnalisiIndividualeTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesConfrontoAnalisiIndividualeTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesConfrontoAnalisiIndividualeTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesConfrontoAnalisiIndividualeTeste] TO [Metodo98]
    AS [dbo];

