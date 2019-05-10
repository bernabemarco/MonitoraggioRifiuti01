CREATE TABLE [dbo].[TP_ESPORTATI_EXPORT] (
    [Progressivo]    DECIMAL (10) NOT NULL,
    [Esportato]      SMALLINT     DEFAULT (0) NOT NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_ESPORTATI_EXPORT] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_ESPORTATI_EXPORT] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_ESPORTATI_EXPORT] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_ESPORTATI_EXPORT] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_ESPORTATI_EXPORT] TO [Metodo98]
    AS [dbo];

