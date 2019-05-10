CREATE TABLE [dbo].[EC_TipiInvio] (
    [Codice]         VARCHAR (5)  NOT NULL,
    [Descrizione]    VARCHAR (50) NULL,
    [Utentemodifica] VARCHAR (25) NOT NULL,
    [Datamodifica]   DATETIME     NOT NULL,
    [GestioneSIA]    SMALLINT     DEFAULT ((0)) NULL,
    [GestioneTRS]    SMALLINT     DEFAULT ((0)) NULL,
    CONSTRAINT [PK_EC_TipiInvio] PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EC_TipiInvio] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EC_TipiInvio] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EC_TipiInvio] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EC_TipiInvio] TO [Metodo98]
    AS [dbo];

