CREATE TABLE [dbo].[TMP_IDOK_PROPCONCILIAZ] (
    [ID]             INT             NOT NULL,
    [CONCMAN]        VARCHAR (10)    NULL,
    [STATO]          VARCHAR (10)    NULL,
    [ACC]            SMALLINT        NULL,
    [CODART]         VARCHAR (50)    NULL,
    [DESCRIZIONE]    VARCHAR (80)    NULL,
    [RIFORDINE]      VARCHAR (50)    NULL,
    [RIFPARTITA]     VARCHAR (50)    NULL,
    [MATRICOLE]      VARCHAR (20)    NULL,
    [TIPORIGA]       VARCHAR (10)    NULL,
    [DATACONSEGNA]   DATETIME        NULL,
    [DATACONSRICH]   DATETIME        NULL,
    [UM]             VARCHAR (3)     NULL,
    [QTA_ARRIVATA]   DECIMAL (16, 6) NULL,
    [QTA_INORD]      DECIMAL (16, 6) NULL,
    [QTA_ASSEGN]     DECIMAL (16, 6) NULL,
    [QTA_RES]        DECIMAL (16, 6) NULL,
    [LISTINO]        INT             NULL,
    [PREZZOUNI]      DECIMAL (19, 6) NULL,
    [SCONTO]         DECIMAL (8, 5)  NULL,
    [CODIVA]         DECIMAL (5)     NULL,
    [CONTROP]        VARCHAR (7)     NULL,
    [DATAINICOMP]    DATETIME        NULL,
    [DATAFINECOMP]   DATETIME        NULL,
    [CAUSALEMAG]     DECIMAL (5)     NULL,
    [CAUSALEMAGCOLL] DECIMAL (5)     NULL,
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
    [FLGCHECK]       SMALLINT        NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [UBICAZIONE]     VARCHAR (10)    NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TMP_IDOK_PROPCONCILIAZ] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TMP_IDOK_PROPCONCILIAZ] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TMP_IDOK_PROPCONCILIAZ] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TMP_IDOK_PROPCONCILIAZ] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TMP_IDOK_PROPCONCILIAZ] TO [Metodo98]
    AS [dbo];

