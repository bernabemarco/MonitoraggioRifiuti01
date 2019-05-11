﻿CREATE TABLE [dbo].[TDA_CAUSALIFEEDBACK] (
    [CODICE]         DECIMAL (5)   NOT NULL,
    [DESCRIZIONE]    VARCHAR (80)  NULL,
    [NOTE]           VARCHAR (255) NULL,
    [FILTRAREPARTO]  SMALLINT      NULL,
    [FILTRACDL]      SMALLINT      NULL,
    [FILTRARISORSA]  SMALLINT      NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TDA_CAUSALIFEEDBACK] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TDA_CAUSALIFEEDBACK] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TDA_CAUSALIFEEDBACK] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TDA_CAUSALIFEEDBACK] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TDA_CAUSALIFEEDBACK] TO [Metodo98]
    AS [dbo];
