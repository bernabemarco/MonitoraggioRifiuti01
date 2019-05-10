CREATE TABLE [dbo].[CGCPWImportCostoMateriali] (
    [Progressivo]       DECIMAL (10)    NOT NULL,
    [Articolo]          VARCHAR (50)    DEFAULT ('') NULL,
    [Anno]              DECIMAL (5)     DEFAULT (0) NULL,
    [Mese]              INT             DEFAULT (0) NULL,
    [GruppoCosti]       VARCHAR (3)     DEFAULT ('') NULL,
    [CostoMedio]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoUltimo]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoStandard]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoBudget]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoSimulato]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [DataRegistrazione] DATETIME        NULL,
    [FlagVal]           SMALLINT        DEFAULT (0) NULL,
    [DescrizioneErrore] VARCHAR (200)   DEFAULT ('') NULL,
    [UtenteModifica]    VARCHAR (25)    NOT NULL,
    [DataModifica]      DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPWImportCostoMateriali] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPWImportCostoMateriali] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPWImportCostoMateriali] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPWImportCostoMateriali] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPWImportCostoMateriali] TO [Metodo98]
    AS [dbo];

