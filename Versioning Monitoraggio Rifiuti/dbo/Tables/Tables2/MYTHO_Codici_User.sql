CREATE TABLE [dbo].[MYTHO_Codici_User] (
    [CODICEMETODO]   VARCHAR (50) NOT NULL,
    [IDUSER]         BIGINT       IDENTITY (1, 1) NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) DEFAULT (user_name()) NOT NULL,
    [DATAMODIFICA]   DATETIME     DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_MYTHO_Codici_User] PRIMARY KEY CLUSTERED ([CODICEMETODO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[MYTHO_Codici_User] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MYTHO_Codici_User] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MYTHO_Codici_User] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MYTHO_Codici_User] TO [Metodo98]
    AS [dbo];

