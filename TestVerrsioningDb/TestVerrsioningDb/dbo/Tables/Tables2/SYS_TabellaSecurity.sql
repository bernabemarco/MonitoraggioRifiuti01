CREATE TABLE [dbo].[SYS_TabellaSecurity] (
    [NomeTabella]        NVARCHAR (32) CONSTRAINT [DF_SYS_Tabell_NomeTabella_3__10] DEFAULT ('') NOT NULL,
    [CodGruppo]          NVARCHAR (5)  CONSTRAINT [DF_SYS_Tabell_CodGruppo_1__10] DEFAULT ('') NOT NULL,
    [TipoAutorizzazione] SMALLINT      NULL,
    CONSTRAINT [PK_SYS_TabellaSecurity] PRIMARY KEY NONCLUSTERED ([NomeTabella] ASC, [CodGruppo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SYS_TabellaSecurity] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SYS_TabellaSecurity] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SYS_TabellaSecurity] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SYS_TabellaSecurity] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SYS_TabellaSecurity] TO [Metodo98]
    AS [dbo];

