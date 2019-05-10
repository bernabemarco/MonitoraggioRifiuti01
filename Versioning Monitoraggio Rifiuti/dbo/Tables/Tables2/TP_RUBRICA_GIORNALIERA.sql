CREATE TABLE [dbo].[TP_RUBRICA_GIORNALIERA] (
    [Utente]         VARCHAR (25) NULL,
    [Cliente]        VARCHAR (7)  NULL,
    [Stato]          SMALLINT     NULL,
    [Ora]            DATETIME     NULL,
    [IDGiorno]       SMALLINT     NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_RUBRICA_GIORNALIERA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_RUBRICA_GIORNALIERA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_RUBRICA_GIORNALIERA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_RUBRICA_GIORNALIERA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_RUBRICA_GIORNALIERA] TO [Metodo98]
    AS [dbo];

