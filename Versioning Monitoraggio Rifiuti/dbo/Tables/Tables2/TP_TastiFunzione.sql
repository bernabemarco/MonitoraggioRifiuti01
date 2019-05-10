CREATE TABLE [dbo].[TP_TastiFunzione] (
    [Modulo]     CHAR (50) NULL,
    [Tasto]      CHAR (60) NULL,
    [Componente] CHAR (50) NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_TastiFunzione] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_TastiFunzione] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_TastiFunzione] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_TastiFunzione] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_TastiFunzione] TO [Metodo98]
    AS [dbo];

