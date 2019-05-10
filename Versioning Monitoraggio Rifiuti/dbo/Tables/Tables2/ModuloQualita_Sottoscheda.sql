CREATE TABLE [dbo].[ModuloQualita_Sottoscheda] (
    [CodModulo]  NVARCHAR (16) CONSTRAINT [DF_ModuloQual_CodModulo_11__10] DEFAULT ('') NOT NULL,
    [ProgrCampo] SMALLINT      CONSTRAINT [DF_ModuloQual_ProgrCampo_12__10] DEFAULT (0) NOT NULL,
    [TabellaDB]  NVARCHAR (32) NULL,
    [PosizioneX] SMALLINT      NULL,
    [PosizioneY] SMALLINT      NULL,
    [Larghezza]  SMALLINT      NULL,
    [Altezza]    SMALLINT      NULL,
    CONSTRAINT [PK_ModuloQualita_Sottoscheda] PRIMARY KEY NONCLUSTERED ([CodModulo] ASC, [ProgrCampo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ModuloQualita_Sottoscheda] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ModuloQualita_Sottoscheda] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ModuloQualita_Sottoscheda] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ModuloQualita_Sottoscheda] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ModuloQualita_Sottoscheda] TO [Metodo98]
    AS [dbo];

