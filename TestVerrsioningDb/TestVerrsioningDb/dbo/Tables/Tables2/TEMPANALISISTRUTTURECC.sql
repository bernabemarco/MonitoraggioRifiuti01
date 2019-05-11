﻿CREATE TABLE [dbo].[TEMPANALISISTRUTTURECC] (
    [IDTESTA]     INT           NOT NULL,
    [IDRIGA]      INT           NOT NULL,
    [TIPO]        SMALLINT      NOT NULL,
    [CODLIV]      VARCHAR (50)  NULL,
    [CODLIVELLO]  VARCHAR (50)  NULL,
    [DESCRIZIONE] VARCHAR (100) NULL,
    [ERR]         SMALLINT      NOT NULL,
    [ERRDESCR]    VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([IDTESTA] ASC, [IDRIGA] ASC, [TIPO] ASC, [ERR] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPANALISISTRUTTURECC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPANALISISTRUTTURECC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPANALISISTRUTTURECC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPANALISISTRUTTURECC] TO [Metodo98]
    AS [dbo];
