CREATE TABLE [dbo].[GEM_TESTACONTRATTO] (
    [IDCONTRATTO]                    VARCHAR (13)    NOT NULL,
    [CODCLIENTE]                     VARCHAR (7)     NOT NULL,
    [CODCLIFAT]                      VARCHAR (7)     NULL,
    [DATACONTRATTO]                  DATETIME        NULL,
    [DATAEFFICACIA]                  DATETIME        NULL,
    [DATAPVISITA]                    DATETIME        NULL,
    [DURATA]                         NUMERIC (10, 2) NULL,
    [CodAgente1]                     VARCHAR (7)     NULL,
    [CodAgente3]                     VARCHAR (7)     NULL,
    [CodAgente2]                     VARCHAR (7)     NULL,
    [FLAG_PROV]                      CHAR (1)        NULL,
    [PAGAMENTO]                      VARCHAR (4)     NULL,
    [NOTE]                           NTEXT           NULL,
    [REFERENTE]                      VARCHAR (50)    NULL,
    [TEL_REF]                        VARCHAR (50)    NULL,
    [DATAMODIFICA]                   DATETIME        NULL,
    [UTENTEMODIFICA]                 VARCHAR (25)    NULL,
    [FLAG_ELIMINATO]                 VARCHAR (1)     NULL,
    [TOTALE_CONTRATTO]               NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [RATA_CONTRATTO]                 NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [PROVVIGIONE]                    NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [DATASCADENZA]                   DATETIME        NULL,
    [AZRIF]                          CHAR (3)        NULL,
    [RINNOVOAUT]                     CHAR (1)        NULL,
    [IdStato]                        DECIMAL (5)     DEFAULT ((1)) NOT NULL,
    [DataIdStato]                    DATETIME        NULL,
    [PCONTR]                         CHAR (13)       NULL,
    [NOTA_DIS]                       NTEXT           NULL,
    [DATA_DIS]                       DATETIME        NULL,
    [DATABLOCCO]                     DATETIME        NULL,
    [FLAGBLOCCO]                     CHAR (1)        NULL,
    [RESP_MANU]                      VARCHAR (50)    NULL,
    [RESP_CONTR]                     VARCHAR (50)    NULL,
    [SCONTO]                         NUMERIC (10, 2) NULL,
    [DATARACC]                       DATETIME        NULL,
    [DATAFLOPPY1]                    DATETIME        NULL,
    [DATAFLOPPY2]                    DATETIME        NULL,
    [CONTRORIG]                      CHAR (13)       NULL,
    [MINISFS]                        CHAR (1)        NULL,
    [FLGUSAPRZGEMMA]                 CHAR (1)        DEFAULT ('S') NULL,
    [PREAVVISOFAT]                   CHAR (1)        NULL,
    [flgvendis]                      CHAR (1)        NULL,
    [flg_mat_dafatt]                 CHAR (1)        DEFAULT ('S') NULL,
    [FLG_RIC_SCA_AUTO]               CHAR (1)        DEFAULT ('S') NULL,
    [EMAIL_RESPONSABILE]             VARCHAR (100)   NULL,
    [RIN_PCONTR]                     NCHAR (13)      NULL,
    [STAGIONALE]                     CHAR (1)        NULL,
    [PROVV_SEGNALATORE]              NUMERIC (10, 2) NULL,
    [CODCategoriaContratto]          DECIMAL (5)     NULL,
    [CODReferenteInternoGestione]    DECIMAL (5)     NULL,
    [RegistroOnLine]                 CHAR (1)        DEFAULT ('N') NULL,
    [RichiestaAutorizzFattura]       CHAR (1)        DEFAULT ('N') NULL,
    [CollegatoAdAltriContratti]      CHAR (1)        DEFAULT ('N') NULL,
    [CondizioniParticolariCollegate] CHAR (1)        DEFAULT ('N') NULL,
    [idModFatt]                      DECIMAL (5)     NOT NULL,
    [idTipoFatt]                     DECIMAL (5)     NOT NULL,
    [PubblicaGemmaPlus]              CHAR (1)        DEFAULT ('N') NULL,
    [DataPrimaRata]                  DATETIME        NULL,
    [CadenzaRate]                    DECIMAL (5)     NULL,
    [IdDivisione]                    SMALLINT        DEFAULT ((0)) NULL,
    [CODICECIG]                      VARCHAR (10)    DEFAULT ('') NOT NULL,
    [CODICECUP]                      VARCHAR (15)    DEFAULT ('') NOT NULL,
    [RIFCOMMCLI]                     VARCHAR (30)    NULL,
    [RifOfferta]                     VARCHAR (30)    NULL,
    [IdTipoCli]                      SMALLINT        DEFAULT ((0)) NULL,
    [CodIva]                         DECIMAL (5)     NULL,
    [FLG_ApplAumentoIstat]           CHAR (1)        DEFAULT ('S') NULL,
    [PercRinnISTAT]                  NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [Temp_FLAG_PROV]                 CHAR (1)        NULL,
    [FLG_ProvvExtraContratto]        CHAR (1)        DEFAULT ('N') NULL,
    [Provv1Materiali]                NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [Provv1OreAdd]                   NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [IdTipoContr]                    DECIMAL (5)     DEFAULT ((0)) NULL,
    [IdLivelloRiscCC]                DECIMAL (5)     DEFAULT ((0)) NULL,
    [FLG_AttRipristCompr]            CHAR (1)        DEFAULT ('S') NULL,
    [ValoreSogliaRiprist]            NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [FlgStampaNc]                    CHAR (1)        NULL,
    [FlgStampaAn]                    CHAR (1)        NULL,
    [idLOCompRata]                   DECIMAL (10)    DEFAULT ((1)) NULL,
    [flgStpCompRate]                 SMALLINT        DEFAULT ((0)) NOT NULL,
    [dSCgENERALErATA]                VARCHAR (150)   NULL,
    CONSTRAINT [GEM_TESTACONTRATTO_PK] PRIMARY KEY CLUSTERED ([IDCONTRATTO] ASC)
);


GO
CREATE NONCLUSTERED INDEX [GGEM_TESTACONTRATTO_dtEfficacia]
    ON [dbo].[GEM_TESTACONTRATTO]([DATAEFFICACIA] DESC);


GO
CREATE NONCLUSTERED INDEX [GGEM_TESTACONTRATTO_dtCONTRATTO_DESC]
    ON [dbo].[GEM_TESTACONTRATTO]([DATACONTRATTO] DESC);


GO
CREATE NONCLUSTERED INDEX [GGEM_TESTACONTRATTO_dtCONTRATTO_ASC]
    ON [dbo].[GEM_TESTACONTRATTO]([DATACONTRATTO] ASC);


GO
CREATE NONCLUSTERED INDEX [GGEM_TESTACONTRATTO_DATASCADENZA_ASC]
    ON [dbo].[GEM_TESTACONTRATTO]([DATASCADENZA] ASC);


GO
CREATE NONCLUSTERED INDEX [GEM_TESTACONTRATTO_CODCLIENTE]
    ON [dbo].[GEM_TESTACONTRATTO]([CODCLIENTE] ASC);


GO
CREATE NONCLUSTERED INDEX [_dta_index_GEM_TESTACONTRATTO_16_501785045__K4D_K1_K2_K25_5_22_27_38_45_47_53]
    ON [dbo].[GEM_TESTACONTRATTO]([DATACONTRATTO] DESC, [IDCONTRATTO] ASC, [CODCLIENTE] ASC, [IdStato] ASC)
    INCLUDE([DATAEFFICACIA], [DATASCADENZA], [PCONTR], [CONTRORIG], [RIN_PCONTR], [CODCategoriaContratto], [idModFatt]);


GO
CREATE NONCLUSTERED INDEX [GEM_TESTACONTRATTO_Divisione]
    ON [dbo].[GEM_TESTACONTRATTO]([IdDivisione] ASC);


GO
CREATE NONCLUSTERED INDEX [GEM_TESTACONTRATTO_IdStato]
    ON [dbo].[GEM_TESTACONTRATTO]([IdStato] ASC);


GO
CREATE STATISTICS [_dta_stat_501785045_25_47]
    ON [dbo].[GEM_TESTACONTRATTO]([IdStato], [CODCategoriaContratto]);


GO
CREATE STATISTICS [_dta_stat_501785045_53_25_47]
    ON [dbo].[GEM_TESTACONTRATTO]([idModFatt], [IdStato], [CODCategoriaContratto]);


GO
CREATE STATISTICS [_dta_stat_501785045_47_53_2]
    ON [dbo].[GEM_TESTACONTRATTO]([CODCategoriaContratto], [idModFatt], [CODCLIENTE]);


GO
CREATE STATISTICS [_dta_stat_501785045_2_25_47_53_4_1]
    ON [dbo].[GEM_TESTACONTRATTO]([CODCLIENTE], [IdStato], [CODCategoriaContratto], [idModFatt], [DATACONTRATTO], [IDCONTRATTO]);


GO

--------------------------------------------------------------------------------------------------------------
-- Sabrina Bordin 30 novembre 2012 
-- Trigger di controllo cancellazione testa contratto se presenti sezioni contratti gemma e/o 
-- , rapporti e rate Gemma
--------------------------------------------------------------------------------------------------------------

CREATE TRIGGER [dbo].[TD_GEM_TESTACONTRATTO] ON [dbo].[GEM_TESTACONTRATTO] FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)
    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN  
    /*  CANNOT DELETE PARENT "GEM_TESTACONTRATTO" IF CHILDREN STILL EXIST IN "GEM_SEZIONICONTRATTO"  */
    IF EXISTS (SELECT 1
               FROM   GEM_SEZIONICONTRATTO T2, DELETED T1
               WHERE  T2.IDCONTRATTO= T1.IDCONTRATTO)
       BEGIN
          SELECT @ERRNO  = 30006,
                 @ERRMSG = ' Esistono record nella tabella "Sezioni Contratti GemmaEvolus". Non è possibile cancellare la testa contratto.'
          GOTO ERROR
       END
  
    /*  CANNOT DELETE PARENT "GEM_TESTACONTRATTO" IF CHILDREN STILL EXIST IN "GEM_SEZIONECONTRATTORAPPORTI"  */
    IF EXISTS (SELECT 1
               FROM   GEM_SEZIONECONTRATTORAPPORTI T2, DELETED T1
               WHERE  T2.IDCONTRATTO = T1.IDCONTRATTO)
       BEGIN
          SELECT @ERRNO  = 30006,
                 @ERRMSG = 'Esistono record nella tabella "Rapporti CONTRATTO GemmaEvolus". Non è possibile cancellare il codice dalla testa contratto.'
          GOTO ERROR
       END  
    
	/*  CANNOT DELETE PARENT "GEM_TESTACONTRATTO" IF CHILDREN STILL EXIST IN "GEM_SEZIONECONTRATTO_RATE"  */
    IF EXISTS (SELECT 1
               FROM   GEM_SEZIONECONTRATTO_RATE T2, DELETED T1
               WHERE  T2.IDCONTRATTO = T1.IDCONTRATTO)
       BEGIN
          SELECT @ERRNO  = 30006,
                 @ERRMSG = 'Esistono record nella tabella "Rate CONTRATTO GemmaEvolus". Non è possibile cancellare il codice dalla testa contratto.'
          GOTO ERROR
       END      
    RETURN

/*  ERRORS HANDLING  */

ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END
GO

/*  ALTER TRIGGER "ALD_TD_TestCancTestaContratto" FOR TABLE "GEM_TESTACONTRATTO"  */
CREATE TRIGGER [ALD_TD_TestCancTestaContratto] ON [dbo].[GEM_TESTACONTRATTO] FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)
 
    SELECT  @NUMROWS = @@ROWCOUNT

    IF @NUMROWS = 0
       RETURN 

    /*  Accoda record testa cancellata su tbl temporanea ALD_TestCancTestaContratto*/
    insert into ALD_TestCancTestaContratto (IDCONTRATTO, DescrAzione, CODCLIENTE, UTENTEMODIFICA, DATAMODIFICA)
   select IDCONTRATTO, 'cancellazione Anagrafica contratto', CODCLIENTE, user, GETDATE()
    FROM   DELETED T1  

    RETURN
 
/*  ERRORS HANDLING  */

ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

/****** Object:  Table [dbo].[ALD_TestCancRapportiContratto]    Script Date: 13/06/2012 12:31:33 ******/

SET ANSI_NULLS ON

GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_TESTACONTRATTO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_TESTACONTRATTO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_TESTACONTRATTO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_TESTACONTRATTO] TO [Metodo98]
    AS [dbo];

