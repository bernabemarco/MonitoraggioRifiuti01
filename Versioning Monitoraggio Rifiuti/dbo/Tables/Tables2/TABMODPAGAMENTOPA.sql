﻿CREATE TABLE [dbo].[TABMODPAGAMENTOPA] (
    [CODICE]      VARCHAR (4)  NOT NULL,
    [DESCRIZIONE] VARCHAR (80) NULL,
    [CODPAGB2B]   VARCHAR (4)  NULL,
    CONSTRAINT [PK_TABMODPAGAMENTOPA] PRIMARY KEY CLUSTERED ([CODICE] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABMODPAGAMENTOPA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABMODPAGAMENTOPA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABMODPAGAMENTOPA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABMODPAGAMENTOPA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABMODPAGAMENTOPA] TO [Metodo98]
    AS [dbo];

