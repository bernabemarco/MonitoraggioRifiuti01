﻿CREATE TABLE [dbo].[MB_RAGGRUPPAMENTO_CODICI_RIGHE] (
    [CODRAGGRUPPAMENTO] DECIMAL (5)  NOT NULL,
    [CODSCONTO]         VARCHAR (5)  NOT NULL,
    [UtenteModifica]    VARCHAR (25) NOT NULL,
    [DataModifica]      DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([CODRAGGRUPPAMENTO] ASC, [CODSCONTO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[MB_RAGGRUPPAMENTO_CODICI_RIGHE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MB_RAGGRUPPAMENTO_CODICI_RIGHE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[MB_RAGGRUPPAMENTO_CODICI_RIGHE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MB_RAGGRUPPAMENTO_CODICI_RIGHE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MB_RAGGRUPPAMENTO_CODICI_RIGHE] TO [Metodo98]
    AS [dbo];

