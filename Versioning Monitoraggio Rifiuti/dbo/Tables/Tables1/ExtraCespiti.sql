CREATE TABLE [dbo].[ExtraCespiti] (
    [CodCespite]     VARCHAR (10) NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [ExtraCespiti_PK] PRIMARY KEY CLUSTERED ([CodCespite] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_EXTRACESPITI_CODCESPITE] FOREIGN KEY ([CodCespite]) REFERENCES [dbo].[AnagraficaCespiti] ([Codice]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ExtraCespiti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ExtraCespiti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ExtraCespiti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ExtraCespiti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ExtraCespiti] TO [Metodo98]
    AS [dbo];

