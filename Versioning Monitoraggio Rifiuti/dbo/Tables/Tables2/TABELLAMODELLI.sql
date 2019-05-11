﻿CREATE TABLE [dbo].[TABELLAMODELLI] (
    [CODICE]         VARCHAR (20)   NOT NULL,
    [DESCRIZIONE]    VARCHAR (100)  NULL,
    [ANNOTAZIONI]    VARCHAR (3000) NULL,
    [UTENTEMODIFICA] VARCHAR (25)   NULL,
    [DATAMODIFICA]   DATETIME       NOT NULL,
    PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABELLAMODELLI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABELLAMODELLI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABELLAMODELLI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABELLAMODELLI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABELLAMODELLI] TO [Metodo98]
    AS [dbo];
