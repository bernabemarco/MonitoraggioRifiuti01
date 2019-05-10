﻿CREATE TABLE [dbo].[CONTRATTI_TESTECONSUNTIVGRUPPIACQ] (
    [PROGRESSIVO]    DECIMAL (10) NOT NULL,
    [ESERCIZIO]      DECIMAL (5)  NOT NULL,
    [CODCLIFOR]      VARCHAR (7)  NOT NULL,
    [GRUPPOACQ]      VARCHAR (5)  NOT NULL,
    [MESE]           DECIMAL (5)  NOT NULL,
    [ANNO]           DECIMAL (5)  NOT NULL,
    [ARTICOLO]       VARCHAR (50) NOT NULL,
    [UM]             VARCHAR (3)  NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    [MARCHIO]        VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONTRATTI_TESTECONSUNTIVGRUPPIACQ] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONTRATTI_TESTECONSUNTIVGRUPPIACQ] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONTRATTI_TESTECONSUNTIVGRUPPIACQ] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTI_TESTECONSUNTIVGRUPPIACQ] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONTRATTI_TESTECONSUNTIVGRUPPIACQ] TO [Metodo98]
    AS [dbo];

