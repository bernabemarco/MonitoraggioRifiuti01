CREATE TABLE [dbo].[TEMPSTPFSINTRA] (
    [TipoFS]          VARCHAR (1)     NOT NULL,
    [Mese]            SMALLINT        CONSTRAINT [DF_TEMPSTPFSINTRA_Mese] DEFAULT (0) NULL,
    [Trimestre]       SMALLINT        CONSTRAINT [DF_TEMPSTPFSINTRA_Trimestre] DEFAULT (0) NULL,
    [Anno]            SMALLINT        CONSTRAINT [DF_TEMPSTPFSINTRA_Anno] DEFAULT (0) NULL,
    [TipoRiep]        VARCHAR (1)     NULL,
    [NumRifDischetto] INT             CONSTRAINT [DF_TEMPSTPFSINTRA_NumRifDischetto] DEFAULT ((0)) NULL,
    [CodFiscale]      VARCHAR (16)    NULL,
    [PartitaIva]      VARCHAR (12)    NULL,
    [Cognome]         VARCHAR (80)    NULL,
    [Nome]            VARCHAR (80)    NULL,
    [DataNascita]     VARCHAR (6)     NULL,
    [Sesso]           VARCHAR (1)     NULL,
    [ComuneNascita]   VARCHAR (80)    NULL,
    [Provincia]       VARCHAR (4)     NULL,
    [PrefTel]         VARCHAR (5)     NULL,
    [NumTel]          VARCHAR (10)    NULL,
    [RagSocPG]        VARCHAR (162)   NULL,
    [PrefTelPG]       VARCHAR (5)     NULL,
    [NumTelPG]        VARCHAR (10)    NULL,
    [DomFisc]         VARCHAR (90)    NULL,
    [Cap]             VARCHAR (8)     NULL,
    [ComuneFisc]      VARCHAR (80)    NULL,
    [ProvFisc]        VARCHAR (4)     NULL,
    [PrimoEl]         VARCHAR (1)     NULL,
    [CesAtt]          VARCHAR (1)     NULL,
    [PartIvaSD]       VARCHAR (12)    NULL,
    [RagSocSD]        VARCHAR (80)    NULL,
    [PrefTelSD]       VARCHAR (4)     NULL,
    [NumTelSD]        VARCHAR (10)    NULL,
    [DomFiscSD]       VARCHAR (86)    NULL,
    [CAPSD]           VARCHAR (5)     NULL,
    [ComuneSD]        VARCHAR (80)    NULL,
    [ProvSD]          VARCHAR (2)     NULL,
    [TotPag1]         SMALLINT        CONSTRAINT [DF_TEMPSTPFSINTRA_TotPag1] DEFAULT (0) NULL,
    [TotRighe1]       SMALLINT        CONSTRAINT [DF_TEMPSTPFSINTRA_TotRighe1] DEFAULT (0) NULL,
    [TotEuro1]        DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPFSINTRA_TotEuro1] DEFAULT (0) NULL,
    [TotPag2]         SMALLINT        CONSTRAINT [DF_TEMPSTPFSINTRA_TotPag2] DEFAULT (0) NULL,
    [TotRighe2]       SMALLINT        CONSTRAINT [DF_TEMPSTPFSINTRA_TotRighe2] DEFAULT (0) NULL,
    [TotEuro2]        DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPFSINTRA_TotEuro2] DEFAULT (0) NULL,
    [IDSessione]      SMALLINT        NOT NULL,
    [UtenteModifica]  VARCHAR (25)    NOT NULL,
    [DataModifica]    DATETIME        NOT NULL,
    [PERIODODATITRIM] SMALLINT        NULL,
    [TOTRIGHE3]       SMALLINT        NULL,
    [TOTEURO3]        DECIMAL (19, 4) NULL,
    [TOTRIGHE4]       SMALLINT        NULL,
    [TOTEURO4]        DECIMAL (19, 4) NULL,
    CONSTRAINT [PK_TEMPSTPFSINTRA] PRIMARY KEY CLUSTERED ([TipoFS] ASC, [IDSessione] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPSTPFSINTRA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSTPFSINTRA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPSTPFSINTRA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSTPFSINTRA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSTPFSINTRA] TO [Metodo98]
    AS [dbo];

