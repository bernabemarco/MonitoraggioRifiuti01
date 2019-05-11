﻿CREATE TABLE [dbo].[TABCATEGORIEPARTICOLARICU] (
    [CODICE]         VARCHAR (2)   NOT NULL,
    [DESCRIZIONE]    VARCHAR (500) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    CONSTRAINT [PK_TABCATEGORIEPARTICOLARICU] PRIMARY KEY CLUSTERED ([CODICE] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABCATEGORIEPARTICOLARICU] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABCATEGORIEPARTICOLARICU] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABCATEGORIEPARTICOLARICU] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABCATEGORIEPARTICOLARICU] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABCATEGORIEPARTICOLARICU] TO [Metodo98]
    AS [dbo];
