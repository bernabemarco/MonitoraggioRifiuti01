CREATE TABLE [dbo].[ModuloQualita_Evento] (
    [CodModulo]   NVARCHAR (16) CONSTRAINT [DF_ModuloQual_CodModulo_5__10] DEFAULT ('') NOT NULL,
    [Oggetto]     NVARCHAR (32) CONSTRAINT [DF_ModuloQual_Oggetto_7__10] DEFAULT ('') NOT NULL,
    [Evento]      NVARCHAR (50) CONSTRAINT [DF_ModuloQual_Evento_6__10] DEFAULT ('') NOT NULL,
    [ProgrAzione] INT           CONSTRAINT [DF_ModuloQual_ProgrAzione_8__10] DEFAULT (0) NOT NULL,
    [Descrizione] NTEXT         NULL,
    [Azione]      NTEXT         NULL,
    [TipoAzione]  NVARCHAR (32) NULL,
    [SuErrore]    NVARCHAR (32) NULL,
    CONSTRAINT [PK_ModuloQualita_Evento] PRIMARY KEY NONCLUSTERED ([CodModulo] ASC, [Oggetto] ASC, [Evento] ASC, [ProgrAzione] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ModuloQualita_Evento] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ModuloQualita_Evento] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ModuloQualita_Evento] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ModuloQualita_Evento] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ModuloQualita_Evento] TO [Metodo98]
    AS [dbo];

