CREATE TABLE [dbo].[ALD_TabTEMPValutazioneFornitori] (
    [ESERCIZIO]        DECIMAL (5)     NOT NULL,
    [CODCONTO]         VARCHAR (7)     NOT NULL,
    [CODCATEGORIA]     DECIMAL (5)     NULL,
    [idTipologiaFor]   SMALLINT        NULL,
    [TipoFornitura]    VARCHAR (50)    NULL,
    [idValutazioneFor] SMALLINT        NULL,
    [DtUltimaVal]      DATETIME        NULL,
    [DtCreazione]      DATETIME        NULL,
    [TotalePunteggio]  SMALLINT        NULL,
    [Prezzi]           SMALLINT        DEFAULT ((0)) NULL,
    [Qualita]          SMALLINT        DEFAULT ((0)) NULL,
    [Pagamenti]        SMALLINT        DEFAULT ((0)) NULL,
    [Disponibilita]    SMALLINT        DEFAULT ((0)) NULL,
    [Puntualita]       SMALLINT        DEFAULT ((0)) NULL,
    [Iso]              SMALLINT        DEFAULT ((0)) NULL,
    [TotaleFatturato]  DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [CODPAG]           VARCHAR (4)     NULL,
    [NOTE]             VARCHAR (255)   NULL,
    [UTENTEMODIFICA]   VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]     DATETIME        NOT NULL,
    [Aggiorna]         SMALLINT        DEFAULT ((0)) NULL,
    CONSTRAINT [ALD_TabTEMPValutazioneFornitori_PK] PRIMARY KEY CLUSTERED ([ESERCIZIO] ASC, [CODCONTO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TabTEMPValutazioneFornitori] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TabTEMPValutazioneFornitori] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TabTEMPValutazioneFornitori] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TabTEMPValutazioneFornitori] TO [Metodo98]
    AS [dbo];

