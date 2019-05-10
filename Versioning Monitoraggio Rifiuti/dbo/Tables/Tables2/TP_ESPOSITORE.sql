CREATE TABLE [dbo].[TP_ESPOSITORE] (
    [PROGRESSIVO]        NUMERIC (10)    IDENTITY (1, 1) NOT NULL,
    [CODICE]             VARCHAR (50)    NOT NULL,
    [CODICEART]          VARCHAR (50)    NOT NULL,
    [UM]                 VARCHAR (10)    NOT NULL,
    [QTA]                NUMERIC (19, 6) NOT NULL,
    [QTA_OMAGGIO]        NUMERIC (16, 6) NULL,
    [Prezzo_Sost]        NUMERIC (19, 6) NULL,
    [Prezzo_Sost_Euro]   NUMERIC (19, 6) NULL,
    [Sconto_sost]        NUMERIC (5, 2)  NULL,
    [Sconto_sost_esteso] VARCHAR (10)    NULL,
    [Sconto_agg_esteso]  VARCHAR (10)    NULL,
    [UTENTEMODIFICA]     VARCHAR (25)    NULL,
    [DATAMODIFICA]       DATETIME        NULL,
    [TIPOOMA]            SMALLINT        CONSTRAINT [DF_TP_ESPOSITORE_TIPOOMA] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_TP_ESPOSITORE] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_ESPOSITORE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_ESPOSITORE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_ESPOSITORE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_ESPOSITORE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_ESPOSITORE] TO [Metodo98]
    AS [dbo];

