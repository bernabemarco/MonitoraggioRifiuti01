﻿CREATE TABLE [dbo].[TABTIPOATTREZZAGGIO] (
    [CODICE]         VARCHAR (5)  NOT NULL,
    [DESCRIZIONE]    VARCHAR (25) NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_TABTIPOATTREZZAGGIO] PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABTIPOATTREZZAGGIO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABTIPOATTREZZAGGIO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABTIPOATTREZZAGGIO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABTIPOATTREZZAGGIO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABTIPOATTREZZAGGIO] TO [Metodo98]
    AS [dbo];
