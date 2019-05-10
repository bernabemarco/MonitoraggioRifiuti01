CREATE TABLE [dbo].[Vista_CondizListPromo] (
    [sessione]         DECIMAL (10)    NOT NULL,
    [articolo]         VARCHAR (50)    NOT NULL,
    [data]             DATETIME        NOT NULL,
    [descrizione]      VARCHAR (80)    NOT NULL,
    [um]               VARCHAR (3)     NOT NULL,
    [prezzo]           DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [sconto]           VARCHAR (100)   DEFAULT ('') NOT NULL,
    [prezzonetto]      DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [campagnapromo]    VARCHAR (50)    DEFAULT ('') NOT NULL,
    [descrizionepromo] VARCHAR (100)   DEFAULT ('') NOT NULL,
    [tipopromo]        VARCHAR (30)    DEFAULT ('') NOT NULL,
    [dadata]           VARCHAR (10)    DEFAULT ('') NOT NULL,
    [adata]            VARCHAR (10)    DEFAULT ('') NOT NULL,
    [condizioni]       VARCHAR (MAX)   DEFAULT ('') NOT NULL,
    [CLIFOR]           VARCHAR (7)     NULL,
    [RAGIONESOCIALE]   VARCHAR (80)    NULL,
    [CLIFORDD]         VARCHAR (7)     NULL,
    [RAGIONESOCIALEDD] VARCHAR (80)    NULL,
    PRIMARY KEY CLUSTERED ([sessione] ASC, [articolo] ASC, [data] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Vista_CondizListPromo] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Vista_CondizListPromo] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Vista_CondizListPromo] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Vista_CondizListPromo] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Vista_CondizListPromo] TO [Metodo98]
    AS [dbo];

