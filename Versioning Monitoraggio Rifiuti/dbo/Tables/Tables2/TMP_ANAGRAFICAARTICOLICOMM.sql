CREATE TABLE [dbo].[TMP_ANAGRAFICAARTICOLICOMM] (
    [CODICEART]                   VARCHAR (50)    NOT NULL,
    [ESERCIZIO]                   DECIMAL (5)     NOT NULL,
    [CODIVA]                      DECIMAL (5)     NULL,
    [SCONTO1]                     VARCHAR (10)    NULL,
    [SCONTO2]                     VARCHAR (10)    NULL,
    [SCONTO3]                     VARCHAR (10)    NULL,
    [GRUPPOPRZPART]               DECIMAL (5)     NULL,
    [GRUPPOPRVPART]               DECIMAL (5)     NULL,
    [PROVV]                       VARCHAR (10)    NULL,
    [BARCODE]                     VARCHAR (50)    NULL,
    [BARCODETYPE]                 SMALLINT        NULL,
    [BARCODESTRING]               VARCHAR (80)    NULL,
    [CODICEALT1]                  VARCHAR (50)    NULL,
    [CODICEALT2]                  VARCHAR (50)    NULL,
    [SCGENVENDITEITA]             VARCHAR (7)     NULL,
    [SCGENVENDITEEST]             VARCHAR (7)     NULL,
    [SCGENACQUISTIITA]            VARCHAR (7)     NULL,
    [SCGENACQUISTIEST]            VARCHAR (7)     NULL,
    [INESAURIMENTO]               SMALLINT        NULL,
    [ESAURITO]                    SMALLINT        NULL,
    [QTAMINCONS]                  DECIMAL (16, 6) NULL,
    [USAPREZZIPART]               SMALLINT        NULL,
    [UTENTEMODIFICA]              VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]                DATETIME        NOT NULL,
    [FlagCauzioni]                SMALLINT        NOT NULL,
    [FLGBARCODEGENDAPROCAUTOMSTD] SMALLINT        NULL,
    [OLDBARCODE]                  VARCHAR (50)    NULL,
    [OLDBARCODETYPE]              SMALLINT        NULL,
    [OLDBARCODESTRING]            VARCHAR (80)    NULL,
    [PEZZIPERPALLET]              DECIMAL (16, 6) NULL,
    [EXPORTECOMMERCE]             SMALLINT        NULL,
    [CODIVAINTRA]                 DECIMAL (5)     NULL,
    PRIMARY KEY CLUSTERED ([CODICEART] ASC, [ESERCIZIO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TMP_ANAGRAFICAARTICOLICOMM] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TMP_ANAGRAFICAARTICOLICOMM] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TMP_ANAGRAFICAARTICOLICOMM] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TMP_ANAGRAFICAARTICOLICOMM] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TMP_ANAGRAFICAARTICOLICOMM] TO [Metodo98]
    AS [dbo];

