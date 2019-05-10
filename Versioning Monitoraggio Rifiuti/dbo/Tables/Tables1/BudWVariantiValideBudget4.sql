CREATE TABLE [dbo].[BudWVariantiValideBudget4] (
    [NrTerminale] DECIMAL (5)  NOT NULL,
    [Modello]     VARCHAR (50) NOT NULL,
    [Tipologia]   VARCHAR (3)  NOT NULL,
    [Variante]    VARCHAR (8)  NOT NULL,
    [Tipologia2]  VARCHAR (3)  NOT NULL,
    [Variante2]   VARCHAR (8)  NOT NULL,
    [Tipologia3]  VARCHAR (3)  NOT NULL,
    [Variante3]   VARCHAR (8)  NOT NULL,
    [Tipologia4]  VARCHAR (3)  NOT NULL,
    [Variante4]   VARCHAR (8)  NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudWVariantiValideBudget4] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudWVariantiValideBudget4] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudWVariantiValideBudget4] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudWVariantiValideBudget4] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudWVariantiValideBudget4] TO [Metodo98]
    AS [dbo];

