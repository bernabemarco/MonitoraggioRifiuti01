CREATE TABLE [dbo].[Tp_DocumentiEsportati] (
    [CodAgente]      VARCHAR (7)  NOT NULL,
    [IdSessione]     INT          NOT NULL,
    [Progressivo]    DECIMAL (10) NOT NULL,
    [UtenteModifica] VARCHAR (25) NULL,
    [DataModifica]   DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([CodAgente] ASC, [IdSessione] ASC, [Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Tp_DocumentiEsportati] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Tp_DocumentiEsportati] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Tp_DocumentiEsportati] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Tp_DocumentiEsportati] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Tp_DocumentiEsportati] TO [Metodo98]
    AS [dbo];

