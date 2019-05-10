CREATE TABLE [dbo].[CCT_PARAMETRI_GENERALI] (
    [Progressivo]       DECIMAL (5)   NOT NULL,
    [IndirizzoHost]     VARCHAR (500) NULL,
    [Username]          VARCHAR (25)  NULL,
    [Password]          VARCHAR (25)  NULL,
    [PathFilesDownload] VARCHAR (150) NULL,
    [Utentemodifica]    VARCHAR (25)  NOT NULL,
    [Datamodifica]      DATETIME      NOT NULL,
    [PathFilesUpload]   VARCHAR (150) DEFAULT ('') NULL,
    [MaxTentativi]      SMALLINT      DEFAULT ((0)) NULL,
    [EnabledRemoteSign] SMALLINT      DEFAULT ((0)) NOT NULL,
    [UsernameRS]        VARCHAR (25)  DEFAULT ('') NOT NULL,
    [PasswordRS]        VARCHAR (25)  DEFAULT ('') NOT NULL,
    [DeviceRS]          VARCHAR (250) DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_CCT_PARAMETRI_GENERALI] PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CCT_PARAMETRI_GENERALI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CCT_PARAMETRI_GENERALI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CCT_PARAMETRI_GENERALI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CCT_PARAMETRI_GENERALI] TO [Metodo98]
    AS [dbo];

