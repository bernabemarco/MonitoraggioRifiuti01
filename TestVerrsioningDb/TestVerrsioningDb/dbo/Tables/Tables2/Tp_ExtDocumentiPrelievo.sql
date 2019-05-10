CREATE TABLE [dbo].[Tp_ExtDocumentiPrelievo] (
    [RifCodDoc]      VARCHAR (3)  NOT NULL,
    [CodDocPrl]      VARCHAR (3)  NOT NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([RifCodDoc] ASC, [CodDocPrl] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Tp_ExtDocumentiPrelievo] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Tp_ExtDocumentiPrelievo] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Tp_ExtDocumentiPrelievo] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Tp_ExtDocumentiPrelievo] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Tp_ExtDocumentiPrelievo] TO [Metodo98]
    AS [dbo];

