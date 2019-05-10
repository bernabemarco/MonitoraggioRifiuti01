CREATE TABLE [dbo].[Ald_TabDivisioni] (
    [IdDivisione]               SMALLINT     NOT NULL,
    [DscDivisione]              VARCHAR (80) NULL,
    [RagSociale]                VARCHAR (80) NULL,
    [Indirizzo]                 VARCHAR (80) NULL,
    [CAP]                       VARCHAR (8)  NULL,
    [LOCALITA]                  VARCHAR (80) NULL,
    [PROVINCIA]                 VARCHAR (4)  NULL,
    [CODNAZIONE]                DECIMAL (5)  NULL,
    [TELEFONO]                  VARCHAR (25) NULL,
    [FAX]                       VARCHAR (25) NULL,
    [Email]                     VARCHAR (80) NULL,
    [FLGLogo]                   SMALLINT     NULL,
    [FLGSedePrincipale]         SMALLINT     NULL,
    [FLGEscludiDerogaParametri] SMALLINT     NULL,
    [UTENTEMODIFICA]            VARCHAR (25) NOT NULL,
    [DATAMODIFICA]              DATETIME     NOT NULL,
    CONSTRAINT [PK_Ald_TabDivisioni] PRIMARY KEY CLUSTERED ([IdDivisione] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Ald_TabDivisioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Ald_TabDivisioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_TabDivisioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Ald_TabDivisioni] TO [Metodo98]
    AS [dbo];

