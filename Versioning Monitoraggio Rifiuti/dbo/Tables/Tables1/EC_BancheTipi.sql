CREATE TABLE [dbo].[EC_BancheTipi] (
    [CodBanca]       VARCHAR (7)  NOT NULL,
    [CodTipoInvio]   VARCHAR (5)  DEFAULT ('') NOT NULL,
    [Utentemodifica] VARCHAR (25) NOT NULL,
    [Datamodifica]   DATETIME     NOT NULL,
    CONSTRAINT [PK_EC_BancheTipi] PRIMARY KEY CLUSTERED ([CodBanca] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EC_BancheTipi] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EC_BancheTipi] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EC_BancheTipi] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EC_BancheTipi] TO [Metodo98]
    AS [dbo];

