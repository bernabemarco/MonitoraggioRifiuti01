CREATE TABLE [dbo].[FETS_STATIWSDETTAGLIO] (
    [Progressivo]    VARCHAR (50)   NOT NULL,
    [Sessione]       DECIMAL (5)    NOT NULL,
    [Data]           DATETIME       NOT NULL,
    [Evento]         VARCHAR (100)  NOT NULL,
    [Descrizione]    VARCHAR (1000) DEFAULT ('') NULL,
    [OrigineLog]     VARCHAR (200)  DEFAULT ('') NOT NULL,
    [Utentemodifica] VARCHAR (25)   NOT NULL,
    [Datamodifica]   DATETIME       NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FETS_STATIWSDETTAGLIO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FETS_STATIWSDETTAGLIO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FETS_STATIWSDETTAGLIO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FETS_STATIWSDETTAGLIO] TO [Metodo98]
    AS [dbo];

