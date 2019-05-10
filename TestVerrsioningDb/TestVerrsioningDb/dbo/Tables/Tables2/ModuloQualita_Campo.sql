CREATE TABLE [dbo].[ModuloQualita_Campo] (
    [CodModulo]              NVARCHAR (16)  CONSTRAINT [DF_ModuloQual_CodModulo_2__10] DEFAULT ('') NOT NULL,
    [ProgrCampo]             SMALLINT       CONSTRAINT [DF_ModuloQual_ProgrCampo_3__10] DEFAULT (0) NOT NULL,
    [Allineamento]           SMALLINT       NULL,
    [Tipo]                   NVARCHAR (20)  NULL,
    [FlgObbligatorio]        NVARCHAR (1)   NULL,
    [FlgFillzero]            NVARCHAR (1)   NULL,
    [FlgAbilitato]           NVARCHAR (1)   NULL,
    [IntDec]                 NVARCHAR (10)  NULL,
    [NomeCampoDb]            NVARCHAR (32)  NULL,
    [LunghMax]               SMALLINT       NULL,
    [lookuptype]             NVARCHAR (1)   NULL,
    [LookupTable]            NTEXT          NULL,
    [LookupDesField]         NTEXT          NULL,
    [NomeCampoDes]           NVARCHAR (255) NULL,
    [LookUpCondiz]           NTEXT          NULL,
    [FlgCondizElenco]        NVARCHAR (1)   NULL,
    [FlgLookUpNonVincolante] NVARCHAR (1)   NULL,
    [SecGrup]                SMALLINT       NULL,
    [CampoControllato]       NVARCHAR (32)  NULL,
    [FlgInvisibile]          NVARCHAR (1)   NULL,
    [FlgChiavePrimaria]      NVARCHAR (1)   NULL,
    [Default]                NVARCHAR (50)  NULL,
    [Formula]                NTEXT          NULL,
    [CampiCollegati]         NVARCHAR (100) NULL,
    [ParamNuovoModulo]       NTEXT          NULL,
    [LookupKeyField]         NVARCHAR (255) NULL,
    CONSTRAINT [PK_ModuloQualita_Campo] PRIMARY KEY NONCLUSTERED ([CodModulo] ASC, [ProgrCampo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ModuloQualita_Campo] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ModuloQualita_Campo] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ModuloQualita_Campo] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ModuloQualita_Campo] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ModuloQualita_Campo] TO [Metodo98]
    AS [dbo];

