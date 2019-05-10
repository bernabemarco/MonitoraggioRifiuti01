﻿CREATE TABLE [dbo].[TP_RIGHE_SCONTI_LOGISTICI_PREZZIMAG] (
    [RIFPROGRESSIVO] DECIMAL (18)    NOT NULL,
    [NRRIGA]         INT             NOT NULL,
    [FLAGRIGA]       SMALLINT        NULL,
    [POSIZIONE]      INT             NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [GRPPREZZIPART]  DECIMAL (5)     NOT NULL,
    [UM]             VARCHAR (3)     NOT NULL,
    [QTAMIN]         DECIMAL (19, 6) CONSTRAINT [DF_TP_RIGHE_SCONTI_LOGISTICI_PREZZIMAG_QTAMIN] DEFAULT (0) NOT NULL,
    [SCONTO]         VARCHAR (50)    CONSTRAINT [DF_TP_RIGHE_SCONTI_LOGISTICI_PREZZIMAG_SCONTO] DEFAULT ('') NULL,
    [Valore]         DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_TP_RIGHE_SCONTI_LOGISTICI_PREZZIMAG] PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_RIGHE_SCONTI_LOGISTICI_PREZZIMAG] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_RIGHE_SCONTI_LOGISTICI_PREZZIMAG] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_RIGHE_SCONTI_LOGISTICI_PREZZIMAG] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_RIGHE_SCONTI_LOGISTICI_PREZZIMAG] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_RIGHE_SCONTI_LOGISTICI_PREZZIMAG] TO [Metodo98]
    AS [dbo];

