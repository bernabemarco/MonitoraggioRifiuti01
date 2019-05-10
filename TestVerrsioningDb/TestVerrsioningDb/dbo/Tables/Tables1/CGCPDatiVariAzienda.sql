CREATE TABLE [dbo].[CGCPDatiVariAzienda] (
    [Codice]               DECIMAL (5)   NOT NULL,
    [Gold]                 SMALLINT      DEFAULT (0) NULL,
    [IndiceMese]           SMALLINT      DEFAULT (0) NULL,
    [CostoMedio]           SMALLINT      DEFAULT (0) NULL,
    [CostoUltimo]          SMALLINT      DEFAULT (0) NULL,
    [CostoStandard]        SMALLINT      DEFAULT (0) NULL,
    [ListinoCostoStandard] DECIMAL (5)   DEFAULT (0) NULL,
    [CostoBudget]          SMALLINT      DEFAULT (0) NULL,
    [ListinoCostoBudget]   DECIMAL (5)   DEFAULT (0) NULL,
    [CostoSimulato]        SMALLINT      DEFAULT (0) NULL,
    [ListinoCostoSimulato] DECIMAL (5)   DEFAULT (0) NULL,
    [DecimaliScheda]       SMALLINT      DEFAULT (0) NULL,
    [Note]                 VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica]       VARCHAR (25)  NOT NULL,
    [DataModifica]         DATETIME      NOT NULL,
    [TipoCostoTrasf]       SMALLINT      DEFAULT (0) NULL,
    [GruppoLavEst]         VARCHAR (3)   DEFAULT ('') NULL,
    [GruppoMatAcq]         VARCHAR (3)   DEFAULT ('') NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPDatiVariAzienda] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPDatiVariAzienda] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPDatiVariAzienda] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPDatiVariAzienda] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPDatiVariAzienda] TO [Metodo98]
    AS [dbo];

