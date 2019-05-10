CREATE TABLE [dbo].[FRCScostamentiVendite] (
    [ID]                  INT             IDENTITY (1, 1) NOT NULL,
    [ANNO]                INT             NULL,
    [MESEINIZIO]          INT             NULL,
    [MESEFINE]            INT             NULL,
    [CODCLIFOR]           VARCHAR (7)     NULL,
    [DSCCONTO1]           VARCHAR (80)    NULL,
    [CODSETTORE]          DECIMAL (5)     NULL,
    [DESCSETTCLI]         VARCHAR (25)    NULL,
    [CODZONA]             DECIMAL (5)     NULL,
    [DESCZONACLI]         VARCHAR (80)    NULL,
    [CODCATEGORIA]        DECIMAL (5)     NULL,
    [DESCCATCLI]          VARCHAR (25)    NULL,
    [LOCALITA]            VARCHAR (80)    NULL,
    [PROVINCIA]           VARCHAR (4)     NULL,
    [CODNAZIONE]          DECIMAL (5)     NULL,
    [NAZIONE]             VARCHAR (80)    NULL,
    [CODICEISO]           VARCHAR (3)     NULL,
    [CODREGIONE]          VARCHAR (4)     NULL,
    [CODAGENTE1]          VARCHAR (7)     NULL,
    [DSCAGENTE1]          VARCHAR (80)    NULL,
    [CODAGENTE2]          VARCHAR (7)     NULL,
    [DSCAGENTE2]          VARCHAR (80)    NULL,
    [CODAGENTE3]          VARCHAR (7)     NULL,
    [DSCAGENTE3]          VARCHAR (80)    NULL,
    [CODART]              VARCHAR (50)    NULL,
    [DESCRIZIONE]         VARCHAR (500)   NULL,
    [ARTICOLOALTERNATIVO] VARCHAR (50)    NULL,
    [GRUPPO]              DECIMAL (5)     NULL,
    [DESCGRPART]          VARCHAR (80)    NULL,
    [CATEGORIA]           DECIMAL (5)     NULL,
    [DESCCATART]          VARCHAR (80)    NULL,
    [CODCATEGORIASTAT]    DECIMAL (5)     NULL,
    [DESCCATSTATART]      VARCHAR (80)    NULL,
    [SERIE]               VARCHAR (20)    NULL,
    [DESCSERIEART]        VARCHAR (100)   NULL,
    [MODELLO]             VARCHAR (20)    NULL,
    [DESCMODART]          VARCHAR (100)   NULL,
    [CONTOCDC]            VARCHAR (10)    NULL,
    [DESCCONTOCDC]        VARCHAR (80)    NULL,
    [CDRMercato]          VARCHAR (10)    NULL,
    [DescCDRMercato]      VARCHAR (80)    NULL,
    [CDRProdotto]         VARCHAR (10)    NULL,
    [DescCDRProdotto]     VARCHAR (80)    NULL,
    [UM_BASE]             VARCHAR (3)     NULL,
    [AMBIENTE1]           VARCHAR (3)     NULL,
    [QTABASE1]            DECIMAL (19, 6) NULL,
    [PREZZO1]             DECIMAL (19, 6) NULL,
    [TOTALENETTO1]        DECIMAL (19, 6) NULL,
    [AMBIENTE2]           VARCHAR (3)     NULL,
    [QTABASE2]            DECIMAL (19, 6) NULL,
    [PREZZO2]             DECIMAL (19, 6) NULL,
    [TOTALENETTO2]        DECIMAL (19, 6) NULL,
    [DELTATOTALE]         DECIMAL (19, 6) NULL,
    [DELTAVOLUME]         DECIMAL (19, 6) NULL,
    [DELTAPREZZO]         DECIMAL (19, 6) NULL,
    [UTENTEMODIFICA]      VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]        DATETIME        NOT NULL,
    [GENCONTROP]          VARCHAR (7)     NULL,
    [DESCGENCONTROP]      VARCHAR (80)    NULL,
    CONSTRAINT [KEY_FRCScostamentiVendite] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCScostamentiVendite] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCScostamentiVendite] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCScostamentiVendite] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCScostamentiVendite] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCScostamentiVendite] TO [Metodo98]
    AS [dbo];

