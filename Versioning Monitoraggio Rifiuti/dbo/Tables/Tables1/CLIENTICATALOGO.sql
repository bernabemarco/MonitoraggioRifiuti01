﻿CREATE TABLE [dbo].[CLIENTICATALOGO] (
    [E_MAIL]         VARCHAR (50)  NOT NULL,
    [CLIENTE]        VARCHAR (255) NULL,
    [INDIRIZZO]      VARCHAR (100) NULL,
    [CAP]            VARCHAR (10)  NULL,
    [LOCALITA]       VARCHAR (100) NULL,
    [PROVINCIA]      VARCHAR (50)  NULL,
    [NAZIONE]        VARCHAR (50)  NULL,
    [TELEFONO]       VARCHAR (50)  NULL,
    [CELLULARE]      VARCHAR (50)  NULL,
    [PASSWORD]       VARCHAR (50)  NULL,
    [PIVA]           VARCHAR (20)  NULL,
    [AZIENDA]        VARCHAR (50)  NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    [COdConto]       VARCHAR (7)   NULL,
    [SCONTOFINALE]   VARCHAR (1)   NULL,
    [SCONTORIGA]     VARCHAR (1)   NULL,
    [PERCSC]         VARCHAR (10)  NULL,
    PRIMARY KEY CLUSTERED ([E_MAIL] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CLIENTICATALOGO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CLIENTICATALOGO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CLIENTICATALOGO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CLIENTICATALOGO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CLIENTICATALOGO] TO [Metodo98]
    AS [dbo];

