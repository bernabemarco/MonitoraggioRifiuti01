﻿CREATE TABLE [dbo].[TABPARENASARCO] (
    [ESERCIZIO]         DECIMAL (5)     NOT NULL,
    [CODCAUSALECONT]    DECIMAL (5)     NOT NULL,
    [CODCONTOGEN]       VARCHAR (7)     NULL,
    [MINMONO]           DECIMAL (19, 4) DEFAULT (0) NULL,
    [MINMULTI]          DECIMAL (19, 4) DEFAULT (0) NULL,
    [MAXMONO]           DECIMAL (19, 4) DEFAULT (0) NULL,
    [MAXMULTI]          DECIMAL (19, 4) DEFAULT (0) NULL,
    [PERCAGENTE]        DECIMAL (8, 5)  DEFAULT (0) NULL,
    [PERCAZIENDA]       DECIMAL (8, 5)  DEFAULT (0) NULL,
    [AGGIORNALIQUIDATO] SMALLINT        DEFAULT (0) NULL,
    [DSCRIGADEFAULT]    VARCHAR (80)    NULL,
    [UTENTEMODIFICA]    VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]      DATETIME        NOT NULL,
    [MINCAPIT]          DECIMAL (19, 4) NULL,
    [MAXCAPIT]          DECIMAL (19, 4) NULL,
    [PERCAGENTECAPIT]   DECIMAL (19, 4) NULL,
    [PERCAZIENDACAPIT]  DECIMAL (19, 4) NULL,
    CONSTRAINT [PK_TABPARENASARCO] PRIMARY KEY CLUSTERED ([ESERCIZIO] ASC) WITH (FILLFACTOR = 90),
    CHECK ([AGGIORNALIQUIDATO] is null or [AGGIORNALIQUIDATO] = 1 or [AGGIORNALIQUIDATO] = 0)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABPARENASARCO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABPARENASARCO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABPARENASARCO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABPARENASARCO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABPARENASARCO] TO [Metodo98]
    AS [dbo];

