CREATE TABLE [dbo].[CommesseCollegate] (
    [RifProgressivo]      DECIMAL (10) NOT NULL,
    [ProgressivoCommColl] DECIMAL (10) NOT NULL,
    [UTENTEMODIFICA]      VARCHAR (25) NOT NULL,
    [DATAMODIFICA]        DATETIME     NOT NULL,
    CONSTRAINT [CommesseCollegate_PK] PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [ProgressivoCommColl] ASC),
    CONSTRAINT [FK_COMMESSECOLLEGATE_PROGRESSIVOCOMMCOLL] FOREIGN KEY ([ProgressivoCommColl]) REFERENCES [dbo].[AnagraficaCommesse] ([Progressivo]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CommesseCollegate] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CommesseCollegate] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CommesseCollegate] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CommesseCollegate] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CommesseCollegate] TO [Metodo98]
    AS [dbo];

