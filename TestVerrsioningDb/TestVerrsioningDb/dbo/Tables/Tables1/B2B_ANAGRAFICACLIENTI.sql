﻿CREATE TABLE [dbo].[B2B_ANAGRAFICACLIENTI] (
    [LOGIN]          VARCHAR (50) NOT NULL,
    [CODCLIENTE]     VARCHAR (7)  NOT NULL,
    [EMAIL]          VARCHAR (50) NOT NULL,
    [PASSWORD]       VARCHAR (50) NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_B2B_ANAGRAFICACLIENTI] PRIMARY KEY CLUSTERED ([CODCLIENTE] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[B2B_ANAGRAFICACLIENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[B2B_ANAGRAFICACLIENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[B2B_ANAGRAFICACLIENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[B2B_ANAGRAFICACLIENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[B2B_ANAGRAFICACLIENTI] TO [Metodo98]
    AS [dbo];

