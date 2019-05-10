CREATE TABLE [dbo].[TP_LOGSEDE] (
    [Tabella] VARCHAR (50) NULL,
    [Codice]  VARCHAR (50) NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_LOGSEDE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_LOGSEDE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_LOGSEDE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_LOGSEDE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_LOGSEDE] TO [Metodo98]
    AS [dbo];

