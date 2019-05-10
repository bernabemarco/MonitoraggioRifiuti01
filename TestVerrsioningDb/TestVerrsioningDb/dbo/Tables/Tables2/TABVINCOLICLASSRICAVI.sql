﻿CREATE TABLE [dbo].[TABVINCOLICLASSRICAVI] (
    [PROGRESSIVO]    NUMERIC (10) NOT NULL,
    [CODGEN]         VARCHAR (7)  NULL,
    [CODCDC]         VARCHAR (10) NULL,
    [VOCEBASE]       VARCHAR (3)  NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABVINCOLICLASSRICAVI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABVINCOLICLASSRICAVI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABVINCOLICLASSRICAVI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABVINCOLICLASSRICAVI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABVINCOLICLASSRICAVI] TO [Metodo98]
    AS [dbo];

