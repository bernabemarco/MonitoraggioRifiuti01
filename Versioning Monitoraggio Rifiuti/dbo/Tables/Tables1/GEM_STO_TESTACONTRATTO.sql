CREATE TABLE [dbo].[GEM_STO_TESTACONTRATTO] (
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
    [FLG_ApplAumentoIstat]           CHAR (1)        DEFAULT ('S') NULL,
    [PercRinnISTAT]                  NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [RifOfferta]                     VARCHAR (30)    NULL,
    [IdTipoCli]                      SMALLINT        DEFAULT ((0)) NULL,
    [CodIva]                         DECIMAL (5)     NULL,
    [Temp_FLAG_PROV]                 CHAR (1)        NULL,
    [FLG_ProvvExtraContratto]        CHAR (1)        DEFAULT ('N') NULL,
    [Provv1Materiali]                NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [Provv1OreAdd]                   NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [IdTipoContr]                    DECIMAL (5)     DEFAULT ((0)) NULL,
    [IdLivelloRiscCC]                DECIMAL (5)     DEFAULT ((0)) NULL,
    [FLG_AttRipristCompr]            CHAR (1)        DEFAULT ('S') NULL,
    [ValoreSogliaRiprist]            NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [idLOCompRata]                   DECIMAL (10)    DEFAULT ((1)) NULL,
    [flgStpCompRate]                 SMALLINT        DEFAULT ((0)) NOT NULL,
    [dSCgENERALErATA]                VARCHAR (150)   NULL,
    CONSTRAINT [GEM_STO_TESTACONTRATTO_PK] PRIMARY KEY CLUSTERED ([IDCONTRATTO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_STO_TESTACONTRATTO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_STO_TESTACONTRATTO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_STO_TESTACONTRATTO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_STO_TESTACONTRATTO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_STO_TESTACONTRATTO] TO [Metodo98]
    AS [dbo];

