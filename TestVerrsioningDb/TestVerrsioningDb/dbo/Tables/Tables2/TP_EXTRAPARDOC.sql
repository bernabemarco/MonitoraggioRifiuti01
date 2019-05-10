CREATE TABLE [dbo].[TP_EXTRAPARDOC] (
    [CODICE]                   VARCHAR (3)    NOT NULL,
    [LiberoGuid]               SMALLINT       DEFAULT (0) NULL,
    [OCMANPredefinito]         SMALLINT       DEFAULT (0) NULL,
    [DOCPRENOTATO]             VARCHAR (3)    DEFAULT ('') NULL,
    [DOCSTRALCIO]              VARCHAR (3)    DEFAULT ('') NULL,
    [GiacDisp]                 SMALLINT       DEFAULT (0) NULL,
    [GrBloccLib]               SMALLINT       DEFAULT (0) NULL,
    [bolVerificaRelConfORC]    SMALLINT       DEFAULT (0) NULL,
    [GrRelCfvAttiva]           SMALLINT       DEFAULT (0) NULL,
    [Recovery]                 SMALLINT       DEFAULT (0) NULL,
    [PrCessIva]                SMALLINT       DEFAULT (0) NULL,
    [VisTipLis]                SMALLINT       DEFAULT (0) NULL,
    [VisPrzCess]               SMALLINT       DEFAULT (0) NULL,
    [VisPrzPartSN]             SMALLINT       DEFAULT (0) NULL,
    [PrzZero]                  SMALLINT       DEFAULT (0) NULL,
    [AbilGstSctAgg]            SMALLINT       DEFAULT (0) NULL,
    [AbilGstSctLog]            SMALLINT       DEFAULT (0) NULL,
    [AbilGstSctLogFor]         SMALLINT       DEFAULT (0) NULL,
    [UMRIFSctLog]              VARCHAR (3)    DEFAULT ('') NULL,
    [UMRIFSctLogFor]           VARCHAR (3)    DEFAULT ('') NULL,
    [CalcSctLogFor]            SMALLINT       DEFAULT (0) NULL,
    [UmTotPeso]                VARCHAR (3)    DEFAULT ('') NULL,
    [OCNLPPart]                DECIMAL (5)    DEFAULT (0) NULL,
    [LstCalcRedd]              DECIMAL (5)    DEFAULT (0) NULL,
    [ModifScntFFattura]        SMALLINT       DEFAULT (0) NULL,
    [TipCalPord0]              SMALLINT       DEFAULT (0) NULL,
    [OFCALCTSicurezza]         SMALLINT       DEFAULT (0) NULL,
    [OFCALCCorrezione]         DECIMAL (5, 1) DEFAULT (0) NULL,
    [OFNCAL]                   SMALLINT       DEFAULT (0) NULL,
    [GioLav]                   SMALLINT       DEFAULT (0) NULL,
    [FDelta]                   SMALLINT       DEFAULT (0) NULL,
    [ArrotondaPOrd]            SMALLINT       DEFAULT (0) NULL,
    [GENORDDEP]                SMALLINT       DEFAULT (0) NULL,
    [GENORDRPL]                SMALLINT       DEFAULT (0) NULL,
    [TIPODOCRIEP]              VARCHAR (3)    DEFAULT ('') NULL,
    [DOCCOLL]                  VARCHAR (3)    DEFAULT ('') NULL,
    [UTENTEMODIFICA]           VARCHAR (25)   NOT NULL,
    [DATAMODIFICA]             DATETIME       NOT NULL,
    [DisattivaPromo]           SMALLINT       DEFAULT (0) NULL,
    [VincolaArticoliInGr]      SMALLINT       DEFAULT (0) NULL,
    [TIPODOCOFN]               SMALLINT       CONSTRAINT [DF_TP_EXTRAPARDOC_TIPODOCOFN] DEFAULT ((0)) NULL,
    [FILTRODOCOFN]             VARCHAR (50)   NULL,
    [solosdoppiamento]         SMALLINT       DEFAULT (0) NULL,
    [ricercapromodataconsegna] SMALLINT       DEFAULT (0) NULL,
    [geststoricomag]           SMALLINT       CONSTRAINT [DF_TP_EXTRAPARDOC_geststoricomag] DEFAULT ((0)) NULL,
    [RELCFVAUTOMATICA]         SMALLINT       DEFAULT (0) NULL,
    [ACCORPA]                  SMALLINT       DEFAULT ((0)) NULL,
    [GESTCONFIGSCONTI]         SMALLINT       DEFAULT ((0)) NULL,
    [GESTROTSTAG]              SMALLINT       DEFAULT ((0)) NULL,
    [OFLSTValutazione]         DECIMAL (5)    DEFAULT ((0)) NULL,
    [OFLSTMargIvato]           SMALLINT       DEFAULT ((0)) NULL,
    [OFMODEMISSIONEDOC]        SMALLINT       DEFAULT ((0)) NULL,
    [OFAGGLISTINI]             SMALLINT       DEFAULT ((0)) NULL,
    [RaeeGestione]             SMALLINT       DEFAULT ((0)) NULL,
    [OFDepGrid]                VARCHAR (3)    DEFAULT ('') NULL,
    [OFForGrid]                VARCHAR (3)    DEFAULT ('') NULL,
    [DOCPRENOTATOEXTRA]        VARCHAR (5)    NULL,
    [GSTART62]                 SMALLINT       DEFAULT ((0)) NULL,
    [ASSEGNAPROPOSTAFORNITORE] SMALLINT       DEFAULT ((0)) NULL,
    [CODPATHIMG]               VARCHAR (20)   DEFAULT ('') NULL,
    [OFCODPATHIMG]             VARCHAR (20)   DEFAULT ('') NULL,
    CONSTRAINT [PK_TP_EXTRAPARDOC] PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_TP_EXTRAPARDOC_CODICE] FOREIGN KEY ([CODICE]) REFERENCES [dbo].[PARAMETRIDOC] ([CODICE]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_EXTRAPARDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_EXTRAPARDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_EXTRAPARDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_EXTRAPARDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_EXTRAPARDOC] TO [Metodo98]
    AS [dbo];

