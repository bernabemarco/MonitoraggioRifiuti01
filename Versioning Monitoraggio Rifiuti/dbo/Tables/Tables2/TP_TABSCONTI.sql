﻿CREATE TABLE [dbo].[TP_TABSCONTI] (
    [CODICE]         VARCHAR (5)   NOT NULL,
    [DESCRIZIONE]    VARCHAR (200) NOT NULL,
    [TIPO]           SMALLINT      NULL,
    [TIPOLOGIA]      SMALLINT      NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NULL,
    [DATAMODIFICA]   DATETIME      NULL,
    [ADDVALSCTMERCE] SMALLINT      CONSTRAINT [DF_TP_TABSCONTI_ADDVALSCTMERCE] DEFAULT (0) NULL,
    CONSTRAINT [PK_TP_TABSCONTI] PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_TABSCONTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_TABSCONTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_TABSCONTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_TABSCONTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_TABSCONTI] TO [Metodo98]
    AS [dbo];

