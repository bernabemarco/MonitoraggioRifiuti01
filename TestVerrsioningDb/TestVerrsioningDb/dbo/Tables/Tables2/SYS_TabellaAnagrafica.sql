CREATE TABLE [dbo].[SYS_TabellaAnagrafica] (
    [NomeTabella]  NVARCHAR (32)  CONSTRAINT [DF_SYS_Tabell_NomeTabella_1__10] DEFAULT ('') NOT NULL,
    [Descrizione]  NVARCHAR (50)  NULL,
    [LarghezzeCol] NVARCHAR (150) NULL,
    [Ordinamento]  NVARCHAR (15)  NULL,
    CONSTRAINT [PK_SYS_TabellaAnagrafica] PRIMARY KEY NONCLUSTERED ([NomeTabella] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SYS_TabellaAnagrafica] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SYS_TabellaAnagrafica] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SYS_TabellaAnagrafica] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SYS_TabellaAnagrafica] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SYS_TabellaAnagrafica] TO [Metodo98]
    AS [dbo];

