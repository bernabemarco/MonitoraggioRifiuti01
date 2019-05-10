CREATE TABLE [dbo].[CGCPValoriCicloDettaglio] (
    [Articolo]               VARCHAR (50)    NOT NULL,
    [Anno]                   DECIMAL (5)     NOT NULL,
    [Mese]                   INT             NOT NULL,
    [GruppoCosti]            VARCHAR (3)     NOT NULL,
    [Raggruppamento]         VARCHAR (5)     NOT NULL,
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
    [UtenteModifica]         VARCHAR (25)    NOT NULL,
    [DataModifica]           DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Articolo] ASC, [Anno] ASC, [Mese] ASC, [GruppoCosti] ASC, [Raggruppamento] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPValoriCicloDettaglio] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPValoriCicloDettaglio] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPValoriCicloDettaglio] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPValoriCicloDettaglio] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPValoriCicloDettaglio] TO [Metodo98]
    AS [dbo];

