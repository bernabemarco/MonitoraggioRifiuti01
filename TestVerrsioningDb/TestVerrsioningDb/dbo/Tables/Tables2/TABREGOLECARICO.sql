﻿CREATE TABLE [dbo].[TABREGOLECARICO] (
    [IDREGOLA]       SMALLINT      NOT NULL,
    [DESCRIZIONE]    VARCHAR (80)  NULL,
    [NOTE]           VARCHAR (255) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    CONSTRAINT [PK_TABREGOLECARICO] PRIMARY KEY CLUSTERED ([IDREGOLA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABREGOLECARICO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABREGOLECARICO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABREGOLECARICO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABREGOLECARICO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABREGOLECARICO] TO [Metodo98]
    AS [dbo];

