﻿CREATE TABLE [dbo].[PARAMETRICONFRD] (
    [RIFPROGRESSIVO] DECIMAL (10) NOT NULL,
    [PARAMETRO]      VARCHAR (3)  NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_PARAMETRICONFRD] PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [PARAMETRO] ASC),
    CONSTRAINT [FK_PARAMETRICONFRD_RIFPROGRESSIVO] FOREIGN KEY ([RIFPROGRESSIVO]) REFERENCES [dbo].[TESTECONFRD] ([PROGRESSIVO]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PARAMETRICONFRD] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PARAMETRICONFRD] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PARAMETRICONFRD] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PARAMETRICONFRD] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PARAMETRICONFRD] TO [Metodo98]
    AS [dbo];

