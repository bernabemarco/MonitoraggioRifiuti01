﻿CREATE TABLE [dbo].[TP_SCADENZE] (
    [PROGRESSIVO]     DECIMAL (10)    NOT NULL,
    [ESERCIZIO]       DECIMAL (5)     NOT NULL,
    [TIPODOC]         VARCHAR (3)     NULL,
    [NUMDOC]          DECIMAL (10)    NULL,
    [BIS]             CHAR (1)        NULL,
    [NUMSCAD]         INT             NULL,
    [DATASCADENZA]    DATETIME        NULL,
    [CODCLIFOR]       VARCHAR (7)     NULL,
    [DATAFATTURA]     DATETIME        NULL,
    [NUMRIF]          VARCHAR (15)    NULL,
    [NUMEROPROT]      VARCHAR (9)     NULL,
    [IMPORTOSCEURO]   DECIMAL (19, 4) NOT NULL,
    [IMPORTOSCVAL]    DECIMAL (19, 4) NULL,
    [TOTFATTEURO]     DECIMAL (19, 4) NOT NULL,
    [TOTFATTVAL]      DECIMAL (19, 4) NULL,
    [TIPOEFFETTO]     NUMERIC (5)     NULL,
    [ESITO]           NUMERIC (1)     NULL,
    [CODCAMBIO]       DECIMAL (5)     NULL,
    [VALCAMBIO]       DECIMAL (13, 6) NOT NULL,
    [SCADATTPASS]     SMALLINT        NULL,
    [NUMRIFPARTCONT]  VARCHAR (19)    NULL,
    [CODPAG]          VARCHAR (4)     NULL,
    [DATADEC]         DATETIME        NULL,
    [UTENTEMODIFICA]  VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]    DATETIME        NOT NULL,
    [ESITOPREC]       SMALLINT        NULL,
    [TOTSCAEURO]      DECIMAL (19, 4) NULL,
    [TOTSCAVAL]       DECIMAL (19, 4) NULL,
    [TIPOSCAD]        CHAR (1)        CONSTRAINT [DF_TP_SCADENZE_TIPOSCAD] DEFAULT ('N') NULL,
    [IDTESTADISTINTA] NUMERIC (10)    CONSTRAINT [DF_TP_SCADENZE_IDTESTADISTINTA] DEFAULT (0) NULL,
    [StatoScadenza]   SMALLINT        NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_SCADENZE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_SCADENZE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_SCADENZE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_SCADENZE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_SCADENZE] TO [Metodo98]
    AS [dbo];
