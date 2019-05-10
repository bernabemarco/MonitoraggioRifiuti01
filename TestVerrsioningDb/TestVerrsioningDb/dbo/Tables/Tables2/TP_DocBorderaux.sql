CREATE TABLE [dbo].[TP_DocBorderaux] (
    [Cod_Doc]        VARCHAR (3)  NULL,
    [UtenteModifica] VARCHAR (25) NULL,
    [DataModifica]   DATETIME     NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_DocBorderaux] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_DocBorderaux] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_DocBorderaux] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_DocBorderaux] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_DocBorderaux] TO [Metodo98]
    AS [dbo];

