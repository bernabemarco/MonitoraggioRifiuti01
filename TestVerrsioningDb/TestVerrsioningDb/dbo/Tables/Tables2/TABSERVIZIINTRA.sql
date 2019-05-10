﻿CREATE TABLE [dbo].[TABSERVIZIINTRA] (
    [CODICE]         VARCHAR (6)   NOT NULL,
    [DESCRIZIONE]    VARCHAR (300) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    [ANNO]           SMALLINT      NULL,
    CONSTRAINT [PK_TABSERVIZIINTRA] PRIMARY KEY CLUSTERED ([CODICE] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABSERVIZIINTRA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABSERVIZIINTRA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABSERVIZIINTRA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABSERVIZIINTRA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABSERVIZIINTRA] TO [Metodo98]
    AS [dbo];

