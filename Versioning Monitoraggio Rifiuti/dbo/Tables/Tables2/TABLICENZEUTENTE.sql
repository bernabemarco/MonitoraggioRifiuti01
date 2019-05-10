﻿CREATE TABLE [dbo].[TABLICENZEUTENTE] (
    [CODUTENTE]      VARCHAR (25) NOT NULL,
    [CODLICENZA]     DECIMAL (4)  NOT NULL,
    [VALORE]         DECIMAL (1)  NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_TABLICENZEUTENTE] PRIMARY KEY CLUSTERED ([CODUTENTE] ASC, [CODLICENZA] ASC),
    CONSTRAINT [FK_TABLICENZEUTENTE_TABUTENTI] FOREIGN KEY ([CODUTENTE]) REFERENCES [dbo].[TABUTENTI] ([USERID]) ON DELETE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABLICENZEUTENTE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABLICENZEUTENTE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABLICENZEUTENTE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABLICENZEUTENTE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABLICENZEUTENTE] TO [Metodo98]
    AS [dbo];

