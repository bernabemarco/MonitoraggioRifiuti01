CREATE TABLE [dbo].[BudWModelliBudget] (
    [NrTerminale] DECIMAL (5)  NOT NULL,
    [Modello]     VARCHAR (50) NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudWModelliBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudWModelliBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudWModelliBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudWModelliBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudWModelliBudget] TO [Metodo98]
    AS [dbo];

