﻿CREATE TABLE [dbo].[TABQUALITY_LISTEMOVLOTTI] (
    [CODLISTA]       VARCHAR (3)  NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([CODLISTA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABQUALITY_LISTEMOVLOTTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABQUALITY_LISTEMOVLOTTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABQUALITY_LISTEMOVLOTTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABQUALITY_LISTEMOVLOTTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABQUALITY_LISTEMOVLOTTI] TO [Metodo98]
    AS [dbo];
