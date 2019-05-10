CREATE TABLE [dbo].[SL_stpetichetteartnumeri] (
    [Terminale] VARCHAR (25) NOT NULL,
    [Numero]    INT          NOT NULL,
    [ESERCIZIO] DECIMAL (5)  NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SL_stpetichetteartnumeri] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SL_stpetichetteartnumeri] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SL_stpetichetteartnumeri] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SL_stpetichetteartnumeri] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SL_stpetichetteartnumeri] TO [Metodo98]
    AS [dbo];

