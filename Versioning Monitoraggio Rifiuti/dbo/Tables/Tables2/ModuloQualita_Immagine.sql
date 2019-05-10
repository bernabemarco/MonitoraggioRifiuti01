CREATE TABLE [dbo].[ModuloQualita_Immagine] (
    [CodModulo]    NVARCHAR (16)  CONSTRAINT [DF_ModuloQual_CodModulo_7__10] DEFAULT ('') NOT NULL,
    [ProgrCampo]   SMALLINT       CONSTRAINT [DF_ModuloQual_ProgrCampo_8__10] DEFAULT (0) NOT NULL,
    [OleServer]    NVARCHAR (255) NULL,
    [OleSuClick]   NVARCHAR (255) NULL,
    [SecGrup]      SMALLINT       NULL,
    [FileImmagine] NVARCHAR (255) NULL,
    [Stretch]      NVARCHAR (1)   NULL,
    CONSTRAINT [PK_ModuloQualita_Immagine] PRIMARY KEY NONCLUSTERED ([CodModulo] ASC, [ProgrCampo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ModuloQualita_Immagine] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ModuloQualita_Immagine] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ModuloQualita_Immagine] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ModuloQualita_Immagine] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ModuloQualita_Immagine] TO [Metodo98]
    AS [dbo];

