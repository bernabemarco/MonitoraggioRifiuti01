﻿CREATE TABLE [dbo].[TRASPORTO_CAD_CODICI] (
    [CODICE]         VARCHAR (5)  NOT NULL,
    [DESCRIZIONE]    VARCHAR (80) NOT NULL,
    [TIPO]           SMALLINT     NOT NULL,
    [STD]            SMALLINT     DEFAULT ((0)) NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    [CODCONTO]       VARCHAR (7)  NULL,
    [TIPONOLO]       SMALLINT     DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([CODICE] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TRASPORTO_CAD_CODICI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TRASPORTO_CAD_CODICI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TRASPORTO_CAD_CODICI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TRASPORTO_CAD_CODICI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TRASPORTO_CAD_CODICI] TO [Metodo98]
    AS [dbo];
