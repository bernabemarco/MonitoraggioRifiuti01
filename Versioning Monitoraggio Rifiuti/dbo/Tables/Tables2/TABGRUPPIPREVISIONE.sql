﻿CREATE TABLE [dbo].[TABGRUPPIPREVISIONE] (
    [CODICE]           DECIMAL (5)   NOT NULL,
    [DESCRIZIONE]      VARCHAR (80)  NULL,
    [FORMULAFRONTIERA] VARCHAR (255) NULL,
    [LIVELLOSERVIZIO]  INT           NULL,
    [NOTE]             VARCHAR (100) NULL,
    [UTENTEMODIFICA]   VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]     DATETIME      NOT NULL,
    CONSTRAINT [PK_TABGRUPPIPREVISIONE] PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABGRUPPIPREVISIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABGRUPPIPREVISIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABGRUPPIPREVISIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABGRUPPIPREVISIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABGRUPPIPREVISIONE] TO [Metodo98]
    AS [dbo];
