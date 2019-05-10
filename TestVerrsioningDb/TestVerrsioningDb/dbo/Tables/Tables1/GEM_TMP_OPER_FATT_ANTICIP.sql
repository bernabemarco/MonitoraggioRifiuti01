CREATE TABLE [dbo].[GEM_TMP_OPER_FATT_ANTICIP] (
    [PROGRESSIVO]               INT          IDENTITY (1, 1) NOT NULL,
    [IDSESSIONE]                INT          DEFAULT ((0)) NOT NULL,
    [IDRAPPORTO]                VARCHAR (14) NOT NULL,
    [idAttivita]                DECIMAL (5)  NOT NULL,
    [idTipologMezzo]            DECIMAL (5)  NOT NULL,
    [IDCONTRATTO]               VARCHAR (13) NOT NULL,
    [SEZIONECONTRATTO]          DECIMAL (5)  NOT NULL,
    [IdRigaMezzo]               DECIMAL (5)  NOT NULL,
    [AttivitaAncoraDaFatturare] DECIMAL (5)  NOT NULL,
    CONSTRAINT [GEM_TMP_OPER_FATT_ANTICIP_PK] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_TMP_OPER_FATT_ANTICIP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_TMP_OPER_FATT_ANTICIP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_TMP_OPER_FATT_ANTICIP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_TMP_OPER_FATT_ANTICIP] TO [Metodo98]
    AS [dbo];

