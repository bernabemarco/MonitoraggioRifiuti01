﻿CREATE TABLE [dbo].[TMP_IDOK_IMPORTXML] (
    [PROGR]          INT           NOT NULL,
    [FILEIMPORT]     VARCHAR (255) NULL,
    [ELABORATO]      SMALLINT      NULL,
    [LINK]           VARCHAR (150) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([PROGR] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TMP_IDOK_IMPORTXML] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TMP_IDOK_IMPORTXML] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TMP_IDOK_IMPORTXML] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TMP_IDOK_IMPORTXML] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TMP_IDOK_IMPORTXML] TO [Metodo98]
    AS [dbo];

