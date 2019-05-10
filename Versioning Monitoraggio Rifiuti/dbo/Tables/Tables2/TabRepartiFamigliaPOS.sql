CREATE TABLE [dbo].[TabRepartiFamigliaPOS] (
    [CodFamiglia]    DECIMAL (5)  NOT NULL,
    [CodReparto]     DECIMAL (5)  NOT NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([CodFamiglia] ASC, [CodReparto] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TabRepartiFamigliaPOS] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TabRepartiFamigliaPOS] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TabRepartiFamigliaPOS] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TabRepartiFamigliaPOS] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TabRepartiFamigliaPOS] TO [Metodo98]
    AS [dbo];

