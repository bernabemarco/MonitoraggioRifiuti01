CREATE TABLE [dbo].[TABSPEDIZ] (
    [CODICE]               DECIMAL (5)     NOT NULL,
    [RAGIONESOCIALE]       VARCHAR (80)    NULL,
    [INDIRIZZO]            VARCHAR (80)    NULL,
    [CAP]                  VARCHAR (8)     NULL,
    [LOCALITA]             VARCHAR (80)    NULL,
    [PROVINCIA]            VARCHAR (4)     NULL,
    [CODICEIVA]            DECIMAL (5)     NULL,
    [SPTRASPORTO]          DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [SPPERCOLLO]           DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [PRCADDEBITO]          VARCHAR (10)    NULL,
    [ADDEBITOPERPESO]      DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [UTENTEMODIFICA]       VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]         DATETIME        NOT NULL,
    [TP_Piattaforma]       SMALLINT        NULL,
    [PartitaIva]           VARCHAR (50)    DEFAULT ('') NULL,
    [NumeroIscrizioneAlbo] VARCHAR (50)    DEFAULT ('') NULL,
    [RifTelefono]          VARCHAR (100)   DEFAULT ('') NULL,
    [CODNAZIONE]           DECIMAL (5)     DEFAULT ((0)) NULL,
    [NUMALBOTR]            VARCHAR (30)    NULL,
    [SCHEDATR]             SMALLINT        DEFAULT ((1)) NULL,
    [TELEFONO]             VARCHAR (25)    NULL,
    [EMAIL]                VARCHAR (50)    NULL,
    CONSTRAINT [PK_TABSPEDIZ] PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [DSCSPEDIZIONIERE]
    ON [dbo].[TABSPEDIZ]([RAGIONESOCIALE] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABSPEDIZ] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABSPEDIZ] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABSPEDIZ] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABSPEDIZ] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABSPEDIZ] TO [Metodo98]
    AS [dbo];

