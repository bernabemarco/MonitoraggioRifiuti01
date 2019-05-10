﻿CREATE TABLE [dbo].[TESTEIMPOSTAZIONIVISIONI] (
    [PROGRESSIVO]      DECIMAL (10)   IDENTITY (1, 1) NOT NULL,
    [NOMEVISIONE]      VARCHAR (80)   NOT NULL,
    [NOMEIMPOSTAZIONE] VARCHAR (50)   NOT NULL,
    [NOMEUTENTE]       VARCHAR (25)   NULL,
    [IMPPIVOT]         SMALLINT       NULL,
    [TIPODATA]         VARCHAR (100)  NULL,
    [PERIODICITA]      VARCHAR (1)    NULL,
    [TIPOPERC]         SMALLINT       NULL,
    [VISPERCMAGG]      DECIMAL (6, 2) NULL,
    [VISPERCMIN]       DECIMAL (6, 2) NULL,
    [UTENTEMODIFICA]   VARCHAR (25)   NOT NULL,
    [DATAMODIFICA]     DATETIME       NOT NULL,
    [ANNO]             SMALLINT       NULL,
    CONSTRAINT [PK_TESTEIMPOSTAZIONIVISIONI] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TESTEIMPOSTAZIONIVISIONI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TESTEIMPOSTAZIONIVISIONI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TESTEIMPOSTAZIONIVISIONI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TESTEIMPOSTAZIONIVISIONI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TESTEIMPOSTAZIONIVISIONI] TO [Metodo98]
    AS [dbo];

