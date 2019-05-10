﻿CREATE TABLE [dbo].[TABSCADENZE] (
    [PROGRESSIVO]        DECIMAL (10)    NOT NULL,
    [ESERCIZIO]          DECIMAL (5)     NOT NULL,
    [ANNODOC]            SMALLINT        DEFAULT (0) NULL,
    [TIPODOC]            VARCHAR (3)     NULL,
    [NUMDOC]             DECIMAL (10)    NULL,
    [BIS]                CHAR (1)        NULL,
    [NUMSCAD]            INT             CONSTRAINT [DF_TABSCADENZE_NUMSCAD] DEFAULT (0) NULL,
    [DATASCADENZA]       DATETIME        NULL,
    [CODCLIFOR]          VARCHAR (7)     NULL,
    [DATAFATTURA]        DATETIME        NULL,
    [BANCAINC]           VARCHAR (7)     NULL,
    [BANCAAPPOGGIO]      DECIMAL (5)     NULL,
    [NUMRIF]             VARCHAR (15)    NULL,
    [NUMEROPROT]         VARCHAR (12)    NULL,
    [CODAGE1]            VARCHAR (7)     NULL,
    [CODAGE2]            VARCHAR (7)     NULL,
    [CODAGE3]            VARCHAR (7)     NULL,
    [IMPPROVLIT1]        DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [IMPPROVLIT2]        DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [IMPPROVLIT3]        DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [IMPPROVVAL1]        DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [IMPPROVVAL2]        DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [IMPPROVVAL3]        DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [IMPPROVEURO1]       DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [IMPPROVEURO2]       DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [IMPPROVEURO3]       DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [LIQPROV1]           SMALLINT        DEFAULT (0) NULL,
    [LIQPROV2]           SMALLINT        DEFAULT (0) NULL,
    [LIQPROV3]           SMALLINT        DEFAULT (0) NULL,
    [IMPORTOSCLIT]       DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [IMPORTOSCVAL]       DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [IMPORTOSCEURO]      DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [IMPONIBSCLIT]       DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [IMPONIBSCVAL]       DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [IMPONIBSCEURO]      DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [TOTFATTLIT]         DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [TOTFATTVAL]         DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [TOTFATTEURO]        DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [IMPFATTLIT]         DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [IMPFATTVAL]         DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [IMPFATTEURO]        DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [FLAGCONT]           SMALLINT        DEFAULT (0) NULL,
    [TIPOEFFETTO]        NUMERIC (5)     NULL,
    [ESITO]              NUMERIC (1)     NULL,
    [LIVSOLL]            SMALLINT        NULL,
    [LIQINS1]            SMALLINT        DEFAULT (0) NULL,
    [LIQINS2]            SMALLINT        DEFAULT (0) NULL,
    [LIQINS3]            SMALLINT        DEFAULT (0) NULL,
    [CODCAMBIO]          DECIMAL (5)     NULL,
    [VALCAMBIO]          DECIMAL (13, 6) DEFAULT (1) NOT NULL,
    [NRDISTINTA]         DECIMAL (10)    NULL,
    [NUMRAGGR]           INT             NULL,
    [DATAPAGEFF]         DATETIME        NULL,
    [SCADATTPASS]        SMALLINT        DEFAULT (0) NULL,
    [NUMRIFPARTCONT]     VARCHAR (19)    NULL,
    [CODPAG]             VARCHAR (4)     NULL,
    [DATADEC]            DATETIME        NULL,
    [NOTE]               VARCHAR (1000)  NULL,
    [NRGIORNALE]         DECIMAL (5)     NULL,
    [UTENTEMODIFICA]     VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]       DATETIME        NOT NULL,
    [RIFRIGACONT]        SMALLINT        DEFAULT (0) NULL,
    [ESITOPREC]          SMALLINT        DEFAULT (0) NULL,
    [NRREGESITO]         NUMERIC (10)    NULL,
    [IDBOZZAAGT1]        DECIMAL (10)    DEFAULT (0) NOT NULL,
    [NRRIGAAGT1]         DECIMAL (5)     DEFAULT (0) NOT NULL,
    [IDBOZZAAGT2]        DECIMAL (10)    DEFAULT (0) NOT NULL,
    [NRRIGAAGT2]         DECIMAL (5)     DEFAULT (0) NOT NULL,
    [IDBOZZAAGT3]        DECIMAL (10)    DEFAULT (0) NOT NULL,
    [NRRIGAAGT3]         DECIMAL (5)     DEFAULT (0) NOT NULL,
    [DATASOLL1]          DATETIME        NULL,
    [DATASOLL2]          DATETIME        NULL,
    [DATASOLL3]          DATETIME        NULL,
    [RIFSCADRIEMISSIONE] DECIMAL (10)    NULL,
    [FLAGCESSIONE]       SMALLINT        NULL,
    [ABI_RIEMISS]        VARCHAR (6)     NULL,
    [CAB_RIEMISS]        VARCHAR (6)     NULL,
    [RAGSOC_RIEMISS]     VARCHAR (80)    NULL,
    [INDIRIZZO_RIEMISS]  VARCHAR (80)    NULL,
    [CAP_RIEMISS]        VARCHAR (8)     NULL,
    [LOCALITA_RIEMISS]   VARCHAR (80)    NULL,
    [PROV_RIEMISS]       VARCHAR (4)     NULL,
    [NAZ_RIEMISS]        DECIMAL (5)     NULL,
    [NOTE_RIEMISS]       VARCHAR (255)   NULL,
    [ESITOPRECRIEMISS]   SMALLINT        NULL,
    [DSCBANCARIEMISS]    VARCHAR (80)    NULL,
    [DATAULTCALCINT]     DATETIME        NULL,
    [STATOSCADENZA]      SMALLINT        CONSTRAINT [DF_TABSCADENZE_STATOSCADENZA] DEFAULT (0) NULL,
    [DATABLOCCO]         DATETIME        NULL,
    [DATASOLL4]          DATETIME        NULL,
    [DATASOLL5]          DATETIME        NULL,
    [CODICECIG]          VARCHAR (10)    CONSTRAINT [DF_TABSCADENZE_CODICECIG] DEFAULT ('') NOT NULL,
    [CODICECUP]          VARCHAR (15)    CONSTRAINT [DF_TABSCADENZE_CODICECUP] DEFAULT ('') NOT NULL,
    [PROGSCADANTICIPO]   DECIMAL (10)    CONSTRAINT [DF_TABSCADENZE_PROGSCADANTICIPO] DEFAULT ((0)) NULL,
    [ESCLUDICALCPREMI]   SMALLINT        DEFAULT ((0)) NULL,
    [FLGLIQSOSP]         SMALLINT        DEFAULT ((0)) NULL,
    [DATAVALUTA]         DATETIME        NULL,
    [IDTESTADOC]         DECIMAL (10)    CONSTRAINT [DF_TABSCADENZE_IDTESTADOC] DEFAULT ((0)) NULL,
    [IDTESTAPN]          DECIMAL (10)    CONSTRAINT [DF_TABSCADENZE_IDTESTAPN] DEFAULT ((0)) NULL,
    [CODCOMMESSA]        VARCHAR (30)    NULL,
    CONSTRAINT [PK_TABSCADENZE] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CHK_TABSCADENZE_ESCLUDICALCPREMI] CHECK ([ESCLUDICALCPREMI]=(1) OR [ESCLUDICALCPREMI]=(0)),
    CONSTRAINT [CHK_TABSCADENZE_FLAGCESSIONE] CHECK ([FLAGCESSIONE] = 1 or [FLAGCESSIONE] = 0),
    CONSTRAINT [CHK_TABSCADENZE_FLGLIQSOSP] CHECK ([FLGLIQSOSP]=(1) OR [FLGLIQSOSP]=(0)),
    CONSTRAINT [CHK_TABSCADENZE_STATOSCADENZA] CHECK ([STATOSCADENZA] = 1 or [STATOSCADENZA] = 0),
    CONSTRAINT [CKC_FLAGCONT_TABSCADE] CHECK ([FLAGCONT] = 0 or [FLAGCONT] = 1),
    CONSTRAINT [CKC_LIQINS1_TABSCADE] CHECK ([LIQINS1] = 0 or [LIQINS1] = 1),
    CONSTRAINT [CKC_LIQINS2_TABSCADE] CHECK ([LIQINS2] = 0 or [LIQINS2] = 1),
    CONSTRAINT [CKC_LIQINS3_TABSCADE] CHECK ([LIQINS3] = 0 or [LIQINS3] = 1),
    CONSTRAINT [CKC_LIQPROV1_TABSCADE] CHECK ([LIQPROV1] = 0 or [LIQPROV1] = 1),
    CONSTRAINT [CKC_LIQPROV2_TABSCADE] CHECK ([LIQPROV2] = 0 or [LIQPROV2] = 1),
    CONSTRAINT [CKC_LIQPROV3_TABSCADE] CHECK ([LIQPROV3] = 0 or [LIQPROV3] = 1),
    CONSTRAINT [CKC_SCADATTPASS_TABSCADE] CHECK ([SCADATTPASS] = 0 or [SCADATTPASS] = 1)
);


GO
CREATE NONCLUSTERED INDEX [TSCA_1]
    ON [dbo].[TABSCADENZE]([TIPODOC] ASC, [NUMDOC] ASC, [BIS] ASC, [NUMSCAD] ASC, [DATASCADENZA] ASC, [CODCLIFOR] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [TSCA_2]
    ON [dbo].[TABSCADENZE]([CODCLIFOR] ASC, [TIPOEFFETTO] ASC, [DATASCADENZA] ASC, [NUMRIF] ASC, [NUMSCAD] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [NRDISTINTA]
    ON [dbo].[TABSCADENZE]([NRDISTINTA] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [a_IdxNumEffetto]
    ON [dbo].[TABSCADENZE]([NUMRAGGR] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [a_IdxNumDistinta]
    ON [dbo].[TABSCADENZE]([NRDISTINTA] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ALD_TSCA]
    ON [dbo].[TABSCADENZE]([CODCLIFOR] ASC, [ESERCIZIO] ASC, [NUMRIF] ASC, [NUMDOC] ASC, [TIPODOC] ASC, [NUMRIFPARTCONT] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [TABSCADENZE_IDTESTADOC]
    ON [dbo].[TABSCADENZE]([IDTESTADOC] ASC);


GO
CREATE TRIGGER TD_TABSCADENZE ON TABSCADENZE FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN
    
    /*  DELETE ALL CHILDREN IN "EXTRASCADENZE"  */
    DELETE EXTRASCADENZE
    FROM   EXTRASCADENZE T2, DELETED T1
    WHERE  T2.PROGRESSIVO = T1.PROGRESSIVO
    
    UPDATE TABSCADENZE SET RIFSCADRIEMISSIONE=0,ESITO=ESITOPRECRIEMISS,ESITOPRECRIEMISS=NULL WHERE RIFSCADRIEMISSIONE IN (SELECT T1.PROGRESSIVO FROM DELETED T1)
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABSCADENZE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABSCADENZE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABSCADENZE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABSCADENZE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABSCADENZE] TO [Metodo98]
    AS [dbo];

