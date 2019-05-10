CREATE TABLE [dbo].[EC_ParametriMB] (
    [Progressivo]          DECIMAL (5)  NOT NULL,
    [CodProfessionista]    VARCHAR (50) NULL,
    [CodSIA]               VARCHAR (5)  DEFAULT ('') NOT NULL,
    [CodTipoInvio]         VARCHAR (5)  DEFAULT ('') NOT NULL,
    [CfOPiva]              VARCHAR (16) DEFAULT ('') NOT NULL,
    [TipoSincronizzazione] SMALLINT     DEFAULT ((0)) NOT NULL,
    [Attiva]               SMALLINT     DEFAULT ((0)) NOT NULL,
    [Utentemodifica]       VARCHAR (25) NOT NULL,
    [Datamodifica]         DATETIME     NOT NULL,
    CONSTRAINT [PK_EC_ParametriMB] PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EC_ParametriMB] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EC_ParametriMB] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EC_ParametriMB] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EC_ParametriMB] TO [Metodo98]
    AS [dbo];

