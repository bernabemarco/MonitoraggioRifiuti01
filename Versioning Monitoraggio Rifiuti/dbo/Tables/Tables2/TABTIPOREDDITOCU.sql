﻿CREATE TABLE [dbo].[TABTIPOREDDITOCU] (
    [CODICE]      SMALLINT      NOT NULL,
    [DESCRIZIONE] VARCHAR (500) NULL,
    CONSTRAINT [PK_TABTIPOREDDITOCU] PRIMARY KEY CLUSTERED ([CODICE] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABTIPOREDDITOCU] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABTIPOREDDITOCU] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABTIPOREDDITOCU] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABTIPOREDDITOCU] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABTIPOREDDITOCU] TO [Metodo98]
    AS [dbo];

