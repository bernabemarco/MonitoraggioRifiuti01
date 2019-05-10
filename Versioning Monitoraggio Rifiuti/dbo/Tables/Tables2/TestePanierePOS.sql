CREATE TABLE [dbo].[TestePanierePOS] (
    [Progressivo]    DECIMAL (10) NOT NULL,
    [Descrizione]    VARCHAR (25) NULL,
    [CodArt]         VARCHAR (50) NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TestePanierePOS] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TestePanierePOS] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TestePanierePOS] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TestePanierePOS] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TestePanierePOS] TO [Metodo98]
    AS [dbo];

