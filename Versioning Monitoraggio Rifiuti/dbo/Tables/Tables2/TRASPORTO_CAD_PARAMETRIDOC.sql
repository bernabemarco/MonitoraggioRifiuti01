﻿CREATE TABLE [dbo].[TRASPORTO_CAD_PARAMETRIDOC] (
    [TIPODOC]          VARCHAR (3)  NOT NULL,
    [CODTIPODOCUMENTO] SMALLINT     NOT NULL,
    [UTENTEMODIFICA]   VARCHAR (25) NOT NULL,
    [DATAMODIFICA]     DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([TIPODOC] ASC, [CODTIPODOCUMENTO] ASC),
    CONSTRAINT [FK_TRASPORTO_CAD_PARAMETRIDOC_PARAMETRIDOC] FOREIGN KEY ([TIPODOC]) REFERENCES [dbo].[PARAMETRIDOC] ([CODICE]) ON DELETE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TRASPORTO_CAD_PARAMETRIDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TRASPORTO_CAD_PARAMETRIDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TRASPORTO_CAD_PARAMETRIDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TRASPORTO_CAD_PARAMETRIDOC] TO [Metodo98]
    AS [dbo];
