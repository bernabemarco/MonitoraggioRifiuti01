﻿CREATE TABLE [dbo].[MACCHINEALTERNATIVE] (
    [CODOPERAZIONE]  VARCHAR (5)  NOT NULL,
    [PRIORITA]       SMALLINT     NOT NULL,
    [CODMACCHINA]    VARCHAR (5)  NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_MACCHINEALTERNATIVE] PRIMARY KEY CLUSTERED ([CODOPERAZIONE] ASC, [PRIORITA] ASC, [CODMACCHINA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[MACCHINEALTERNATIVE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MACCHINEALTERNATIVE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[MACCHINEALTERNATIVE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MACCHINEALTERNATIVE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MACCHINEALTERNATIVE] TO [Metodo98]
    AS [dbo];
