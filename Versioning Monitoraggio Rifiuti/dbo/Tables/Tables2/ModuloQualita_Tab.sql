CREATE TABLE [dbo].[ModuloQualita_Tab] (
    [CodModulo]  NVARCHAR (16)  CONSTRAINT [DF_ModuloQual_CodModulo_13__10] DEFAULT ('') NOT NULL,
    [ProgrCampo] SMALLINT       CONSTRAINT [DF_ModuloQual_ProgrCampo_14__10] DEFAULT (0) NOT NULL,
    [TestoTab]   NVARCHAR (255) NULL,
    [Stile]      NVARCHAR (1)   NULL,
    CONSTRAINT [PK_ModuloQualita_Tab] PRIMARY KEY NONCLUSTERED ([CodModulo] ASC, [ProgrCampo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ModuloQualita_Tab] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ModuloQualita_Tab] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ModuloQualita_Tab] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ModuloQualita_Tab] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ModuloQualita_Tab] TO [Metodo98]
    AS [dbo];

