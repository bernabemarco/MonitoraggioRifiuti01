CREATE TABLE [dbo].[BudRettificaQtaCatCA] (
    [CategoriaCliente]  DECIMAL (5)     NOT NULL,
    [CategoriaArticolo] DECIMAL (5)     NOT NULL,
    [Percentuale]       DECIMAL (16, 6) DEFAULT (0) NULL,
    [PercentualeV]      DECIMAL (16, 6) DEFAULT (0) NULL,
    [UtenteModifica]    VARCHAR (25)    NOT NULL,
    [DataModifica]      DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([CategoriaCliente] ASC, [CategoriaArticolo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudRettificaQtaCatCA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudRettificaQtaCatCA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudRettificaQtaCatCA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudRettificaQtaCatCA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudRettificaQtaCatCA] TO [Metodo98]
    AS [dbo];

