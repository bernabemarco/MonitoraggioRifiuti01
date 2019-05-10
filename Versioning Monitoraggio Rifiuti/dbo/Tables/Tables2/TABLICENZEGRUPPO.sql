﻿CREATE TABLE [dbo].[TABLICENZEGRUPPO] (
    [CODGRUPPO]      DECIMAL (5)  NOT NULL,
    [CODLICENZA]     DECIMAL (4)  NOT NULL,
    [VALORE]         DECIMAL (1)  NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_TABLICENZEGRUPPO] PRIMARY KEY CLUSTERED ([CODGRUPPO] ASC, [CODLICENZA] ASC),
    CONSTRAINT [FK_TABLICENZEGRUPPO_TABGRUPPIUTENTE] FOREIGN KEY ([CODGRUPPO]) REFERENCES [dbo].[TABGRUPPIUTENTE] ([CODICE]) ON DELETE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABLICENZEGRUPPO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABLICENZEGRUPPO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABLICENZEGRUPPO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABLICENZEGRUPPO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABLICENZEGRUPPO] TO [Metodo98]
    AS [dbo];

