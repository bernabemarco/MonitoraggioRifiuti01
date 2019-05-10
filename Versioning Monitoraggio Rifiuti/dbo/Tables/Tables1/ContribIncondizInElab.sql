CREATE TABLE [dbo].[ContribIncondizInElab] (
    [Uid]                  UNIQUEIDENTIFIER NOT NULL,
    [SESSIONE]             INT              NOT NULL,
    [Contratto]            DECIMAL (10)     NOT NULL,
    [NrRigaContributo]     DECIMAL (10)     NOT NULL,
    [NrRigaContributoPerc] DECIMAL (10)     NOT NULL,
    [DADATA]               DATETIME         NULL,
    [ADATA]                DATETIME         NULL,
    [PERCENTUALE]          DECIMAL (19, 6)  NULL,
    [BUDGET]               DECIMAL (19, 6)  NULL,
    [CONSUNTIVO]           DECIMAL (19, 6)  NULL,
    [PREMIOMATURATO]       DECIMAL (19, 6)  NULL,
    [CONSUNTIVOQTA]        DECIMAL (19, 6)  NULL,
    [PREMIONONVALIDO]      SMALLINT         NULL,
    [IdTesta]              DECIMAL (10)     NOT NULL,
    [IdRiga]               INT              NOT NULL,
    [UmGest]               VARCHAR (3)      NULL,
    [QtaGest]              DECIMAL (16, 6)  DEFAULT ((0)) NULL,
    [PrezzoUnitLordo]      DECIMAL (19, 6)  DEFAULT ((0)) NULL,
    [TotNettoRiga]         DECIMAL (19, 6)  DEFAULT ((0)) NULL,
    [ScontoFinale]         VARCHAR (20)     NULL,
    [PrcScontoIncond]      VARCHAR (10)     NULL,
    [ScontoIncond]         DECIMAL (19, 6)  NULL,
    [TP_Formula_SCT]       VARCHAR (20)     NULL,
    [QtaPrezzo]            DECIMAL (16, 6)  DEFAULT ((0)) NULL,
    [TipoCalcoloPremio]    SMALLINT         DEFAULT ((0)) NULL,
    [UtenteModifica]       VARCHAR (25)     NULL,
    [DataModifica]         DATETIME         NULL,
    [TotSpeseTraspRes]     DECIMAL (19, 4)  DEFAULT ((0)) NULL,
    [TotImponibileEuro]    DECIMAL (19, 4)  DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([Uid] ASC, [SESSIONE] ASC, [Contratto] ASC, [NrRigaContributo] ASC, [NrRigaContributoPerc] ASC, [IdTesta] ASC, [IdRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ContribIncondizInElab] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ContribIncondizInElab] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ContribIncondizInElab] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ContribIncondizInElab] TO [Metodo98]
    AS [dbo];

