CREATE TABLE [dbo].[FETS_LOGDOCUMENTI] (
    [GuidRow]        VARCHAR (50)  NOT NULL,
    [HubFile]        VARCHAR (50)  NOT NULL,
    [Tipo]           SMALLINT      DEFAULT ((0)) NOT NULL,
    [Evento]         VARCHAR (200) NOT NULL,
    [Anomalia]       VARCHAR (200) NOT NULL,
    [NomeFile]       VARCHAR (250) NOT NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([GuidRow] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FETS_LOGDOCUMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FETS_LOGDOCUMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FETS_LOGDOCUMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FETS_LOGDOCUMENTI] TO [Metodo98]
    AS [dbo];

