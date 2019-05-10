﻿CREATE TABLE [dbo].[TP_DEPOSITI_DISPONIBILITA] (
    [CODDEPOSITO]    VARCHAR (10) NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([CODDEPOSITO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_DEPOSITI_DISPONIBILITA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_DEPOSITI_DISPONIBILITA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_DEPOSITI_DISPONIBILITA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_DEPOSITI_DISPONIBILITA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_DEPOSITI_DISPONIBILITA] TO [Metodo98]
    AS [dbo];

