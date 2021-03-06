﻿CREATE TABLE [dbo].[TABPARAMETRIRATEIRISCONTI] (
    [ESERCIZIO]              DECIMAL (5)  NOT NULL,
    [UTENTEMODIFICA]         VARCHAR (25) NOT NULL,
    [DATAMODIFICA]           DATETIME     NOT NULL,
    [CODCAUSRATEIATT]        DECIMAL (5)  DEFAULT (0) NULL,
    [CODCAUSRATEIPASS]       DECIMAL (5)  DEFAULT (0) NULL,
    [CODCAUSRISCATT]         DECIMAL (5)  DEFAULT (0) NULL,
    [CODCAUSRISCPASS]        DECIMAL (5)  DEFAULT (0) NULL,
    [CONTORATEIATT]          VARCHAR (7)  DEFAULT ('') NULL,
    [CONTORATEIPASS]         VARCHAR (7)  DEFAULT ('') NULL,
    [CONTORISCATT]           VARCHAR (7)  DEFAULT ('') NULL,
    [CONTORISCPASS]          VARCHAR (7)  DEFAULT ('') NULL,
    [CODCAUSSTORNORATEIATT]  DECIMAL (5)  DEFAULT (0) NULL,
    [CODCAUSSTORNORATEIPASS] DECIMAL (5)  DEFAULT (0) NULL,
    [CODCAUSSTORNORISCATT]   DECIMAL (5)  DEFAULT (0) NULL,
    [CODCAUSSTORNORISCPASS]  DECIMAL (5)  DEFAULT (0) NULL,
    CONSTRAINT [pk_TabParametriRateiRisconti] PRIMARY KEY CLUSTERED ([ESERCIZIO] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABPARAMETRIRATEIRISCONTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABPARAMETRIRATEIRISCONTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABPARAMETRIRATEIRISCONTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABPARAMETRIRATEIRISCONTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABPARAMETRIRATEIRISCONTI] TO [Metodo98]
    AS [dbo];

