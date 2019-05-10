CREATE TABLE [dbo].[TabParamMissioniPicking] (
    [PROGRESSIVO]                DECIMAL (10)  NOT NULL,
    [UM]                         VARCHAR (3)   NULL,
    [CONTATORE]                  DECIMAL (5)   NULL,
    [IMPOSTAFILTRO]              SMALLINT      NULL,
    [TIPOEMISSLISTE]             SMALLINT      NULL,
    [MODULOSTAMPAPERCLIENTE]     VARCHAR (100) NULL,
    [DEVICESTAMPAPERCLIENTE]     VARCHAR (100) NULL,
    [MODULOSTAMPAMULTIPRESA]     VARCHAR (100) NULL,
    [DEVICESTAMPAMULTIPRESA]     VARCHAR (100) NULL,
    [UTENTEMODIFICA]             VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]               DATETIME      NOT NULL,
    [NUMCOPIE]                   SMALLINT      NULL,
    [CONT_BORDERAUX]             DECIMAL (5)   DEFAULT (0) NULL,
    [GEN_IMPPAG]                 VARCHAR (7)   DEFAULT ('') NULL,
    [CAUS_CONT]                  DECIMAL (5)   DEFAULT (0) NULL,
    [MODULOSTAMPA_BORDERAUX]     VARCHAR (100) DEFAULT ('') NULL,
    [DEVICESTAMPA_BORDERAUX]     VARCHAR (100) DEFAULT ('') NULL,
    [NUMCOPIE_BORDERAUX]         SMALLINT      NULL,
    [USERID_MISS]                VARCHAR (25)  DEFAULT ('') NULL,
    [USERID_DOC]                 VARCHAR (25)  DEFAULT ('') NULL,
    [AttivaPresel]               SMALLINT      DEFAULT (0) NULL,
    [MsgSuNonCoeffUm]            SMALLINT      DEFAULT (0) NULL,
    [DisabGestLotti]             SMALLINT      DEFAULT (0) NULL,
    [TipoPrelievo]               SMALLINT      DEFAULT (0) NULL,
    [TIPODOCDFLTEMISS]           VARCHAR (3)   NULL,
    [tipoleggipenna]             SMALLINT      DEFAULT (0) NULL,
    [MODULOSTAMPA_ETIC]          VARCHAR (100) DEFAULT ('') NULL,
    [DEVICESTAMPA_ETIC]          VARCHAR (100) DEFAULT ('') NULL,
    [NUMCOPIE_ETIC]              SMALLINT      DEFAULT (0) NULL,
    [GEN_Abbuono]                VARCHAR (7)   DEFAULT ('') NULL,
    [CAUS_CONT_Abbuono]          DECIMAL (5)   DEFAULT (0) NULL,
    [DepositoDefault]            VARCHAR (10)  DEFAULT ('') NULL,
    [AttivaBordero]              VARCHAR (10)  DEFAULT ((0)) NULL,
    [CtrlGiac]                   SMALLINT      DEFAULT ((0)) NULL,
    [EscludiCliBloccato]         SMALLINT      DEFAULT ((0)) NULL,
    [SuGiacMancSempreEvasParz]   SMALLINT      DEFAULT ((0)) NULL,
    [AttivaGstPalmare]           SMALLINT      DEFAULT ((0)) NULL,
    [TipoCalcGstLotto]           SMALLINT      DEFAULT ((0)) NULL,
    [PrecaricaSped]              SMALLINT      DEFAULT ((0)) NULL,
    [GstEmissDocSuRegPiani]      SMALLINT      DEFAULT ((0)) NULL,
    [TipoDocSuRegPiani]          VARCHAR (3)   DEFAULT ('') NULL,
    [NonRaggrEmissDocSuRegPiani] SMALLINT      DEFAULT ((0)) NULL,
    [TIPODOCRESI]                VARCHAR (3)   DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_TabParamMissioniPicking] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TabParamMissioniPicking] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TabParamMissioniPicking] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TabParamMissioniPicking] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TabParamMissioniPicking] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TabParamMissioniPicking] TO [Metodo98]
    AS [dbo];

