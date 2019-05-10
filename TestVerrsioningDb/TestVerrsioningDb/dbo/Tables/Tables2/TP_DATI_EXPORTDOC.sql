CREATE TABLE [dbo].[TP_DATI_EXPORTDOC] (
    [RifProgressivo] DECIMAL (18) NOT NULL,
    [Posizione]      INT          NOT NULL,
    [NOMETABELLA]    VARCHAR (50) NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    CONSTRAINT [PK_TP_DATIDOC_EXPORT] PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [Posizione] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_DATI_EXPORTDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_DATI_EXPORTDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_DATI_EXPORTDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_DATI_EXPORTDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_DATI_EXPORTDOC] TO [Metodo98]
    AS [dbo];

