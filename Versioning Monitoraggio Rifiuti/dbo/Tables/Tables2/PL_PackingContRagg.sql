CREATE TABLE [dbo].[PL_PackingContRagg] (
    [Packing] DECIMAL (18) DEFAULT ((0)) NOT NULL,
    [NumRagg] DECIMAL (18) DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Packing] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PL_PackingContRagg] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PL_PackingContRagg] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PL_PackingContRagg] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PL_PackingContRagg] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PL_PackingContRagg] TO [Metodo98]
    AS [dbo];

