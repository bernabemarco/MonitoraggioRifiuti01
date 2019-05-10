CREATE TABLE [dbo].[BudWClientiBudget] (
    [NrTerminale] DECIMAL (5) NOT NULL,
    [Cliente]     VARCHAR (7) NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudWClientiBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudWClientiBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudWClientiBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudWClientiBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudWClientiBudget] TO [Metodo98]
    AS [dbo];

