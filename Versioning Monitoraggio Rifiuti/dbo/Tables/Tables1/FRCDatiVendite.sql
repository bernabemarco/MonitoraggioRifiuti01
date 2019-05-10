CREATE TABLE [dbo].[FRCDatiVendite] (
    [ID]                 INT              IDENTITY (1, 1) NOT NULL,
    [AMBIENTE]           VARCHAR (3)      NULL,
    [ANNODOC]            INT              NULL,
    [MESEDOC]            INT              NULL,
    [ANNOMESEDOC]        VARCHAR (21)     NULL,
    [TIPOCONTO]          CHAR (1)         NULL,
    [CODCLIFOR]          VARCHAR (7)      NULL,
    [DSCCONTO1]          VARCHAR (80)     NULL,
    [CLIENTE]            VARCHAR (90)     NULL,
    [CODSETTORE]         DECIMAL (5)      NULL,
    [DESCSETTCLI]        VARCHAR (25)     NULL,
    [CODZONA]            DECIMAL (5)      NULL,
    [DESCZONACLI]        VARCHAR (80)     NULL,
    [CODCATEGORIA]       DECIMAL (5)      NULL,
    [DESCCATCLI]         VARCHAR (25)     NULL,
    [LOCALITA]           VARCHAR (80)     NULL,
    [PROVINCIA]          VARCHAR (4)      NULL,
    [CODNAZIONE]         DECIMAL (5)      NULL,
    [CODICEISO]          VARCHAR (3)      NULL,
    [CODREGIONE]         VARCHAR (4)      NULL,
    [CODAGENTE1]         VARCHAR (7)      NULL,
    [DSCAGENTE1]         VARCHAR (80)     NULL,
    [AGENTE1]            VARCHAR (90)     NULL,
    [CODAGENTE2]         VARCHAR (7)      NULL,
    [DSCAGENTE2]         VARCHAR (80)     NULL,
    [AGENTE2]            VARCHAR (90)     NULL,
    [CODAGENTE3]         VARCHAR (7)      NULL,
    [DSCAGENTE3]         VARCHAR (80)     NULL,
    [AGENTE3]            VARCHAR (90)     NULL,
    [TOTSPESETRASP]      DECIMAL (19, 6)  NULL,
    [CODART]             VARCHAR (50)     NULL,
    [DESCRIZIONE]        VARCHAR (500)    NULL,
    [ARTICOLO]           VARCHAR (203)    NULL,
    [GRUPPO]             DECIMAL (5)      NULL,
    [DESCGRPART]         VARCHAR (80)     NULL,
    [CATEGORIA]          DECIMAL (5)      NULL,
    [DESCCATART]         VARCHAR (80)     NULL,
    [CODCATEGORIASTAT]   DECIMAL (5)      NULL,
    [DESCCATSTATART]     VARCHAR (80)     NULL,
    [SERIE]              VARCHAR (20)     NULL,
    [DESCSERIEART]       VARCHAR (100)    NULL,
    [MODELLO]            VARCHAR (20)     NULL,
    [DESCMODART]         VARCHAR (100)    NULL,
    [PESONETTO]          DECIMAL (16, 6)  NULL,
    [SUPERFICIE]         DECIMAL (16, 6)  NULL,
    [CUBATURA]           DECIMAL (16, 6)  NULL,
    [NRPEZZIIMBALLO]     DECIMAL (16, 6)  NULL,
    [RIFERIMIMBALLO]     VARCHAR (10)     NULL,
    [UM_VENDITA]         VARCHAR (3)      NULL,
    [UM_BASE]            VARCHAR (3)      NULL,
    [FATTORE]            DECIMAL (20, 10) NULL,
    [TIPOUM]             DECIMAL (5)      NULL,
    [UMGEST]             VARCHAR (3)      NULL,
    [QTAGEST]            DECIMAL (19, 6)  NULL,
    [UMPREZZO]           VARCHAR (3)      NULL,
    [QTAPREZZO]          DECIMAL (19, 6)  NULL,
    [CODIVA]             DECIMAL (5)      NULL,
    [DESCIVA]            VARCHAR (25)     NULL,
    [ALIQUOTA]           DECIMAL (8, 5)   NULL,
    [INDETRAIBILITA]     DECIMAL (8, 5)   NULL,
    [TOTLORDORIGAEURO]   DECIMAL (19, 6)  NULL,
    [TOTSCONTORIGAEURO]  DECIMAL (19, 6)  NULL,
    [TOTNETTORIGAEURO]   DECIMAL (19, 6)  NULL,
    [TOTPROVVAGEURO1]    DECIMAL (19, 6)  NULL,
    [PERCPROVVAGEURO1]   DECIMAL (19, 6)  NULL,
    [TOTPROVVAGEURO2]    DECIMAL (19, 6)  NULL,
    [PERCPROVVAGEURO2]   DECIMAL (19, 6)  NULL,
    [TOTPROVVAGEURO3]    DECIMAL (19, 6)  NULL,
    [PERCPROVVAGEURO3]   DECIMAL (19, 6)  NULL,
    [GENCONTROP]         VARCHAR (7)      NULL,
    [DESCGENCONTROP]     VARCHAR (80)     NULL,
    [CODMASTRO]          DECIMAL (5)      NULL,
    [TIPOMASTRO]         CHAR (1)         NULL,
    [CONTOCDC]           VARCHAR (10)     NULL,
    [NAZIONE]            VARCHAR (80)     NULL,
    [UTENTEMODIFICA]     VARCHAR (25)     NOT NULL,
    [DATAMODIFICA]       DATETIME         NOT NULL,
    [CDRMercato]         VARCHAR (10)     NULL,
    [CDRProdotto]        VARCHAR (10)     NULL,
    [RIFCOMMCLI]         VARCHAR (30)     NULL,
    [RIFCOMMRIEP]        VARCHAR (30)     NULL,
    [MESEDOCUMENTO]      INT              NULL,
    [TipoClienteBudget]  VARCHAR (5)      NULL,
    [ANNOCOMPETENZA]     INT              NULL,
    [ANNOMESECOMPETENZA] VARCHAR (21)     NULL,
    CONSTRAINT [KEY_FRCDatiVendite] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCDatiVendite] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCDatiVendite] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCDatiVendite] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCDatiVendite] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCDatiVendite] TO [Metodo98]
    AS [dbo];

