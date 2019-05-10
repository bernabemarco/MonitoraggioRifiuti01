CREATE TABLE [dbo].[ModuloQualita_Oggetto] (
    [CodModulo]     NVARCHAR (16)  CONSTRAINT [DF_ModuloQual_CodModulo_8__10] DEFAULT ('') NOT NULL,
    [ProgrCampo]    SMALLINT       CONSTRAINT [DF_ModuloQual_ProgrCampo_9__10] DEFAULT (0) NOT NULL,
    [NomeCampo]     NVARCHAR (32)  NULL,
    [Container]     REAL           NULL,
    [ContainerPage] REAL           NULL,
    [TestoCampo]    NVARCHAR (255) NULL,
    [ClasseCampo]   NVARCHAR (3)   NULL,
    [PosizioneX]    SMALLINT       NULL,
    [PosizioneY]    SMALLINT       NULL,
    [Larghezza]     SMALLINT       NULL,
    [Altezza]       SMALLINT       NULL,
    [IndiceTab]     SMALLINT       NULL,
    [FlgSystem]     NVARCHAR (1)   NULL,
    CONSTRAINT [PK_ModuloQualita_Oggetto] PRIMARY KEY NONCLUSTERED ([CodModulo] ASC, [ProgrCampo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ModuloQualita_Oggetto] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ModuloQualita_Oggetto] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ModuloQualita_Oggetto] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ModuloQualita_Oggetto] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ModuloQualita_Oggetto] TO [Metodo98]
    AS [dbo];

