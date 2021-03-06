﻿CREATE TABLE [dbo].[GEM_SEZIONICONTRATTO] (
    [IDCONTRATTO]             VARCHAR (13)    NOT NULL,
    [SEZIONECONTRATTO]        DECIMAL (5)     NOT NULL,
    [OLD_RifSezioneGemma]     VARCHAR (13)    NOT NULL,
    [CODDEST]                 DECIMAL (5)     CONSTRAINT [DF__GEM_SEZIO__CODDE__2322583E] DEFAULT ((0)) NOT NULL,
    [DESCRIZIONESEZIONE]      VARCHAR (80)    NULL,
    [idTipoFatt]              DECIMAL (5)     NOT NULL,
    [idTipologMezzo]          DECIMAL (5)     NOT NULL,
    [IdStrutturaOpPr]         DECIMAL (5)     NOT NULL,
    [Revisione]               DECIMAL (5)     CONSTRAINT [DF__GEM_SEZIO__Revis__24167C77] DEFAULT ((0)) NOT NULL,
    [CodiceMezzo]             VARCHAR (50)    NOT NULL,
    [CodTecnicoRisorsa]       VARCHAR (7)     NULL,
    [PAGAMENTO]               VARCHAR (4)     NULL,
    [DATAPVISITA]             DATETIME        NULL,
    [FLG_OperDeroga]          VARCHAR (4)     CONSTRAINT [DF__GEM_SEZIO__FLG_O__250AA0B0] DEFAULT ('N') NULL,
    [NrOperazInDeroga]        DECIMAL (5)     CONSTRAINT [DF__GEM_SEZIO__NrOpe__25FEC4E9] DEFAULT ((0)) NOT NULL,
    [CadenzeInDeroga]         DECIMAL (5)     CONSTRAINT [DF__GEM_SEZIO__Caden__26F2E922] DEFAULT ((0)) NOT NULL,
    [NOTE]                    NTEXT           NULL,
    [NOTE_TECNICO]            NTEXT           NULL,
    [REFERENTE]               VARCHAR (50)    NULL,
    [TEL_REF]                 VARCHAR (50)    NULL,
    [DATAMODIFICA]            DATETIME        NOT NULL,
    [UTENTEMODIFICA]          NVARCHAR (25)   NOT NULL,
    [FLAG_ELIMINATO]          VARCHAR (1)     NULL,
    [DATAEliminato]           DATETIME        NULL,
    [RESP_MANU]               VARCHAR (50)    NULL,
    [RESP_CONTR]              VARCHAR (50)    NULL,
    [TIPO_PIATTAFORMA]        VARCHAR (3)     NULL,
    [REPARTO]                 VARCHAR (50)    NULL,
    [ORE_INT]                 DECIMAL (10, 2) NULL,
    [GIORNI_PIATT]            DECIMAL (6, 2)  NULL,
    [flg_mat_dafatt]          CHAR (1)        CONSTRAINT [DF__GEM_SEZIO__flg_m__27E70D5B] DEFAULT ('S') NULL,
    [FLG_RIC_SCA_AUTO]        CHAR (1)        CONSTRAINT [DF__GEM_SEZIO__FLG_R__28DB3194] DEFAULT ('N') NULL,
    [RIFCLIENTE]              VARCHAR (50)    NULL,
    [EMAIL_RESPONSABILE]      VARCHAR (100)   NULL,
    [FLGUSAPRZGEMMA]          CHAR (1)        CONSTRAINT [DF__GEM_SEZIO__FLGUS__29CF55CD] DEFAULT ('S') NULL,
    [idGListinoContr]         DECIMAL (10)    CONSTRAINT [DF__GEM_SEZIO__idGLi__2AC37A06] DEFAULT ((0)) NULL,
    [FLAG_PROV]               CHAR (1)        NULL,
    [CodSezioniAggregate]     DECIMAL (5)     NULL,
    [SezioneAggrPrimaria]     SMALLINT        CONSTRAINT [DF__GEM_SEZIO__Sezio__2BB79E3F] DEFAULT ((0)) NULL,
    [ImportoContrattoSezione] NUMERIC (10, 2) CONSTRAINT [DF__GEM_SEZIO__Impor__2CABC278] DEFAULT ((0)) NULL,
    [Provvigione1]            NUMERIC (10, 2) CONSTRAINT [DF__GEM_SEZIO__Provv__2D9FE6B1] DEFAULT ((0)) NULL,
    [ImportoVisita]           NUMERIC (10, 2) CONSTRAINT [DF__GEM_SEZIO__Impor__2E940AEA] DEFAULT ((0)) NULL,
    [NrVisiteTot]             NUMERIC (10, 2) CONSTRAINT [DF__GEM_SEZIO__NrVis__2F882F23] DEFAULT ((0)) NULL,
    [SEZIONECONTRATTO_Prec]   DECIMAL (5)     CONSTRAINT [DF_GEM_SEZIONICONTRATTO_SEZIONECONTRATTO_Prec] DEFAULT ((0)) NULL,
    [IdDivisione]             SMALLINT        CONSTRAINT [DF__GEM_SEZIO__IdDiv__517E1FCB] DEFAULT ((0)) NULL,
    [Periodicita]             VARCHAR (30)    NULL,
    [FlgOblLetturaNote]       SMALLINT        DEFAULT ((0)) NOT NULL,
    [FlgOblPiattaforma]       SMALLINT        DEFAULT ((0)) NULL,
    [FlgPrevistoAllegato]     SMALLINT        DEFAULT ((0)) NULL,
    [CodIva]                  DECIMAL (5)     DEFAULT ((0)) NULL,
    [CodAgente2]              VARCHAR (7)     NULL,
    [PROVVAg2]                DECIMAL (10, 2) NULL,
    [RifLinkImmagine]         VARCHAR (300)   NULL,
    [CodiceEdificio]          VARCHAR (30)    NULL,
    [CodiceLivello]           VARCHAR (50)    NULL,
    [CodiceVano]              VARCHAR (50)    NULL,
    [PosizioneMappa]          VARCHAR (50)    NULL,
    [CodiceBarre]             VARCHAR (50)    NULL,
    [TipologiaBarre]          SMALLINT        NULL,
    [Flag_SezAggr]            SMALLINT        DEFAULT ((0)) NOT NULL,
    [FLG_ProvvExtraContratto] CHAR (1)        DEFAULT ('N') NULL,
    [Provv1Materiali]         NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [Provv1OreAdd]            NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [FLG_AttRipristCompr]     CHAR (1)        DEFAULT ('S') NULL,
    [ValoreSogliaRiprist]     NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [NrTecniciPrev]           NUMERIC (5)     DEFAULT ((0)) NULL,
    [FLG_AmbientiConf]        SMALLINT        DEFAULT ((0)) NULL,
    [FLG_LavoriInQuota]       SMALLINT        DEFAULT ((0)) NULL,
    CONSTRAINT [GEM_SEZIONICONTRATTO_PK] PRIMARY KEY CLUSTERED ([IDCONTRATTO] ASC, [SEZIONECONTRATTO] ASC)
);


GO
CREATE NONCLUSTERED INDEX [GEM_SEZIONICONTRATTO_idTipologMezzo]
    ON [dbo].[GEM_SEZIONICONTRATTO]([idTipologMezzo] ASC);


GO
CREATE NONCLUSTERED INDEX [GEM_SEZIONICONTRATTO_idGListinoContr]
    ON [dbo].[GEM_SEZIONICONTRATTO]([idGListinoContr] ASC);


GO
CREATE NONCLUSTERED INDEX [GEM_SEZIONICONTRATTO_Sede]
    ON [dbo].[GEM_SEZIONICONTRATTO]([CODDEST] ASC);


GO
CREATE NONCLUSTERED INDEX [GEM_SEZIONICONTRATTO_CodiceMezzo]
    ON [dbo].[GEM_SEZIONICONTRATTO]([CodiceMezzo] ASC);


GO
CREATE NONCLUSTERED INDEX [GEM_SEZIONICONTRATTO_Divisione]
    ON [dbo].[GEM_SEZIONICONTRATTO]([IdDivisione] ASC);


GO

/*  UPDATE TRIGGER [ALD_TU_TestaSezioniContrattoCPagamento] FOR TABLE "GEM_SEZIONICONTRATTO"  */
CREATE TRIGGER [ALD_TU_TestaSezioniContrattoCPagamento] ON [dbo].GEM_SEZIONICONTRATTO FOR UPDATE AS
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

      
      /*  Accoda record per variazioni su codice pagamento */
      IF UPDATE(PAGAMENTO)
      BEGIN
		insert into ALD_TestaSezioniContrattoCPagamento (IDCONTRATTO, SEZIONECONTRATTO, DescrAzione, UTENTEMODIFICA, DATAMODIFICA, CODPAGAMENTO)
		select IDCONTRATTO, SEZIONECONTRATTO, 'Variazione pagamento Sezione contratto',  user, GETDATE(), PAGAMENTO
		FROM   INSERTED T1 
      END
      


      RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

/****** Object:  Trigger [dbo].[ALD_TU_TestaSezioniContrattoCPagamento]    Script Date: 30/05/2013 16:08:23 ******/
SET ANSI_NULLS ON

/****** Oggetto:  Trigger [ALD_TestaRapportiContrattoCPagamento]    Data script: 05/30/2013 17:26:53 ******/
SET ANSI_NULLS ON

GO

/*  DELETE TRIGGER "ALD_TD_TestCancSezioniContratto" FOR TABLE "GEM_SEZIONECONTRATTO"  */
CREATE TRIGGER [ALD_TD_TestCancSezioniContratto] ON [dbo].[GEM_SEZIONICONTRATTO] FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)
 
    SELECT  @NUMROWS = @@ROWCOUNT

    IF @NUMROWS = 0
       RETURN 

    /*  Accoda record testa cancellata su tbl temporanea ALD_TestCancSezioniContratto*/
    insert into ALD_TestCancSezioniContratto (IDCONTRATTO, SEZIONECONTRATTO, DescrAzione, CODDEST, idGListinoContr, UTENTEMODIFICA, DATAMODIFICA)
   select IDCONTRATTO, SEZIONECONTRATTO, 'cancellazione Anagrafica Sezione', CODDEST, idGListinoContr, user, GETDATE()
    FROM   DELETED T1  

    RETURN
 
/*  ERRORS HANDLING  */

ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_SEZIONICONTRATTO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_SEZIONICONTRATTO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_SEZIONICONTRATTO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_SEZIONICONTRATTO] TO [Metodo98]
    AS [dbo];

