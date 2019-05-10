﻿CREATE TABLE [dbo].[TDA_FUNZIONIMATERIALE] (
    [CODICE]             DECIMAL (5)   NOT NULL,
    [DESCRIZIONE]        VARCHAR (80)  NULL,
    [TIPOMOVIMENTAZIONE] SMALLINT      NULL,
    [FLAGPROPONIQTA]     SMALLINT      NULL,
    [PLUGINRIL]          DECIMAL (5)   NULL,
    [PLUGINCONS]         DECIMAL (5)   NULL,
    [NOTE]               VARCHAR (255) NULL,
    [UTENTEMODIFICA]     VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]       DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TDA_FUNZIONIMATERIALE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TDA_FUNZIONIMATERIALE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TDA_FUNZIONIMATERIALE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TDA_FUNZIONIMATERIALE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TDA_FUNZIONIMATERIALE] TO [Metodo98]
    AS [dbo];

