CREATE TABLE [dbo].[ModuloQualita_Grid] (
    [CodModulo]       NVARCHAR (16) CONSTRAINT [DF_ModuloQual_CodModulo_6__10] DEFAULT ('') NOT NULL,
    [ProgrCampo]      SMALLINT      CONSTRAINT [DF_ModuloQual_ProgrCampo_7__10] DEFAULT (0) NOT NULL,
    [Tabella]         NVARCHAR (32) NULL,
    [MaxRighe]        SMALLINT      NULL,
    [AltezzaRiga]     SMALLINT      NULL,
    [Default]         NTEXT         NULL,
    [Destinazioni]    NTEXT         NULL,
    [FastLoadSQL]     NTEXT         NULL,
    [ARigheVariabili] NVARCHAR (1)  NULL,
    [EntityColumns]   NVARCHAR (50) NULL,
    [RigheIniziali]   SMALLINT      NULL,
    [EliminaRighe]    NVARCHAR (1)  NULL,
    [CampoControllo]  NVARCHAR (32) NULL,
    CONSTRAINT [PK_ModuloQualita_Grid] PRIMARY KEY NONCLUSTERED ([CodModulo] ASC, [ProgrCampo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ModuloQualita_Grid] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ModuloQualita_Grid] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ModuloQualita_Grid] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ModuloQualita_Grid] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ModuloQualita_Grid] TO [Metodo98]
    AS [dbo];

