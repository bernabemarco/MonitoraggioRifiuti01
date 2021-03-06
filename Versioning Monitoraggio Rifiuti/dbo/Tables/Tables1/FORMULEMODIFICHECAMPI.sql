﻿CREATE TABLE [dbo].[FORMULEMODIFICHECAMPI] (
    [NOMETABELLA]    VARCHAR (50)   NOT NULL,
    [FORMULA]        VARCHAR (7500) NULL,
    [UTENTEMODIFICA] VARCHAR (25)   NOT NULL,
    [DATAMODIFICA]   DATETIME       NOT NULL,
    CONSTRAINT [PK_FORMULEMODIFICHECAMPI] PRIMARY KEY CLUSTERED ([NOMETABELLA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FORMULEMODIFICHECAMPI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FORMULEMODIFICHECAMPI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FORMULEMODIFICHECAMPI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FORMULEMODIFICHECAMPI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FORMULEMODIFICHECAMPI] TO [Metodo98]
    AS [dbo];

