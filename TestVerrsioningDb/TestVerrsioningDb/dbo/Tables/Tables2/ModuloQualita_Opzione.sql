CREATE TABLE [dbo].[ModuloQualita_Opzione] (
    [CodModulo]       NVARCHAR (16)  CONSTRAINT [DF_ModuloQual_CodModulo_9__10] DEFAULT ('') NOT NULL,
    [ProgrCampo]      SMALLINT       CONSTRAINT [DF_ModuloQual_ProgrCampo_10__10] DEFAULT (0) NOT NULL,
    [NomeCampoDB]     NVARCHAR (32)  NULL,
    [LunghMax]        SMALLINT       NULL,
    [Valore]          NVARCHAR (50)  NULL,
    [Tipo]            NVARCHAR (20)  NULL,
    [Allineamento]    SMALLINT       NULL,
    [OleServer]       NVARCHAR (255) NULL,
    [OleSuClick]      NVARCHAR (32)  NULL,
    [SecGrup]         SMALLINT       NULL,
    [Default]         NVARCHAR (1)   NULL,
    [FlgObbligatorio] NVARCHAR (1)   NULL,
    [FlgAbilitato]    NVARCHAR (1)   NULL,
    CONSTRAINT [PK_ModuloQualita_Opzione] PRIMARY KEY NONCLUSTERED ([CodModulo] ASC, [ProgrCampo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ModuloQualita_Opzione] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ModuloQualita_Opzione] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ModuloQualita_Opzione] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ModuloQualita_Opzione] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ModuloQualita_Opzione] TO [Metodo98]
    AS [dbo];

