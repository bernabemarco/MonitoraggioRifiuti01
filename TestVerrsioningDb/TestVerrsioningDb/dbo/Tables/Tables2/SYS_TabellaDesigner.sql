CREATE TABLE [dbo].[SYS_TabellaDesigner] (
    [NomeTabella]  NVARCHAR (32)  CONSTRAINT [DF_SYS_Tabell_NomeTabella_2__10] DEFAULT ('') NOT NULL,
    [Descrizione]  NVARCHAR (50)  NULL,
    [LarghezzeCol] NVARCHAR (150) NULL,
    CONSTRAINT [PK_SYS_TabellaDesigner] PRIMARY KEY NONCLUSTERED ([NomeTabella] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SYS_TabellaDesigner] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SYS_TabellaDesigner] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SYS_TabellaDesigner] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SYS_TabellaDesigner] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SYS_TabellaDesigner] TO [Metodo98]
    AS [dbo];

