CREATE TABLE [dbo].[FP_LISTA_ESITI_DWN_TMP] (
    [IDSESSIONE]       DECIMAL (5)     NOT NULL,
    [ProgressivoWS]    DECIMAL (10)    NOT NULL,
    [ProgressivoSDI]   VARCHAR (100)   NOT NULL,
    [Anno]             DECIMAL (5)     NOT NULL,
    [Numero]           VARCHAR (50)    NOT NULL,
    [Denominazione]    VARCHAR (250)   NOT NULL,
    [NomeFile]         VARCHAR (100)   NOT NULL,
    [DimensioneFile]   DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [CodStatoWorkflow] DECIMAL (5)     NOT NULL,
    [Utentemodifica]   VARCHAR (25)    NOT NULL,
    [Datamodifica]     DATETIME        NOT NULL,
    CONSTRAINT [PK_FP_LISTA_ESITI_DWN_TMP] PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [ProgressivoWS] ASC, [ProgressivoSDI] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FP_LISTA_ESITI_DWN_TMP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FP_LISTA_ESITI_DWN_TMP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FP_LISTA_ESITI_DWN_TMP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FP_LISTA_ESITI_DWN_TMP] TO [Metodo98]
    AS [dbo];

