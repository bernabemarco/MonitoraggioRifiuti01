﻿CREATE TABLE [dbo].[ANAGRAFICACFGESTCONT] (
    [CODCONTO]       VARCHAR (7)   NOT NULL,
    [DOCUMENTO]      VARCHAR (255) NULL,
    [ATTIVITA]       VARCHAR (255) NULL,
    [NOTE]           VARCHAR (255) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    CONSTRAINT [pk_codconto] PRIMARY KEY CLUSTERED ([CODCONTO] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_ANAGRAFICACFGESTCONT_CODCONTO] FOREIGN KEY ([CODCONTO]) REFERENCES [dbo].[ANAGRAFICACF] ([CODCONTO]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ANAGRAFICACFGESTCONT] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ANAGRAFICACFGESTCONT] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ANAGRAFICACFGESTCONT] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ANAGRAFICACFGESTCONT] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ANAGRAFICACFGESTCONT] TO [Metodo98]
    AS [dbo];

