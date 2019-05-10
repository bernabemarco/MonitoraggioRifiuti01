CREATE TABLE [dbo].[ContribCondizInElab] (
    [Uid]                       UNIQUEIDENTIFIER NOT NULL,
    [SESSIONE]                  INT              NOT NULL,
    [DiCui]                     SMALLINT         NOT NULL,
    [Contratto]                 DECIMAL (18)     NOT NULL,
    [ProgressivoContributoCond] DECIMAL (10)     NOT NULL,
    [NrRifRigaCondDiCui]        INT              NULL,
    [NrRigaContributoCond]      INT              NOT NULL,
    [DaData]                    DATETIME         NOT NULL,
    [AData]                     DATETIME         NOT NULL,
    [Valore]                    DECIMAL (19, 6)  NOT NULL,
    [Qta]                       DECIMAL (19, 6)  DEFAULT ((0)) NOT NULL,
    [Um]                        VARCHAR (3)      DEFAULT ('') NOT NULL,
    [Qta2]                      DECIMAL (19, 6)  DEFAULT ((0)) NOT NULL,
    [Um2]                       VARCHAR (3)      DEFAULT ('') NOT NULL,
    [ConsuntivatoQta]           DECIMAL (19, 6)  DEFAULT ((0)) NOT NULL,
    [ConsuntivatoValore]        DECIMAL (19, 6)  DEFAULT ((0)) NOT NULL,
    [Gruppo]                    DECIMAL (5)      NULL,
    [Categoria]                 DECIMAL (5)      NULL,
    [CategoriaS]                DECIMAL (5)      NULL,
    [GruppoPrezzi]              DECIMAL (5)      NULL,
    [Famiglia]                  DECIMAL (5)      NULL,
    [Reparto]                   DECIMAL (5)      NULL,
    [Articolo]                  VARCHAR (80)     NULL,
    [Escludi]                   SMALLINT         NULL,
    [Esercizio]                 DECIMAL (5)      NOT NULL,
    [TipoDoc]                   VARCHAR (3)      NOT NULL,
    [GGDataDoc]                 INT              NOT NULL,
    [GGDaData]                  INT              NOT NULL,
    [GGAData]                   INT              NOT NULL,
    [IdTesta]                   DECIMAL (10)     NOT NULL,
    [IdRiga]                    INT              NOT NULL,
    [TipoRiga]                  CHAR (1)         NULL,
    [RD_Gruppo]                 DECIMAL (5)      NULL,
    [RD_Categoria]              DECIMAL (5)      NULL,
    [RD_CategoriaS]             DECIMAL (5)      NULL,
    [RD_GruppoPrezzi]           DECIMAL (5)      NULL,
    [RD_Famiglia]               DECIMAL (5)      NULL,
    [RD_Reparto]                DECIMAL (5)      NULL,
    [RD_Articolo]               VARCHAR (80)     NULL,
    [UmGest]                    VARCHAR (3)      NULL,
    [QtaGest]                   DECIMAL (16, 6)  DEFAULT ((0)) NULL,
    [PrezzoUnitLordo]           DECIMAL (19, 6)  DEFAULT ((0)) NULL,
    [TotNettoRiga]              DECIMAL (19, 6)  DEFAULT ((0)) NULL,
    [ScontoFinale]              VARCHAR (20)     NULL,
    [PrcScontoIncond]           VARCHAR (10)     NULL,
    [ScontoIncond]              DECIMAL (19, 6)  NULL,
    [TP_Formula_SCT]            VARCHAR (20)     NULL,
    [QtaPrezzo]                 DECIMAL (16, 6)  DEFAULT ((0)) NULL,
    [TipoCalcoloPremio]         SMALLINT         DEFAULT ((0)) NULL,
    [UtenteModifica]            VARCHAR (25)     NULL,
    [DataModifica]              DATETIME         NULL,
    [BUDGET]                    DECIMAL (19, 6)  NULL,
    [PREMIOMATURATO]            DECIMAL (19, 6)  NULL,
    [TotSpeseTraspRes]          DECIMAL (19, 4)  DEFAULT ((0)) NULL,
    [TotImponibileEuro]         DECIMAL (19, 4)  DEFAULT ((0)) NULL,
    [PREMIOPERCENT]             DECIMAL (19, 6)  DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([Uid] ASC, [SESSIONE] ASC, [DiCui] ASC, [Contratto] ASC, [ProgressivoContributoCond] ASC, [NrRigaContributoCond] ASC, [IdTesta] ASC, [IdRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ContribCondizInElab] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ContribCondizInElab] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ContribCondizInElab] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ContribCondizInElab] TO [Metodo98]
    AS [dbo];

