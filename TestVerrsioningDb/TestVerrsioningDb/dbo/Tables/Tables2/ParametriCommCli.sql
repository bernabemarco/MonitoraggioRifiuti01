CREATE TABLE [dbo].[ParametriCommCli] (
    [Codice]               VARCHAR (3)   NOT NULL,
    [Descrizione]          VARCHAR (25)  NULL,
    [CodiceTappo]          SMALLINT      DEFAULT (0) NULL,
    [GeneraMag]            SMALLINT      DEFAULT (0) NULL,
    [Preventivato]         SMALLINT      DEFAULT (0) NULL,
    [AblDettF1]            SMALLINT      DEFAULT ((-1)) NULL,
    [AblDettF2]            SMALLINT      DEFAULT ((-1)) NULL,
    [AblDettF3]            SMALLINT      DEFAULT ((-1)) NULL,
    [AblDettF4]            SMALLINT      DEFAULT ((-1)) NULL,
    [AblDettF5]            SMALLINT      DEFAULT ((-1)) NULL,
    [AblDettF6]            SMALLINT      DEFAULT ((-1)) NULL,
    [AblDettF7]            SMALLINT      DEFAULT ((-1)) NULL,
    [AblDettF8]            SMALLINT      DEFAULT ((-1)) NULL,
    [AblDettF9]            SMALLINT      DEFAULT ((-1)) NULL,
    [AblDettF10]           SMALLINT      DEFAULT ((-1)) NULL,
    [AblDettF11]           SMALLINT      DEFAULT ((-1)) NULL,
    [AblVarContr]          SMALLINT      DEFAULT ((-1)) NULL,
    [AblPenali]            SMALLINT      DEFAULT ((-1)) NULL,
    [AblCondVar]           SMALLINT      DEFAULT ((-1)) NULL,
    [UTENTEMODIFICA]       VARCHAR (25)  NULL,
    [DATAMODIFICA]         DATETIME      NULL,
    [AblLingDettForn]      SMALLINT      DEFAULT ((-1)) NULL,
    [AblLingSpediz]        SMALLINT      DEFAULT ((-1)) NULL,
    [AblLingVarContr]      SMALLINT      DEFAULT ((-1)) NULL,
    [AblLingPenali]        SMALLINT      DEFAULT ((-1)) NULL,
    [AblLingDestinaz]      SMALLINT      DEFAULT ((-1)) NULL,
    [AblLingExtra]         SMALLINT      DEFAULT ((-1)) NULL,
    [AblLingTotali]        SMALLINT      DEFAULT ((-1)) NULL,
    [AblLingRif]           SMALLINT      DEFAULT ((-1)) NULL,
    [AblLingCons]          SMALLINT      DEFAULT ((-1)) NULL,
    [AblLingTrasp]         SMALLINT      DEFAULT ((-1)) NULL,
    [AblLingMag]           SMALLINT      DEFAULT ((-1)) NULL,
    [AblLingCommColl]      SMALLINT      DEFAULT ((-1)) NULL,
    [AblLingTotVar]        SMALLINT      DEFAULT ((-1)) NULL,
    [AblLingCondVar]       SMALLINT      DEFAULT ((-1)) NULL,
    [AblLingPianoFatt]     SMALLINT      DEFAULT ((-1)) NULL,
    [AblLingAgenti]        SMALLINT      DEFAULT ((-1)) NULL,
    [AblLingTotForn]       SMALLINT      DEFAULT ((-1)) NULL,
    [TipoMat1]             VARCHAR (35)  DEFAULT ('') NULL,
    [TipoMat2]             VARCHAR (35)  DEFAULT ('') NULL,
    [TipoMat3]             VARCHAR (35)  DEFAULT ('') NULL,
    [TipoMat4]             VARCHAR (35)  DEFAULT ('') NULL,
    [TipoMat5]             VARCHAR (35)  DEFAULT ('') NULL,
    [TipoMat6]             VARCHAR (35)  DEFAULT ('') NULL,
    [TipoLavEst1]          VARCHAR (35)  DEFAULT ('') NULL,
    [TipoLavEst2]          VARCHAR (35)  DEFAULT ('') NULL,
    [TipoLavEst3]          VARCHAR (35)  DEFAULT ('') NULL,
    [TipoLavEst4]          VARCHAR (35)  DEFAULT ('') NULL,
    [TipoLavEst5]          VARCHAR (35)  DEFAULT ('') NULL,
    [TipoLavEst6]          VARCHAR (35)  DEFAULT ('') NULL,
    [TipoCostiDir1]        VARCHAR (35)  DEFAULT ('') NULL,
    [TipoCostiDir2]        VARCHAR (35)  DEFAULT ('') NULL,
    [flgDomEsterne]        SMALLINT      DEFAULT (0) NOT NULL,
    [flgPRMagazzino]       SMALLINT      CONSTRAINT [DF_PARAMETRICOMMCLI_FLGPRMAGAZZINO] DEFAULT (0) NOT NULL,
    [flgEntrateFor]        SMALLINT      CONSTRAINT [DF_PARAMETRICOMMCLI_FLGENTRATEFOR] DEFAULT (0) NOT NULL,
    [CCodStdCorrDE]        VARCHAR (10)  DEFAULT ('') NULL,
    [CodListinoDE]         NUMERIC (5)   DEFAULT (0) NULL,
    [CCodStdCorrMAG]       VARCHAR (10)  DEFAULT ('') NULL,
    [CodListinoMAG]        NUMERIC (5)   DEFAULT (0) NULL,
    [CCodStdCorrEF]        VARCHAR (10)  DEFAULT ('') NULL,
    [CodListinoEF]         NUMERIC (5)   DEFAULT (0) NULL,
    [TipoMat7]             VARCHAR (35)  DEFAULT ('') NULL,
    [TipoLavInt1]          VARCHAR (35)  NULL,
    [TipoLavInt2]          VARCHAR (35)  NULL,
    [FLG_LAVINT_CONSCICLI] SMALLINT      NULL,
    [FLG_LAVINT_CONSDOC]   SMALLINT      NULL,
    [TipoMat8]             VARCHAR (35)  NULL,
    [TipoMat9]             VARCHAR (35)  NULL,
    [CausaleMag1]          VARCHAR (35)  NULL,
    [CausaleMag2]          VARCHAR (35)  NULL,
    [CausaleMag3]          VARCHAR (35)  NULL,
    [CausaleMag4]          VARCHAR (35)  NULL,
    [CausaleMag5]          VARCHAR (35)  NULL,
    [CausaleMag6]          VARCHAR (35)  NULL,
    [CausaleMag7]          VARCHAR (35)  NULL,
    [CausaleMag8]          VARCHAR (35)  NULL,
    [CausaleMag9]          VARCHAR (35)  NULL,
    [Magazzini]            VARCHAR (255) NULL,
    [FLGPRMAGAZZINOCALC]   SMALLINT      CONSTRAINT [DF_PARAMETRICOMMCLI_FLGPRMAGAZZINOCALC] DEFAULT (1) NULL,
    CONSTRAINT [ParametriCommCli_PK] PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  UPDATE TRIGGER "TU_PARAMETRICOMMCLI" FOR TABLE "PARAMETRICOMMCLI"  */
CREATE TRIGGER TU_PARAMETRICOMMCLI ON PARAMETRICOMMCLI FOR UPDATE AS
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

      
      /*  CANNOT MODIFY PARENT CODE IN "PARAMETRICOMMCLI" IF CHILDREN STILL EXIST IN "ANAGRAFICACOMMESSE"  */
      IF UPDATE(CODICE)
      BEGIN
         IF EXISTS (SELECT 1
                    FROM   ANAGRAFICACOMMESSE T2, INSERTED I1, DELETED D1
                    WHERE  T2.TIPOCOM = D1.CODICE
                     AND  (I1.CODICE != D1.CODICE))
            BEGIN
               SELECT @ERRNO  = 30005,
                      @ERRMSG = 'Children still exist in "ANAGRAFICACOMMESSE". Cannot modify parent code in "PARAMETRICOMMCLI".'
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

/*  DELETE TRIGGER "TD_PARAMETRICOMMCLI" FOR TABLE "PARAMETRICOMMCLI"  */
CREATE TRIGGER TD_PARAMETRICOMMCLI ON PARAMETRICOMMCLI FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  CANNOT DELETE PARENT "PARAMETRICOMMCLI" IF CHILDREN STILL EXIST IN "ANAGRAFICACOMMESSE"  */
    IF EXISTS (SELECT 1
               FROM   ANAGRAFICACOMMESSE T2, DELETED T1
               WHERE  T2.TIPOCOM = T1.CODICE)
       BEGIN
          SELECT @ERRNO  = 30006,
                 @ERRMSG = 'Children still exist in "ANAGRAFICACOMMESSE". Cannot delete parent "PARAMETRICOMMCLI".'
          GOTO ERROR
       END

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[ParametriCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ParametriCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ParametriCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ParametriCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ParametriCommCli] TO [Metodo98]
    AS [dbo];

