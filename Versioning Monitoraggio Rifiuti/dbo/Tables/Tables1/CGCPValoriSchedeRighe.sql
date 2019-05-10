CREATE TABLE [dbo].[CGCPValoriSchedeRighe] (
    [RifProgressivo]           DECIMAL (10)    NOT NULL,
    [Numero]                   INT             NOT NULL,
    [TipoScheda]               VARCHAR (5)     DEFAULT ('') NULL,
    [Voce]                     VARCHAR (10)    DEFAULT ('') NULL,
    [OrdineStampa]             INT             DEFAULT (0) NULL,
    [CostoMedioVariabilePI]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoMedioFissoPI]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoUltimoVariabilePI]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoUltimoFissoPI]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoStandardVariabilePI] DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoStandardFissoPI]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoBudgetVariabilePI]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoBudgetFissoPI]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoSimulatoVariabilePI] DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoSimulatoFissoPI]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoMedioVariabilePC]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoMedioFissoPC]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoUltimoVariabilePC]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoUltimoFissoPC]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoStandardVariabilePC] DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoStandardFissoPC]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoBudgetVariabilePC]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoBudgetFissoPC]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoSimulatoVariabilePC] DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoSimulatoFissoPC]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [UtenteModifica]           VARCHAR (25)    NOT NULL,
    [DataModifica]             DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [Numero] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPValoriSchedeRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPValoriSchedeRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPValoriSchedeRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPValoriSchedeRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPValoriSchedeRighe] TO [Metodo98]
    AS [dbo];

