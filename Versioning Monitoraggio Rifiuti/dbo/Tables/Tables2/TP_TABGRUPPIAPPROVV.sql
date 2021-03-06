﻿CREATE TABLE [dbo].[TP_TABGRUPPIAPPROVV] (
    [CODICE]                  NUMERIC (5)     NOT NULL,
    [DESCRIZIONE]             VARCHAR (80)    NULL,
    [LIVELLOSERVIZIO]         DECIMAL (5, 2)  NULL,
    [COSTOORDINAZIONE]        DECIMAL (19, 6) NULL,
    [INDICECOSTOMANTENIMENTO] DECIMAL (5, 2)  NULL,
    [TASSOMANTENIMENTO]       DECIMAL (5, 2)  NULL,
    [FATTORESCOSTAMENTO]      DECIMAL (5, 2)  NULL,
    [UTENTEMODIFICA]          VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]            DATETIME        NOT NULL,
    [CostoAcquisto]           SMALLINT        DEFAULT ((0)) NULL,
    [CodListinoCA]            DECIMAL (5)     DEFAULT ((0)) NULL,
    [MODALITACALCOLO]         SMALLINT        NULL,
    PRIMARY KEY CLUSTERED ([CODICE] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_TABGRUPPIAPPROVV] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_TABGRUPPIAPPROVV] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_TABGRUPPIAPPROVV] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_TABGRUPPIAPPROVV] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_TABGRUPPIAPPROVV] TO [Metodo98]
    AS [dbo];

