﻿CREATE TABLE [dbo].[TABLICENZERUOLO] (
    [CODRUOLO]       DECIMAL (5)  NOT NULL,
    [CODLICENZA]     DECIMAL (4)  NOT NULL,
    [VALORE]         DECIMAL (1)  NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_TABLICENZERUOLO] PRIMARY KEY CLUSTERED ([CODRUOLO] ASC, [CODLICENZA] ASC),
    CONSTRAINT [FK_TABLICENZERUOLO_TABRUOLI] FOREIGN KEY ([CODRUOLO]) REFERENCES [dbo].[TABRUOLI] ([CODICE]) ON DELETE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABLICENZERUOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABLICENZERUOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABLICENZERUOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABLICENZERUOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABLICENZERUOLO] TO [Metodo98]
    AS [dbo];
