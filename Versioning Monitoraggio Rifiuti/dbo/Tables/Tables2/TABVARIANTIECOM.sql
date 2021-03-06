﻿CREATE TABLE [dbo].[TABVARIANTIECOM] (
    [CODPADRE]       VARCHAR (50)  NOT NULL,
    [POSTIPOLOGIA]   SMALLINT      NOT NULL,
    [CODTIPOLOGIA]   VARCHAR (3)   NOT NULL,
    [CODVARIANTE]    VARCHAR (8)   NOT NULL,
    [DSCTIPOLOGIA]   VARCHAR (25)  NULL,
    [DSCVARIANTE]    VARCHAR (80)  NULL,
    [POSVARIANTE]    SMALLINT      NULL,
    [IMGVAR]         VARCHAR (100) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([CODPADRE] ASC, [POSTIPOLOGIA] ASC, [CODTIPOLOGIA] ASC, [CODVARIANTE] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABVARIANTIECOM] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABVARIANTIECOM] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABVARIANTIECOM] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABVARIANTIECOM] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABVARIANTIECOM] TO [Metodo98]
    AS [dbo];

