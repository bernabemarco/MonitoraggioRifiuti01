﻿CREATE TABLE [dbo].[TP_BORDERAUXTESTE] (
    [PROGRESSIVO]    INT             NOT NULL,
    [CODSPEDIZ]      DECIMAL (5)     NOT NULL,
    [TOTDOCEURO]     DECIMAL (19, 4) NOT NULL,
    [TOTDOCVALUTA]   DECIMAL (19, 4) NOT NULL,
    [DATAUSCITA]     DATETIME        NOT NULL,
    [ORAUSCITA]      CHAR (5)        NOT NULL,
    [ESERCIZIO]      DECIMAL (5)     NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    CONSTRAINT [PK_TP_BORDERAUXTESTE] PRIMARY KEY NONCLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_BORDERAUXTESTE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_BORDERAUXTESTE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_BORDERAUXTESTE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_BORDERAUXTESTE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_BORDERAUXTESTE] TO [Metodo98]
    AS [dbo];
