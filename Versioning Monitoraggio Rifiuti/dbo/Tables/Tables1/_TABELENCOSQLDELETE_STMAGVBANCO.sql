﻿CREATE TABLE [dbo].[_TABELENCOSQLDELETE_STMAGVBANCO] (
    [PROGRESSIVO]    DECIMAL (10)   IDENTITY (1, 1) NOT NULL,
    [SQLDEL]         NVARCHAR (MAX) DEFAULT ('') NULL,
    [NAME_PROC]      VARCHAR (255)  DEFAULT ('') NULL,
    [UTENTEMODIFICA] VARCHAR (25)   NOT NULL,
    [DATAMODIFICA]   DATETIME       NOT NULL,
    CONSTRAINT [PK_TABELENCOSQLDELETE_STMAGVBANCO] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[_TABELENCOSQLDELETE_STMAGVBANCO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[_TABELENCOSQLDELETE_STMAGVBANCO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[_TABELENCOSQLDELETE_STMAGVBANCO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[_TABELENCOSQLDELETE_STMAGVBANCO] TO [Metodo98]
    AS [dbo];

