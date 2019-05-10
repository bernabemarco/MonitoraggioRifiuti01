CREATE TABLE [dbo].[ModuloQualita] (
    [CodModulo]             NVARCHAR (16)  CONSTRAINT [DF_ModuloQual_CodModulo_1__10] DEFAULT ('') NOT NULL,
    [Revisione]             NVARCHAR (5)   NULL,
    [DesModulo]             NVARCHAR (50)  NULL,
    [Tabella]               NVARCHAR (32)  NULL,
    [Larghezza]             SMALLINT       NULL,
    [Altezza]               SMALLINT       NULL,
    [Aspetto]               NVARCHAR (1)   NULL,
    [TipoModulo]            SMALLINT       NULL,
    [OrdinePresentaz]       SMALLINT       NULL,
    [ModelloWord]           NVARCHAR (50)  NULL,
    [QueryApertura]         NTEXT          NULL,
    [Classe]                NVARCHAR (1)   NULL,
    [UsedControls]          NVARCHAR (50)  NULL,
    [VisibileSuMenuNuovo]   NVARCHAR (1)   NULL,
    [VisibileSuMenuApri]    NVARCHAR (1)   NULL,
    [VisibileSuMenuGrafico] NVARCHAR (1)   NULL,
    [OleServer]             NVARCHAR (50)  NULL,
    [OleSuIns]              NVARCHAR (32)  NULL,
    [OleSuMod]              NVARCHAR (32)  NULL,
    [OleSuFirma]            NVARCHAR (32)  NULL,
    [idProgressivo]         NVARCHAR (16)  NULL,
    [idProgressivoRev]      NVARCHAR (16)  NULL,
    [CampoIdDocumento]      NVARCHAR (255) NULL,
    [CampoEdizione]         NVARCHAR (32)  NULL,
    [CampoRevisione]        NVARCHAR (32)  NULL,
    [CampoDataRev]          NVARCHAR (32)  NULL,
    [TipoCampoIdDoc]        NVARCHAR (1)   NULL,
    [TipoCampoEdizione]     NVARCHAR (1)   NULL,
    [TipoCampoRev]          NVARCHAR (1)   NULL,
    [TipoCampoDataRev]      NVARCHAR (1)   NULL,
    [CampoStatoInterno]     NVARCHAR (32)  NULL,
    [FirmeFineBozza]        NVARCHAR (50)  NULL,
    [FirmeApprovazione]     NVARCHAR (50)  NULL,
    [FormatoIdDocumento]    NVARCHAR (50)  NULL,
    [ConsentiElimina]       NVARCHAR (1)   NULL,
    [CampoVariante]         NVARCHAR (32)  NULL,
    [TipoCampoVariante]     NVARCHAR (1)   NULL,
    [commento]              NVARCHAR (50)  NULL,
    [ModelloCrystal]        NVARCHAR (50)  NULL,
    CONSTRAINT [PK_ModuloQualita] PRIMARY KEY NONCLUSTERED ([CodModulo] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [idProgressivo]
    ON [dbo].[ModuloQualita]([idProgressivo] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ModuloQualita] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ModuloQualita] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ModuloQualita] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ModuloQualita] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ModuloQualita] TO [Metodo98]
    AS [dbo];

