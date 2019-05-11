﻿CREATE TABLE [dbo].[TABAUTOMEZZI] (
    [CODICE]         DECIMAL (5)     NOT NULL,
    [DESCRIZIONE]    VARCHAR (80)    DEFAULT ('') NULL,
    [VOLUME]         DECIMAL (16, 6) DEFAULT (0) NULL,
    [TARGA]          VARCHAR (25)    DEFAULT ('') NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    CONSTRAINT [PK_TABAUTOMEZZI] PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABAUTOMEZZI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABAUTOMEZZI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABAUTOMEZZI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABAUTOMEZZI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABAUTOMEZZI] TO [Metodo98]
    AS [dbo];
