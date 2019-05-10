CREATE TABLE [dbo].[TMPORDINIECOM] (
    [ID_VENDITA]     DECIMAL (10)    NOT NULL,
    [DATA]           DATETIME        NOT NULL,
    [ID_RIGA]        DECIMAL (10)    NOT NULL,
    [PRODOTTO_ID]    VARCHAR (50)    NOT NULL,
    [QUANTITA]       DECIMAL (16, 6) NULL,
    [VALORE]         DECIMAL (19, 6) NULL,
    [VALORE_EURO]    DECIMAL (19, 6) NULL,
    [E_MAIL]         VARCHAR (50)    NOT NULL,
    [CLIENTE]        VARCHAR (255)   NULL,
    [INDIRIZZO]      VARCHAR (100)   NULL,
    [CAP]            VARCHAR (10)    NULL,
    [LOCALITA]       VARCHAR (100)   NULL,
    [PROVINCIA]      VARCHAR (50)    NULL,
    [NAZIONE]        VARCHAR (50)    NULL,
    [TELEFONO]       VARCHAR (50)    NULL,
    [CELLULARE]      VARCHAR (50)    NULL,
    [PASSWORD]       VARCHAR (50)    NULL,
    [PIVA]           VARCHAR (20)    NULL,
    [AZIENDA]        VARCHAR (50)    NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [NOTEord]        VARCHAR (255)   NULL,
    [dataconsegna]   DATETIME        NULL,
    [Noteriga]       VARCHAR (255)   NULL,
    PRIMARY KEY CLUSTERED ([ID_VENDITA] ASC, [DATA] ASC, [ID_RIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TMPORDINIECOM] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TMPORDINIECOM] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TMPORDINIECOM] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TMPORDINIECOM] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TMPORDINIECOM] TO [Metodo98]
    AS [dbo];

