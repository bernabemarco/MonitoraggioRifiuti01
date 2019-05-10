CREATE TABLE [dbo].[FP_LISTA_ESITI] (
    [Progressivo]      DECIMAL (10)   NOT NULL,
    [ProgressivoWS]    DECIMAL (10)   NOT NULL,
    [ProgressivoSDI]   VARCHAR (100)  NOT NULL,
    [ProgressivoDOC]   DECIMAL (10)   NOT NULL,
    [Anno]             DECIMAL (5)    NOT NULL,
    [Numero]           VARCHAR (50)   NOT NULL,
    [Denominazione]    VARCHAR (250)  NOT NULL,
    [NomeFile]         VARCHAR (100)  NOT NULL,
    [Esito]            VARCHAR (5)    DEFAULT ('') NOT NULL,
    [MsgEsito]         VARCHAR (1000) DEFAULT ('') NOT NULL,
    [CodStatoWorkflow] DECIMAL (5)    NOT NULL,
    [Utentemodifica]   VARCHAR (25)   NOT NULL,
    [Datamodifica]     DATETIME       NOT NULL,
    CONSTRAINT [PK_FP_LISTA_ESITI] PRIMARY KEY CLUSTERED ([ProgressivoWS] ASC, [ProgressivoSDI] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FP_LISTA_ESITI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FP_LISTA_ESITI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FP_LISTA_ESITI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FP_LISTA_ESITI] TO [Metodo98]
    AS [dbo];

