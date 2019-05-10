CREATE TABLE [dbo].[ALD_TabStoricoValutazioneFornitori] (
    [ESERCIZIO]        DECIMAL (5)     NOT NULL,
    [CODCONTO]         VARCHAR (7)     NOT NULL,
    [idTipologiaFor]   SMALLINT        NULL,
    [TipoFornitura]    VARCHAR (50)    NULL,
    [idValutazioneFor] SMALLINT        NULL,
    [DtUltimaVal]      DATETIME        NULL,
    [TotalePunteggio]  SMALLINT        DEFAULT ((0)) NULL,
    [Prezzi]           SMALLINT        DEFAULT ((0)) NULL,
    [Qualita]          SMALLINT        DEFAULT ((0)) NULL,
    [Pagamenti]        SMALLINT        DEFAULT ((0)) NULL,
    [Disponibilita]    SMALLINT        DEFAULT ((0)) NULL,
    [Puntualita]       SMALLINT        DEFAULT ((0)) NULL,
    [Iso]              SMALLINT        DEFAULT ((0)) NULL,
    [TotaleFatturato]  DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [CODPAG]           VARCHAR (4)     NULL,
    [UTENTEMODIFICA]   VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]     DATETIME        NOT NULL,
    CONSTRAINT [ALD_TabStoricoValutazioneFornitori_PK] PRIMARY KEY CLUSTERED ([ESERCIZIO] ASC, [CODCONTO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TabStoricoValutazioneFornitori] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TabStoricoValutazioneFornitori] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TabStoricoValutazioneFornitori] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TabStoricoValutazioneFornitori] TO [Metodo98]
    AS [dbo];

