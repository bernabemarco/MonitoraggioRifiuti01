﻿CREATE TABLE [dbo].[TABACCESSIRUOLO] (
    [CODRUOLO]       DECIMAL (5)  NOT NULL,
    [HELPID]         INT          NOT NULL,
    [INDICESCHEDA]   SMALLINT     NOT NULL,
    [TIPOACCESSO]    SMALLINT     NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_TABACCESSIRUOLO] PRIMARY KEY CLUSTERED ([CODRUOLO] ASC, [HELPID] ASC, [INDICESCHEDA] ASC),
    CONSTRAINT [FK_TABACCESSIRUOLO_TABRUOLI] FOREIGN KEY ([CODRUOLO]) REFERENCES [dbo].[TABRUOLI] ([CODICE]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABACCESSIRUOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABACCESSIRUOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABACCESSIRUOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABACCESSIRUOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABACCESSIRUOLO] TO [Metodo98]
    AS [dbo];

