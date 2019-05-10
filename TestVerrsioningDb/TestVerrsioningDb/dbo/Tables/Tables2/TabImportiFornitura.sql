CREATE TABLE [dbo].[TabImportiFornitura] (
    [CODICE]         NUMERIC (5)  NOT NULL,
    [DESCRIZIONE]    VARCHAR (80) NULL,
    [UTENTEMODIFICA] VARCHAR (25) NULL,
    [DATAMODIFICA]   DATETIME     NULL,
    CONSTRAINT [TabImportiFornitura_PK] PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TabImportiFornitura] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TabImportiFornitura] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TabImportiFornitura] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TabImportiFornitura] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TabImportiFornitura] TO [Metodo98]
    AS [dbo];

