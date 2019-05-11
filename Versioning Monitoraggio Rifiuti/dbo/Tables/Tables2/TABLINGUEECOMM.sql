﻿CREATE TABLE [dbo].[TABLINGUEECOMM] (
    [LINGUAMETODO]   NUMERIC (5)  NULL,
    [LINGUACATALOGO] NUMERIC (5)  NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NULL,
    PRIMARY KEY CLUSTERED ([LINGUACATALOGO] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABLINGUEECOMM] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABLINGUEECOMM] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABLINGUEECOMM] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABLINGUEECOMM] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABLINGUEECOMM] TO [Metodo98]
    AS [dbo];
