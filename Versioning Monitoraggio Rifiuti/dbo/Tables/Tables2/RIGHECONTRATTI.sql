CREATE TABLE [dbo].[RIGHECONTRATTI] (
    [DATABASE_NAME]             NVARCHAR (128)  NULL,
    [ESERCIZIO]                 DECIMAL (5)     NOT NULL,
    [TIPODOC]                   VARCHAR (3)     NOT NULL,
    [DATADOC]                   DATETIME        NULL,
    [GGDATADOC]                 INT             NULL,
    [IDTESTA]                   DECIMAL (10)    NOT NULL,
    [IDRIGA]                    INT             NOT NULL,
    [KEYIDTIDR]                 BIGINT          NOT NULL,
    [TIPORIGA]                  CHAR (1)        NOT NULL,
    [CLIENTE]                   VARCHAR (7)     NULL,
    [IDCODCLIFOR_ORIGINE]       VARBINARY (30)  NULL,
    [IDCODCLIFOR_ORIGINE_FATT]  VARBINARY (30)  NULL,
    [IDDESTINAZIONECLI_ORIGINE] DECIMAL (5)     NULL,
    [AGENTE1]                   VARCHAR (7)     NULL,
    [AGENTE2]                   VARCHAR (7)     NULL,
    [AGENTE3]                   VARCHAR (7)     NULL,
    [IMPONIBILE_DOCUMENTO]      DECIMAL (19, 4) NOT NULL,
    [CODICEARTICOLO]            VARCHAR (50)    NULL,
    [GRUPPO]                    DECIMAL (5)     NULL,
    [CATEGORIA]                 DECIMAL (5)     NULL,
    [CATEGORIA_STATISTICA]      DECIMAL (5)     NULL,
    [GRUPPO_PREZZI]             DECIMAL (5)     NULL,
    [FAMIGLIA]                  DECIMAL (5)     NULL,
    [REPARTO]                   DECIMAL (5)     NULL,
    [UMGEST]                    VARCHAR (3)     NOT NULL,
    [QTA]                       DECIMAL (16, 6) NOT NULL,
    [PREZZOUNITLORDO]           DECIMAL (19, 6) NOT NULL,
    [SCONTORIGA]                DECIMAL (19, 6) NOT NULL,
    [FORMULA_SCONTI_ACQ]        VARCHAR (20)    NULL,
    [IMPORTORIGA]               DECIMAL (19, 4) NOT NULL,
    [SCONTOFINALE]              VARCHAR (20)    NULL,
    [PRCSCONTOINCOND]           VARCHAR (10)    NULL,
    [SCONTOINCOND]              DECIMAL (19, 6) NULL,
    [QTAPREZZO]                 DECIMAL (16, 6) NOT NULL,
    [SEGNO]                     SMALLINT        NOT NULL,
    [USER_INS]                  VARCHAR (100)   CONSTRAINT [DF_righecontratti_USER_INS] DEFAULT (user_name()) NOT NULL,
    [TIMEINS]                   DATETIME        CONSTRAINT [DF_righecontratti_TIMEINS] DEFAULT (getdate()) NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[RIGHECONTRATTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[RIGHECONTRATTI] TO [Metodo98]
    AS [dbo];

