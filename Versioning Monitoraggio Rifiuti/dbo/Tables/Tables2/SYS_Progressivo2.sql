CREATE TABLE [dbo].[SYS_Progressivo2] (
    [CodModulo]       NVARCHAR (16) CONSTRAINT [DF_SYS_Progre_CodModulo_1__10] DEFAULT ('') NOT NULL,
    [TipoProgressivo] NVARCHAR (1)  CONSTRAINT [DF_SYS_Progre_TipoProgressivo_3__10] DEFAULT ('') NOT NULL,
    [Prefisso]        NVARCHAR (10) CONSTRAINT [DF_SYS_Progre_Prefisso_2__10] DEFAULT ('') NOT NULL,
    [Progressivo]     NVARCHAR (8)  NULL,
    CONSTRAINT [PK_SYS_Progressivo2] PRIMARY KEY NONCLUSTERED ([CodModulo] ASC, [TipoProgressivo] ASC, [Prefisso] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SYS_Progressivo2] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SYS_Progressivo2] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SYS_Progressivo2] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SYS_Progressivo2] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SYS_Progressivo2] TO [Metodo98]
    AS [dbo];

