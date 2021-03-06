﻿CREATE TABLE [dbo].[TRASPORTO_CAD_LIVELLI] (
    [PROGRESSIVO]    SMALLINT     NOT NULL,
    [DESCRIZIONE]    VARCHAR (80) NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO
GRANT ALTER
    ON OBJECT::[dbo].[TRASPORTO_CAD_LIVELLI] TO [Metodo98]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[TRASPORTO_CAD_LIVELLI] TO [Metodo98]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[TRASPORTO_CAD_LIVELLI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TRASPORTO_CAD_LIVELLI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TRASPORTO_CAD_LIVELLI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TRASPORTO_CAD_LIVELLI] TO [Metodo98]
    AS [dbo];

