﻿CREATE TABLE [dbo].[TDA_TIPIFEEDBACK] (
    [CODICE]             DECIMAL (5)   NOT NULL,
    [DESCRIZIONE]        VARCHAR (80)  NULL,
    [PLUGIN]             DECIMAL (5)   NULL,
    [UTENTEMODIFICA]     VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]       DATETIME      NOT NULL,
    [NOMEPROFILOVISIONE] VARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TDA_TIPIFEEDBACK] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TDA_TIPIFEEDBACK] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TDA_TIPIFEEDBACK] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TDA_TIPIFEEDBACK] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TDA_TIPIFEEDBACK] TO [Metodo98]
    AS [dbo];

