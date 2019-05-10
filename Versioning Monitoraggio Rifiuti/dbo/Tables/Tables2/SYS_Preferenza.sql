CREATE TABLE [dbo].[SYS_Preferenza] (
    [CodPref] NVARCHAR (80) CONSTRAINT [DF_SYS_Prefer_CodPref_1__10] DEFAULT ('') NOT NULL,
    [DesPref] NTEXT         NULL,
    CONSTRAINT [PK_SYS_Preferenza] PRIMARY KEY NONCLUSTERED ([CodPref] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SYS_Preferenza] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SYS_Preferenza] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SYS_Preferenza] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SYS_Preferenza] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SYS_Preferenza] TO [Metodo98]
    AS [dbo];

