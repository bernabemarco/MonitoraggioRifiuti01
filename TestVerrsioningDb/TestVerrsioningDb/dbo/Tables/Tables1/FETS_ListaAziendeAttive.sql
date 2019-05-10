CREATE TABLE [dbo].[FETS_ListaAziendeAttive] (
    [CODICEFISCALEPARTITAIVA] VARCHAR (16)  NOT NULL,
    [CODCONTO]                VARCHAR (7)   NOT NULL,
    [Stato]                   SMALLINT      DEFAULT ((0)) NOT NULL,
    [TipoInstradamento]       SMALLINT      DEFAULT ((0)) NOT NULL,
    [DatiWS]                  VARCHAR (MAX) DEFAULT ('') NULL,
    [DatamodificaWS]          DATETIME      NOT NULL,
    [Utentemodifica]          VARCHAR (25)  NOT NULL,
    [Datamodifica]            DATETIME      NOT NULL,
    [TIPOINVIO]               SMALLINT      DEFAULT ((4)) NOT NULL,
    PRIMARY KEY CLUSTERED ([CODICEFISCALEPARTITAIVA] ASC, [CODCONTO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FETS_ListaAziendeAttive] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FETS_ListaAziendeAttive] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FETS_ListaAziendeAttive] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FETS_ListaAziendeAttive] TO [Metodo98]
    AS [dbo];

