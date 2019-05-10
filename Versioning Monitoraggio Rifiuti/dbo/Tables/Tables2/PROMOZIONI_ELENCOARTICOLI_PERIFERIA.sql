CREATE TABLE [dbo].[PROMOZIONI_ELENCOARTICOLI_PERIFERIA] (
    [rowguid]          UNIQUEIDENTIFIER NOT NULL,
    [progressivo]      DECIMAL (10)     NOT NULL,
    [numerocampagna]   VARCHAR (3)      NOT NULL,
    [tipo]             SMALLINT         DEFAULT ((0)) NOT NULL,
    [descrizione]      VARCHAR (50)     NOT NULL,
    [clifor]           VARCHAR (7)      NOT NULL,
    [gruppoprezzicf]   DECIMAL (5)      NULL,
    [data_inizio]      DATETIME         NOT NULL,
    [data_fine]        DATETIME         NOT NULL,
    [codice]           VARCHAR (50)     NOT NULL,
    [descart]          VARCHAR (80)     NOT NULL,
    [riga]             INT              NOT NULL,
    [tipologia]        INT              NOT NULL,
    [qtatotprodoff]    DECIMAL (16, 6)  DEFAULT ((0)) NOT NULL,
    [umtotprodoff]     VARCHAR (3)      NOT NULL,
    [tiposconto]       SMALLINT         DEFAULT ((0)) NOT NULL,
    [piudicui]         SMALLINT         DEFAULT ((0)) NOT NULL,
    [note]             VARCHAR (2500)   NULL,
    [sunonevad]        SMALLINT         DEFAULT ((0)) NOT NULL,
    [tipopromoartoma]  SMALLINT         DEFAULT ((0)) NOT NULL,
    [abilitaprzartoma] SMALLINT         DEFAULT ((0)) NOT NULL,
    [abilitasctartoma] SMALLINT         DEFAULT ((0)) NOT NULL,
    [visprezzo]        SMALLINT         DEFAULT ((0)) NOT NULL,
    [utentemodifica]   VARCHAR (20)     NOT NULL,
    [datamodifica]     DATETIME         NOT NULL,
    [CODSETTORE]       DECIMAL (5)      NULL,
    [CODZONA]          DECIMAL (5)      NULL,
    [CODCATEGORIA]     DECIMAL (5)      NULL,
    [PRIORITA]         SMALLINT         CONSTRAINT [DF_PROMOZIONI_ELENCOARTICOLI_PERIFERIA_PRIORITA] DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([rowguid] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PROMOZIONI_ELENCOARTICOLI_PERIFERIA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PROMOZIONI_ELENCOARTICOLI_PERIFERIA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PROMOZIONI_ELENCOARTICOLI_PERIFERIA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PROMOZIONI_ELENCOARTICOLI_PERIFERIA] TO [Metodo98]
    AS [dbo];

