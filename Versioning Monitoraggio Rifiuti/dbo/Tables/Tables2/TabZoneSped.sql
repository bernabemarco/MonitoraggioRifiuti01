﻿CREATE TABLE [dbo].[TabZoneSped] (
    [CODICE]         VARCHAR (10) NOT NULL,
    [DESCRIZIONE]    VARCHAR (50) NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_TabZoneSped] PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TabZoneSped] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TabZoneSped] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TabZoneSped] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TabZoneSped] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TabZoneSped] TO [Metodo98]
    AS [dbo];

