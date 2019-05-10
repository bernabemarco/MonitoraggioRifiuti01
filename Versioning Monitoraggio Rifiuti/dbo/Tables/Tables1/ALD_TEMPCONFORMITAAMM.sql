CREATE TABLE [dbo].[ALD_TEMPCONFORMITAAMM] (
    [IDSESSIONE]                 DECIMAL (5)   NOT NULL,
    [POSIZIONE]                  DECIMAL (18)  NOT NULL,
    [SPUNTA]                     SMALLINT      NULL,
    [TIPODOC]                    VARCHAR (3)   NULL,
    [NUMERODOC]                  DECIMAL (10)  NULL,
    [BIS]                        VARCHAR (1)   NULL,
    [DATADOC]                    DATETIME      NULL,
    [FLAGCONT]                   SMALLINT      NULL,
    [NUMRIF]                     VARCHAR (15)  NULL,
    [DATRIF]                     DATETIME      NULL,
    [CODCLIFOR]                  VARCHAR (7)   NULL,
    [RAGSOC]                     VARCHAR (80)  NULL,
    [ARTICOLO]                   VARCHAR (50)  NULL,
    [DESCRIZIONEART]             VARCHAR (300) NULL,
    [UMGEST]                     VARCHAR (4)   NULL,
    [QTAGEST]                    FLOAT (53)    NULL,
    [PREZZO]                     FLOAT (53)    NULL,
    [TOTNETTO]                   FLOAT (53)    NULL,
    [FLAGPREZZO]                 SMALLINT      NULL,
    [NRLISTINO]                  DECIMAL (5)   NULL,
    [IMPORTOLISTINO]             FLOAT (53)    NULL,
    [ANNOTAZIONI]                VARCHAR (300) NULL,
    [REFACQUISTI]                SMALLINT      NULL,
    [DESCREFACQUISTI]            VARCHAR (80)  NULL,
    [REFRESPCOMMESSA]            SMALLINT      NULL,
    [DESCREFRESPCOMMESSA]        VARCHAR (80)  NULL,
    [FLAGNONCONFORME]            SMALLINT      NULL,
    [RESPCONFORMITAACQ]          SMALLINT      NULL,
    [DESCRESPCONFORMITAACQUISTI] VARCHAR (80)  NULL,
    [DATACONFROMITA]             DATETIME      NULL,
    [CODPAG]                     VARCHAR (5)   NULL,
    [DESCPAG]                    VARCHAR (80)  NULL,
    [CODIVA]                     DECIMAL (5)   NULL,
    [DATACONSEGNA]               DATETIME      NULL,
    [RIFCOMMCLI]                 VARCHAR (30)  NULL,
    [STATOCOMMESSA]              SMALLINT      NULL,
    [DESCSTATOCOMMESSA]          VARCHAR (80)  NULL,
    [RIFCOMMESSASAP]             VARCHAR (1)   NULL,
    [CODASA]                     DECIMAL (5)   NULL,
    [DESCASA]                    VARCHAR (80)  NULL,
    [CODCDC]                     VARCHAR (7)   NULL,
    [DESCCODCD]                  VARCHAR (80)  NULL,
    [PORTO]                      DECIMAL (5)   NULL,
    [DESCPORTO]                  VARCHAR (80)  NULL,
    [TRASPACURA]                 DECIMAL (5)   NULL,
    [DESCTRASPROTOACURA]         VARCHAR (80)  NULL,
    [SPEDIZIONIERE]              DECIMAL (5)   NULL,
    [DESCSPEDIZIONIERE]          VARCHAR (80)  NULL,
    [FLAGMOVMAG]                 SMALLINT      NULL,
    [CODCONTROPART]              VARCHAR (7)   NULL,
    [DESCCONTROPART]             VARCHAR (80)  NULL,
    [COTROPARTSAP]               VARCHAR (10)  NULL,
    [DESCCONTROPARTSAP]          VARCHAR (80)  NULL,
    [CODSAPSTANZ]                VARCHAR (10)  NULL,
    [DIVIIONE]                   SMALLINT      NULL,
    [DESCDIVIISIONE]             VARCHAR (80)  NULL,
    [NRDESTDIV]                  DECIMAL (5)   NULL,
    [RAGSOCDEST]                 VARCHAR (80)  NULL,
    [INDIRIZZODEST]              VARCHAR (80)  NULL,
    [CAPDEST]                    VARCHAR (8)   NULL,
    [LOCALITADEST]               VARCHAR (80)  NULL,
    [PROVINCIA]                  VARCHAR (4)   NULL,
    [CODSETTOREGRIVISITE]        VARCHAR (7)   NULL,
    [CODDEPOSITO]                VARCHAR (5)   NULL,
    [CODDEPOSITOCOLL]            VARCHAR (5)   NULL,
    [CAUSALEMAG]                 DECIMAL (5)   NULL,
    [FORNPREF]                   VARCHAR (7)   NULL,
    [DESCFORNPREF]               VARCHAR (80)  NULL,
    [DATAMODIFICA]               DATETIME      NULL,
    [UTENTEMODIFICA]             VARCHAR (25)  NULL,
    [RISOLTACONFORMITA]          SMALLINT      NULL,
    [IDTESTA]                    DECIMAL (10)  NULL,
    [BLOCCASCADENZE]             SMALLINT      NULL,
    [NOTESCADENZE]               VARCHAR (100) NULL,
    [ESERCIZIO]                  DECIMAL (4)   NULL,
    CONSTRAINT [PK_ALD_TEMPCONFORMITAAMM] PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [POSIZIONE] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TEMPCONFORMITAAMM] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TEMPCONFORMITAAMM] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TEMPCONFORMITAAMM] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TEMPCONFORMITAAMM] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TEMPCONFORMITAAMM] TO [Metodo98]
    AS [dbo];

