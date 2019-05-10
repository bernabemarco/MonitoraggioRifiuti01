CREATE TABLE [dbo].[EXTRAFORNITORI] (
    [CODCONTO]            VARCHAR (7)  NOT NULL,
    [UTENTEMODIFICA]      VARCHAR (25) NOT NULL,
    [DATAMODIFICA]        DATETIME     NOT NULL,
    [C]                   VARCHAR (1)  NULL,
    [QQQ]                 VARCHAR (5)  NULL,
    [V]                   VARCHAR (1)  NULL,
    [X]                   VARCHAR (1)  NULL,
    [CodiceDeroga]        CHAR (2)     COLLATE Latin1_General_CI_AS NULL,
    [CodiceVoce]          VARCHAR (6)  COLLATE Latin1_General_CI_AS NULL,
    [GiorniRitardo]       NUMERIC (9)  NULL,
    [CodFornitoreNew]     VARCHAR (7)  DEFAULT ('') NULL,
    [CtrlPivaCF]          SMALLINT     DEFAULT (0) NULL,
    [idTipologiaFor]      SMALLINT     NULL,
    [idValutazioneFor]    SMALLINT     NULL,
    [TipoFornitura]       VARCHAR (50) NULL,
    [DtUltimaVal]         DATETIME     NULL,
    [DtCreazione]         DATETIME     DEFAULT (getdate()) NULL,
    [CodSap]              VARCHAR (10) NULL,
    [IdSocietaPartnerMNC] VARCHAR (6)  NULL,
    [IdSocietaPartnerGR]  VARCHAR (4)  NULL,
    [ClassFID]            VARCHAR (10) NULL,
    [ExportSap]           INT          DEFAULT ((0)) NULL,
    [IdMacroTipologieAcq] VARCHAR (6)  DEFAULT ('') NULL,
    [IDSottoTipAcq]       VARCHAR (6)  DEFAULT ('') NULL,
    [IDTipoForn]          VARCHAR (6)  DEFAULT ('') NULL,
    [IDTipoAlboForn]      VARCHAR (6)  DEFAULT ('') NULL,
    [IDStatoForn]         VARCHAR (6)  DEFAULT ('') NULL,
    [EsclusoFattB2B]      SMALLINT     DEFAULT ((0)) NULL,
    [CODFORNITOREOLD]     VARCHAR (7)  NULL,
    CONSTRAINT [PK_EXTRAFORNITORI] PRIMARY KEY CLUSTERED ([CODCONTO] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_EXTRAFORNITORI_CODCONTO] FOREIGN KEY ([CODCONTO]) REFERENCES [dbo].[ANAGRAFICACF] ([CODCONTO]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE STATISTICS [_dta_stat_597577167_1_25]
    ON [dbo].[EXTRAFORNITORI]([CODCONTO], [IDTipoForn]);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EXTRAFORNITORI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EXTRAFORNITORI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[EXTRAFORNITORI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EXTRAFORNITORI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EXTRAFORNITORI] TO [Metodo98]
    AS [dbo];

