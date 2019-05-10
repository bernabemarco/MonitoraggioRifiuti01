CREATE TABLE [dbo].[AccessiForm] (
    [CODUTENTE]      VARCHAR (50) NOT NULL,
    [HELPID]         NUMERIC (20) NOT NULL,
    [TIPOACCESSO]    NUMERIC (10) NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[AccessiForm] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[AccessiForm] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[AccessiForm] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[AccessiForm] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[AccessiForm] TO [Metodo98]
    AS [dbo];

