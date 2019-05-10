﻿CREATE TABLE [dbo].[CAP_ISTAT] (
    [CODICE] INT          DEFAULT ((0)) NOT NULL,
    [ISTAT]  NVARCHAR (6) NULL,
    CONSTRAINT [PK_CAP_ISTAT] PRIMARY KEY CLUSTERED ([CODICE] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CAP_ISTAT] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CAP_ISTAT] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CAP_ISTAT] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CAP_ISTAT] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CAP_ISTAT] TO [Metodo98]
    AS [dbo];

