CREATE TABLE [dbo].[TP_TIPI_DOC] (
    [Tipo]        INT          NOT NULL,
    [Descrizione] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Tipo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_TIPI_DOC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_TIPI_DOC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_TIPI_DOC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_TIPI_DOC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_TIPI_DOC] TO [Metodo98]
    AS [dbo];

