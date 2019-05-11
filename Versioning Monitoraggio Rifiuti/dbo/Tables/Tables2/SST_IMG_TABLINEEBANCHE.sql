﻿CREATE TABLE [dbo].[SST_IMG_TABLINEEBANCHE] (
    [Codice_LINE_TFK9CD]      VARCHAR (5)  NOT NULL,
    [Descrizione_LINE_TFNYTX] VARCHAR (15) DEFAULT ('') NOT NULL,
    [UTENTEMODIFICA]          VARCHAR (25) DEFAULT ('') NOT NULL,
    [DATAMODIFICA]            DATETIME     DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([Codice_LINE_TFK9CD] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SST_IMG_TABLINEEBANCHE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SST_IMG_TABLINEEBANCHE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SST_IMG_TABLINEEBANCHE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SST_IMG_TABLINEEBANCHE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SST_IMG_TABLINEEBANCHE] TO [Metodo98]
    AS [dbo];
