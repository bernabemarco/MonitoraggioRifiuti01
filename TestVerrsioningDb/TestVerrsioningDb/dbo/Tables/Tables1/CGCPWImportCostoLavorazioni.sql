CREATE TABLE [dbo].[CGCPWImportCostoLavorazioni] (
    [Progressivo]            DECIMAL (10)    NOT NULL,
    [Articolo]               VARCHAR (50)    DEFAULT ('') NULL,
    [Anno]                   DECIMAL (5)     DEFAULT (0) NULL,
    [Mese]                   INT             DEFAULT (0) NULL,
    [GruppoCosti]            VARCHAR (3)     DEFAULT ('') NULL,
    [CostoMedioVariabile]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoMedioFisso]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoUltimoVariabile]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoUltimoFisso]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoStandardVariabile] DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoStandardFisso]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoBudgetVariabile]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoBudgetFisso]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoSimulatoVariabile] DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoSimulatoFisso]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [DataRegistrazione]      DATETIME        NULL,
    [FlagVal]                SMALLINT        DEFAULT (0) NULL,
    [DescrizioneErrore]      VARCHAR (200)   DEFAULT ('') NULL,
    [UtenteModifica]         VARCHAR (25)    NOT NULL,
    [DataModifica]           DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPWImportCostoLavorazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPWImportCostoLavorazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPWImportCostoLavorazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPWImportCostoLavorazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPWImportCostoLavorazioni] TO [Metodo98]
    AS [dbo];

