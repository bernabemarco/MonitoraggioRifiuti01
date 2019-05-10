﻿CREATE TABLE [dbo].[TP_TIPOLSCONTI1CTR] (
    [CODICE]         VARCHAR (5)   NOT NULL,
    [DESCRIZIONE]    VARCHAR (200) NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NULL,
    [DATAMODIFICA]   DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_TIPOLSCONTI1CTR] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_TIPOLSCONTI1CTR] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_TIPOLSCONTI1CTR] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_TIPOLSCONTI1CTR] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_TIPOLSCONTI1CTR] TO [Metodo98]
    AS [dbo];

