CREATE TABLE [dbo].[ModuloQualita_Pulsante] (
    [CodModulo]  NVARCHAR (16)  CONSTRAINT [DF_ModuloQual_CodModulo_10__10] DEFAULT ('') NOT NULL,
    [ProgrCampo] SMALLINT       CONSTRAINT [DF_ModuloQual_ProgrCampo_11__10] DEFAULT (0) NOT NULL,
    [OleServer]  NVARCHAR (255) NULL,
    [OleSuClick] NVARCHAR (32)  NULL,
    [SecGrup]    SMALLINT       NULL,
    CONSTRAINT [PK_ModuloQualita_Pulsante] PRIMARY KEY NONCLUSTERED ([CodModulo] ASC, [ProgrCampo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ModuloQualita_Pulsante] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ModuloQualita_Pulsante] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ModuloQualita_Pulsante] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ModuloQualita_Pulsante] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ModuloQualita_Pulsante] TO [Metodo98]
    AS [dbo];

