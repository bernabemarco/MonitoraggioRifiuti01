CREATE TABLE [dbo].[MYTHO_Parametri] (
    [Progressivo]         DECIMAL (10) NOT NULL,
    [APPID]               VARCHAR (50) NULL,
    [TOKEN]               VARCHAR (50) NULL,
    [CODDEPOSITO_EXP]     VARCHAR (10) NULL,
    [CODDEPOSITO_IMP]     VARCHAR (10) NULL,
    [TIPODOC_IMP]         VARCHAR (3)  NULL,
    [CODCONTO_IMP]        VARCHAR (7)  NULL,
    [SKU_AUTO]            SMALLINT     DEFAULT ((0)) NOT NULL,
    [SKU_CODICECONTATORE] DECIMAL (5)  NULL,
    [SKU_LUNGHEZZA]       SMALLINT     NULL,
    [SKU_RIEMPIMENTO]     VARCHAR (1)  NULL,
    [TIPOUM]              DECIMAL (5)  NULL,
    [UtenteModifica]      VARCHAR (25) DEFAULT (user_name()) NOT NULL,
    [DataModifica]        DATETIME     DEFAULT (getdate()) NOT NULL,
    [SKU_PROGRESSIVO]     DECIMAL (10) NULL,
    [MAPPING_ARTICOLI]    DECIMAL (10) NULL,
    [MAPPING_CLIENTI]     DECIMAL (10) NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[MYTHO_Parametri] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MYTHO_Parametri] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MYTHO_Parametri] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MYTHO_Parametri] TO [Metodo98]
    AS [dbo];

