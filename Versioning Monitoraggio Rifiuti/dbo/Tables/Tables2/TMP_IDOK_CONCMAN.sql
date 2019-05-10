CREATE TABLE [dbo].[TMP_IDOK_CONCMAN] (
    [ID]             INT             NOT NULL,
    [NUMDOC]         VARCHAR (50)    NULL,
    [DATACONSEGNA]   DATETIME        NULL,
    [QTA_INORD]      DECIMAL (16, 6) NULL,
    [QTA_INPUT]      DECIMAL (16, 6) NULL,
    [UM]             VARCHAR (3)     NULL,
    [RIFPARTITA]     VARCHAR (50)    NULL,
    [LISTINO]        INT             NULL,
    [PREZZOUNI]      DECIMAL (19, 6) NULL,
    [SCONTO]         DECIMAL (8, 5)  NULL,
    [CODIVA]         DECIMAL (5)     NULL,
    [CONTROP]        VARCHAR (7)     NULL,
    [DATAINICOMP]    DATETIME        NULL,
    [DATAFINECOMP]   DATETIME        NULL,
    [MAGAZZINO]      VARCHAR (10)    NULL,
    [MAGCOLL]        VARCHAR (10)    NULL,
    [RIFCOMMCLI]     VARCHAR (20)    NULL,
    [CODNODO]        VARCHAR (20)    NULL,
    [STATORIP]       VARCHAR (10)    NULL,
    [NOMENCL]        VARCHAR (20)    NULL,
    [PROVINTRA]      VARCHAR (3)     NULL,
    [ORIGINTRA]      VARCHAR (2)     NULL,
    [IMBALLO]        VARCHAR (10)    NULL,
    [NRPZIMBALLO]    INT             NULL,
    [NRCOLLI]        INT             NULL,
    [ANNOTAZIONI]    VARCHAR (1000)  NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TMP_IDOK_CONCMAN] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TMP_IDOK_CONCMAN] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TMP_IDOK_CONCMAN] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TMP_IDOK_CONCMAN] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TMP_IDOK_CONCMAN] TO [Metodo98]
    AS [dbo];

