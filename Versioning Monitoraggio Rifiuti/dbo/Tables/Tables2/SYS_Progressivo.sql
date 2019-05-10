CREATE TABLE [dbo].[SYS_Progressivo] (
    [CodModulo]   NVARCHAR (16) CONSTRAINT [DF_SYS_Progre_CodModulo_2__10] DEFAULT ('') NOT NULL,
    [Anno]        NVARCHAR (4)  CONSTRAINT [DF_SYS_Progre_Anno_1__10] DEFAULT ('') NOT NULL,
    [Progressivo] NVARCHAR (8)  NULL,
    CONSTRAINT [PK_SYS_Progressivo] PRIMARY KEY NONCLUSTERED ([CodModulo] ASC, [Anno] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SYS_Progressivo] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SYS_Progressivo] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SYS_Progressivo] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SYS_Progressivo] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SYS_Progressivo] TO [Metodo98]
    AS [dbo];

