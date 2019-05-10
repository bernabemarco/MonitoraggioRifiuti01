CREATE TABLE [dbo].[GEMPLUS_TabPosizioniGemmaPlus] (
    [IDCONTRATTO]        VARCHAR (13)  NOT NULL,
    [SEZIONECONTRATTO]   DECIMAL (5)   NOT NULL,
    [POSCLIENTE]         VARCHAR (10)  NOT NULL,
    [idTipologMezzo]     DECIMAL (5)   NOT NULL,
    [UBICAZIONE]         VARCHAR (50)  NULL,
    [DISATTIVA]          SMALLINT      DEFAULT ((0)) NULL,
    [CodBarrePosCliente] VARCHAR (50)  NULL,
    [NOTE]               VARCHAR (100) NULL,
    [UTENTEMODIFICA]     VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]       DATETIME      NOT NULL,
    CONSTRAINT [GEMPLUS_TabPosizioniGemmaPlus_PK] PRIMARY KEY CLUSTERED ([IDCONTRATTO] ASC, [SEZIONECONTRATTO] ASC, [POSCLIENTE] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEMPLUS_TabPosizioniGemmaPlus] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEMPLUS_TabPosizioniGemmaPlus] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEMPLUS_TabPosizioniGemmaPlus] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEMPLUS_TabPosizioniGemmaPlus] TO [Metodo98]
    AS [dbo];

