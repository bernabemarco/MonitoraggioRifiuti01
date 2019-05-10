CREATE TABLE [dbo].[Mytho_VirtualUser] (
    [CODCLIFOR]           VARCHAR (15) NOT NULL,
    [CODCONTO]            VARCHAR (7)  NOT NULL,
    [LISTINO]             DECIMAL (5)  NOT NULL,
    [USAPRZCOMMERCIALI]   SMALLINT     NULL,
    [UsaPrzPrvPart]       SMALLINT     NULL,
    [CodGruppoPrezziPart] DECIMAL (5)  NULL,
    [CodSettore]          DECIMAL (5)  NULL,
    [CodZona]             DECIMAL (5)  NULL,
    [CodCategoria]        DECIMAL (5)  NULL,
    [Sconto1]             VARCHAR (10) NULL,
    [ApplScontoRiga]      VARCHAR (10) NULL,
    [ApplScontoFinale]    VARCHAR (6)  NULL,
    [UTENTEMODIFICA]      VARCHAR (25) NOT NULL,
    [DATAMODIFICA]        DATETIME     NOT NULL,
    CONSTRAINT [PK_Mytho_VirtualUser_CODCLIFOR] PRIMARY KEY CLUSTERED ([CODCONTO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Mytho_VirtualUser] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Mytho_VirtualUser] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Mytho_VirtualUser] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Mytho_VirtualUser] TO [Metodo98]
    AS [dbo];

