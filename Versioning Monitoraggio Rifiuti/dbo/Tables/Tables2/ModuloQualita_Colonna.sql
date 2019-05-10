CREATE TABLE [dbo].[ModuloQualita_Colonna] (
    [CodModulo]              NVARCHAR (16)  CONSTRAINT [DF_ModuloQual_CodModulo_3__10] DEFAULT ('') NOT NULL,
    [ProgrCampo]             SMALLINT       CONSTRAINT [DF_ModuloQual_ProgrCampo_4__10] DEFAULT (0) NOT NULL,
    [ProgrColonna]           SMALLINT       CONSTRAINT [DF_ModuloQual_ProgrColonna_5__10] DEFAULT (0) NOT NULL,
    [NomeColonna]            NVARCHAR (32)  NULL,
    [PosizColonna]           SMALLINT       NULL,
    [IntestazColonna]        NVARCHAR (50)  NULL,
    [LarghCol]               SMALLINT       NULL,
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
    CONSTRAINT [PK_ModuloQualita_Colonna] PRIMARY KEY NONCLUSTERED ([CodModulo] ASC, [ProgrCampo] ASC, [ProgrColonna] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ModuloQualita_Colonna] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ModuloQualita_Colonna] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ModuloQualita_Colonna] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ModuloQualita_Colonna] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ModuloQualita_Colonna] TO [Metodo98]
    AS [dbo];

