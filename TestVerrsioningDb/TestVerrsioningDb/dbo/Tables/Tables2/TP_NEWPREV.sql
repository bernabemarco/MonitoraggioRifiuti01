﻿CREATE TABLE [dbo].[TP_NEWPREV] (
    [CODART]         VARCHAR (50)    NOT NULL,
    [DATA]           DATETIME        NULL,
    [NEWPREV]        DECIMAL (19, 6) NULL,
    [OLDPREV]        DECIMAL (19, 6) NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NULL,
    [DATAMODIFICA]   DATETIME        NULL,
    CONSTRAINT [PK_TP_NEWPREV] PRIMARY KEY CLUSTERED ([CODART] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_NEWPREV] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_NEWPREV] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_NEWPREV] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_NEWPREV] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_NEWPREV] TO [Metodo98]
    AS [dbo];

