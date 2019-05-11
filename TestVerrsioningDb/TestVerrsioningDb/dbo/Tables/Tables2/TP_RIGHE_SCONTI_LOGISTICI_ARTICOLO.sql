﻿CREATE TABLE [dbo].[TP_RIGHE_SCONTI_LOGISTICI_ARTICOLO] (
    [RIFPROGRESSIVO] DECIMAL (18)    NOT NULL,
    [NRRIGA]         INT             NOT NULL,
    [FLAGRIGA]       SMALLINT        NULL,
    [POSIZIONE]      INT             NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [ARTICOLO]       VARCHAR (50)    NOT NULL,
    [UM]             VARCHAR (3)     NOT NULL,
    [QTAMIN]         DECIMAL (19, 6) CONSTRAINT [DF_TP_RIGHE_SCONTI_LOGISTICI_ARTICOLO_QTAMIN] DEFAULT (0) NOT NULL,
    [SCONTO]         VARCHAR (50)    CONSTRAINT [DF_TP_RIGHE_SCONTI_LOGISTICI_ARTICOLO_SCONTO] DEFAULT ('') NULL,
    [Valore]         DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [CODARTRIC]      VARCHAR (50)    DEFAULT ('') NULL,
    CONSTRAINT [PK_TP_RIGHE_SCONTI_LOGISTICI_ARTICOLO] PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_RIGHE_SCONTI_LOGISTICI_ARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_RIGHE_SCONTI_LOGISTICI_ARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_RIGHE_SCONTI_LOGISTICI_ARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_RIGHE_SCONTI_LOGISTICI_ARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_RIGHE_SCONTI_LOGISTICI_ARTICOLO] TO [Metodo98]
    AS [dbo];
