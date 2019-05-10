CREATE TABLE [dbo].[ParametriVBanco] (
    [Codice]                 VARCHAR (3)     NOT NULL,
    [Descrizione]            VARCHAR (80)    NULL,
    [CodCliente]             VARCHAR (7)     NULL,
    [VisNote]                SMALLINT        DEFAULT (0) NULL,
    [GestFido]               SMALLINT        DEFAULT (0) NULL,
    [TipoRiga]               VARCHAR (3)     NULL,
    [Periferica]             VARCHAR (1)     DEFAULT ('N') NULL,
    [ModuloStampa]           VARCHAR (50)    NULL,
    [FileRPT]                VARCHAR (50)    NULL,
    [DeviceStampa]           VARCHAR (255)   NULL,
    [NumCopie]               SMALLINT        DEFAULT (1) NULL,
    [Quantita]               DECIMAL (16, 6) DEFAULT (1) NULL,
    [PrezziIvati]            SMALLINT        DEFAULT (0) NULL,
    [ArrotondaPUL]           SMALLINT        DEFAULT (0) NULL,
    [RipScontoFinale]        SMALLINT        DEFAULT (0) NULL,
    [CodParametriDoc]        VARCHAR (3)     NULL,
    [ModifDoc]               SMALLINT        DEFAULT (0) NULL,
    [ArrotFinale]            DECIMAL (19, 4) DEFAULT (0) NULL,
    [TipoArrot]              VARCHAR (1)     DEFAULT ('C') NULL,
    [CodCausale]             DECIMAL (5)     NULL,
    [CodDeposito]            VARCHAR (10)    NULL,
    [CodCausaleColl]         DECIMAL (5)     NULL,
    [CodDepositoColl]        VARCHAR (10)    NULL,
    [AggMagScontrino]        SMALLINT        DEFAULT (0) NULL,
    [ContoRicavo]            VARCHAR (7)     NULL,
    [CodIVAVent]             DECIMAL (5)     NULL,
    [UsaCliCorr]             VARCHAR (1)     DEFAULT ('N') NULL,
    [BloccaTasti]            SMALLINT        DEFAULT (0) NULL,
    [SaltaCliLst]            SMALLINT        DEFAULT (0) NULL,
    [TipoUM]                 DECIMAL (5)     NULL,
    [CausVendita]            DECIMAL (5)     NULL,
    [CausPagamento]          DECIMAL (5)     NULL,
    [UTENTEMODIFICA]         VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]           DATETIME        NOT NULL,
    [CtrlAllest]             SMALLINT        DEFAULT (0) NULL,
    [CodGenAbbuoni]          VARCHAR (7)     NULL,
    [SalvaMovDoc]            SMALLINT        DEFAULT (0) NOT NULL,
    [CodCausaleReso]         DECIMAL (5)     NULL,
    [CodDepositoReso]        VARCHAR (10)    NULL,
    [VerifMarg]              SMALLINT        DEFAULT (0) NULL,
    [VisDisponibile]         SMALLINT        DEFAULT (0) NULL,
    [GstBarcode]             SMALLINT        DEFAULT (0) NULL,
    [ScontoPromo]            SMALLINT        DEFAULT (0) NULL,
    [OperVend]               SMALLINT        NULL,
    [MovProdPeso]            SMALLINT        NULL,
    [PathImgTotem]           VARCHAR (150)   NULL,
    [ArtPrezzoZero]          SMALLINT        CONSTRAINT [DF_ParametriVBanco_ArtPrezzoZero] DEFAULT (0) NULL,
    [ModifScontrino]         SMALLINT        CONSTRAINT [DF_ParametriVBanco_ModifScontrino] DEFAULT (0) NULL,
    [NDecImpTotali]          DECIMAL (9)     CONSTRAINT [DF_ParametriVBanco_NDecImpTotali] DEFAULT (2) NULL,
    [NonRaggrArt]            SMALLINT        CONSTRAINT [DF_ParametriVBanco_NonRaggrArt] DEFAULT (0) NULL,
    [NdecImpUniEuro]         SMALLINT        CONSTRAINT [DF_ParametriVBanco_NdecImpUniEuro] DEFAULT (6) NULL,
    [NdecImpTotEuro]         SMALLINT        CONSTRAINT [DF_ParametriVBanco_NdecImpTotEuro] DEFAULT (3) NULL,
    [GestMatrLotti]          SMALLINT        DEFAULT (0) NULL,
    [TipoGestMatrLotti]      SMALLINT        DEFAULT ((-1)) NULL,
    [GestSinonimi]           SMALLINT        DEFAULT (1) NULL,
    [GestTrnCasse]           SMALLINT        DEFAULT (1) NULL,
    [CodIVAAbb]              DECIMAL (5)     NULL,
    [CodGenRicavi]           VARCHAR (7)     NULL,
    [FocusOnCodCausale]      SMALLINT        DEFAULT (0) NULL,
    [ConvalidaAutomatica]    SMALLINT        DEFAULT ((0)) NULL,
    [GestioneCauzioni]       SMALLINT        DEFAULT ((0)) NULL,
    [EmettiDocDopoScontrino] SMALLINT        DEFAULT ((0)) NULL,
    [CodificaCliDaImp]       DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [ImportoPerCodificaCli]  DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [CodMastroDflt]          DECIMAL (5)     DEFAULT ((0)) NULL,
    [CodParametriDoc_RESO]   VARCHAR (3)     DEFAULT ('') NULL,
    [SCONTRINOPERS]          SMALLINT        DEFAULT ((0)) NULL,
    CONSTRAINT [ParametriVBanco_PK] PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CK_CtrlAllest] CHECK ([CtrlAllest] = 0 or [CtrlAllest] = 1),
    CONSTRAINT [CKC_AggMagScontrino] CHECK ([AggMagScontrino] = 0 or [AggMagScontrino] = 1),
    CONSTRAINT [CKC_ArrotondaPUL] CHECK ([ArrotondaPUL] = 0 or [ArrotondaPUL] = 1),
    CONSTRAINT [CKC_BloccaTasti] CHECK ([BloccaTasti] = 0 or [BloccaTasti] = 1),
    CONSTRAINT [CKC_GestFido] CHECK ([GestFido] = 0 or [GestFido] = 1),
    CONSTRAINT [CKC_ModifDoc] CHECK ([ModifDoc] = 0 or [ModifDoc] = 1),
    CONSTRAINT [CKC_PrezziIvati] CHECK ([PrezziIvati] = 0 or [PrezziIvati] = 1),
    CONSTRAINT [CKC_RipScontoFinale] CHECK ([RipScontoFinale] = 0 or [RipScontoFinale] = 1),
    CONSTRAINT [CKC_SaltaCliLst] CHECK ([SaltaCliLst] = 0 or [SaltaCliLst] = 1),
    CONSTRAINT [CKC_SalvaMovDoc] CHECK ([SalvaMovDoc] = 1 or [SalvaMovDoc] = 0),
    CONSTRAINT [CKC_VisNote] CHECK ([VisNote] = 0 or [VisNote] = 1)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ParametriVBanco] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ParametriVBanco] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ParametriVBanco] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ParametriVBanco] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ParametriVBanco] TO [Metodo98]
    AS [dbo];

