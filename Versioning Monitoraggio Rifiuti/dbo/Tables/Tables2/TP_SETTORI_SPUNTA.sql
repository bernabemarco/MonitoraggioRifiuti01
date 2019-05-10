CREATE TABLE [dbo].[TP_SETTORI_SPUNTA] (
    [Codice]         INT          NOT NULL,
    [Descrizione]    VARCHAR (50) NOT NULL,
    [DaUbicazione]   VARCHAR (10) NOT NULL,
    [aUbicazione]    VARCHAR (10) NOT NULL,
    [UtenteModifica] VARCHAR (25) NULL,
    [DataModifica]   DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_SETTORI_SPUNTA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_SETTORI_SPUNTA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_SETTORI_SPUNTA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_SETTORI_SPUNTA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_SETTORI_SPUNTA] TO [Metodo98]
    AS [dbo];

