﻿CREATE TABLE [dbo].[CONTRATTI_CONFIGSCONTI] (
    [CODICE]         VARCHAR (5)  NOT NULL,
    [DESCRIZIONE]    VARCHAR (80) NOT NULL,
    [TIPO]           SMALLINT     NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([CODICE] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONTRATTI_CONFIGSCONTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONTRATTI_CONFIGSCONTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONTRATTI_CONFIGSCONTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTI_CONFIGSCONTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONTRATTI_CONFIGSCONTI] TO [Metodo98]
    AS [dbo];

