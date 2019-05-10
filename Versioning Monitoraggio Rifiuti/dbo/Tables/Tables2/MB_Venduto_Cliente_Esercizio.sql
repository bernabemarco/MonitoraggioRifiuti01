CREATE TABLE [dbo].[MB_Venduto_Cliente_Esercizio] (
    [ESERCIZIO] DECIMAL (5)     NOT NULL,
    [CODART]    VARCHAR (50)    NULL,
    [QtaTot]    DECIMAL (38, 6) NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[MB_Venduto_Cliente_Esercizio] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MB_Venduto_Cliente_Esercizio] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MB_Venduto_Cliente_Esercizio] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MB_Venduto_Cliente_Esercizio] TO [Metodo98]
    AS [dbo];

