CREATE TABLE [dbo].[BudVariantiNeutreModello] (
    [TipologiaProdotto] VARCHAR (5)  NOT NULL,
    [Modello]           VARCHAR (50) NOT NULL,
    [Tipologia]         VARCHAR (3)  NOT NULL,
    [VarianteNeutra]    VARCHAR (8)  DEFAULT ('') NULL,
    [UtenteModifica]    VARCHAR (25) NOT NULL,
    [DataModifica]      DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([TipologiaProdotto] ASC, [Modello] ASC, [Tipologia] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudVariantiNeutreModello] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudVariantiNeutreModello] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudVariantiNeutreModello] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudVariantiNeutreModello] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudVariantiNeutreModello] TO [Metodo98]
    AS [dbo];

