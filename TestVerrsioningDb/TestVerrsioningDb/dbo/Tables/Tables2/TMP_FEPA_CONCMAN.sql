CREATE TABLE [dbo].[TMP_FEPA_CONCMAN] (
    [PROGRIGA]            INT             NOT NULL,
    [IDTESTA]             DECIMAL (10)    DEFAULT ((0)) NULL,
    [IDRIGA]              INT             DEFAULT ((0)) NULL,
    [TIPODOC]             VARCHAR (3)     DEFAULT ('') NULL,
    [NUMERODOC]           DECIMAL (10)    DEFAULT ((0)) NULL,
    [NUMRIFDOC]           VARCHAR (50)    DEFAULT ('') NULL,
    [DATADOC]             DATETIME        NULL,
    [DATARIFDOC]          DATETIME        NULL,
    [DATACONSEGNA]        DATETIME        NULL,
    [UMGEST]              VARCHAR (3)     DEFAULT ('') NULL,
    [QTAGEST]             DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [QTAGESTRES]          DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [QTADAPREL]           DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [NRRIFPARTITA]        VARCHAR (50)    DEFAULT ('') NULL,
    [NUMLISTINO]          DECIMAL (5)     DEFAULT ((0)) NULL,
    [PREZZOUNITLORDOEURO] DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [SCONTIESTESI]        VARCHAR (100)   DEFAULT ('') NULL,
    [CODIVA]              DECIMAL (5)     DEFAULT ((0)) NULL,
    [GENCONTROP]          VARCHAR (7)     DEFAULT ('') NULL,
    [TOTNETTORIGAEURO]    DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [CODDEPOSITO]         VARCHAR (10)    DEFAULT ('') NULL,
    [CODDEPOSITOCOLL]     VARCHAR (10)    DEFAULT ('') NULL,
    [RIFCOMMCLI]          VARCHAR (30)    DEFAULT ('') NULL,
    [CODIMBALLO]          VARCHAR (10)    DEFAULT ('') NULL,
    [NRPEZZIIMBALLO]      DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [NUMCOLLI]            DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [ANNOTAZIONI]         VARCHAR (1000)  DEFAULT ('') NULL,
    [UTENTEMODIFICA]      VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]        DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([PROGRIGA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TMP_FEPA_CONCMAN] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TMP_FEPA_CONCMAN] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TMP_FEPA_CONCMAN] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TMP_FEPA_CONCMAN] TO [Metodo98]
    AS [dbo];

