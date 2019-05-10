CREATE TABLE [dbo].[TP_MAILING_LIST] (
    [Codice]         NUMERIC (4)  NOT NULL,
    [Descrizione]    VARCHAR (50) NOT NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    CONSTRAINT [PK_TP_MAILING_LIST] PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_MAILING_LIST] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_MAILING_LIST] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_MAILING_LIST] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_MAILING_LIST] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_MAILING_LIST] TO [Metodo98]
    AS [dbo];

