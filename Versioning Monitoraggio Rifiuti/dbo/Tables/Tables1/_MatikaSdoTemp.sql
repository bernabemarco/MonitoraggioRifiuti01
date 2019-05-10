CREATE TABLE [dbo].[_MatikaSdoTemp] (
    [Conto]     VARCHAR (7)     NOT NULL,
    [Saldo]     DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [esercizio] INT             NULL,
    PRIMARY KEY CLUSTERED ([Conto] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[_MatikaSdoTemp] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[_MatikaSdoTemp] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[_MatikaSdoTemp] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[_MatikaSdoTemp] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[_MatikaSdoTemp] TO [Metodo98]
    AS [dbo];

