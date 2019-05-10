CREATE TABLE [dbo].[TP_UtentiConnessi] (
    [Utente]          VARCHAR (25) NOT NULL,
    [ORDINECLIENTE]   CHAR (1)     NULL,
    [DISTINTAINCASSO] CHAR (1)     NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_UtentiConnessi] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_UtentiConnessi] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_UtentiConnessi] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_UtentiConnessi] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_UtentiConnessi] TO [Metodo98]
    AS [dbo];

