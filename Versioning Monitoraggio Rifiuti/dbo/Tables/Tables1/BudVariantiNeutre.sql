CREATE TABLE [dbo].[BudVariantiNeutre] (
    [TipologiaProdotto] VARCHAR (5)  NOT NULL,
    [Tipologia]         VARCHAR (3)  NOT NULL,
    [VarianteNeutra]    VARCHAR (8)  DEFAULT ('') NULL,
    [UtenteModifica]    VARCHAR (25) NOT NULL,
    [DataModifica]      DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([TipologiaProdotto] ASC, [Tipologia] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudVariantiNeutre] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudVariantiNeutre] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudVariantiNeutre] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudVariantiNeutre] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudVariantiNeutre] TO [Metodo98]
    AS [dbo];

