CREATE TABLE [dbo].[TP_Note] (
    [PROGRESSIVO] NUMERIC (18)   IDENTITY (1, 1) NOT NULL,
    [CodArt]      VARCHAR (50)   NOT NULL,
    [Chiave]      VARCHAR (50)   NOT NULL,
    [Note]        VARCHAR (3000) NULL
);


GO
CREATE NONCLUSTERED INDEX [TP_NoteArtKey]
    ON [dbo].[TP_Note]([CodArt] ASC, [Chiave] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [TP_Note_CodArt]
    ON [dbo].[TP_Note]([CodArt] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_Note] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_Note] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_Note] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_Note] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_Note] TO [Metodo98]
    AS [dbo];

