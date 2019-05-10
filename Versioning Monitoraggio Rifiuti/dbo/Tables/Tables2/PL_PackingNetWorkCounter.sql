CREATE TABLE [dbo].[PL_PackingNetWorkCounter] (
    [Progressivo] DECIMAL (19, 6) NOT NULL,
    [NrColli]     DECIMAL (19, 6) NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PL_PackingNetWorkCounter] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PL_PackingNetWorkCounter] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PL_PackingNetWorkCounter] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PL_PackingNetWorkCounter] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PL_PackingNetWorkCounter] TO [Metodo98]
    AS [dbo];

