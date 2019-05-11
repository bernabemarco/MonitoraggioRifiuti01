﻿CREATE TABLE [dbo].[ESEGUICONFRD] (
    [RIFPROGRESSIVO] DECIMAL (10)  NOT NULL,
    [ESEGUI]         VARCHAR (300) NOT NULL,
    [PERCORSO]       VARCHAR (500) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    CONSTRAINT [PK_ESEGUICONFRD] PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [ESEGUI] ASC),
    CONSTRAINT [FK_ESEGUICONFRD_RIFPROGRESSIVO] FOREIGN KEY ([RIFPROGRESSIVO]) REFERENCES [dbo].[TESTECONFRD] ([PROGRESSIVO]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ESEGUICONFRD] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ESEGUICONFRD] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ESEGUICONFRD] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ESEGUICONFRD] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ESEGUICONFRD] TO [Metodo98]
    AS [dbo];
