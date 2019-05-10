CREATE TABLE [dbo].[CGCPValoriDBOPD] (
    [IDTesta]        DECIMAL (10)    NOT NULL,
    [IDRiga]         INT             NOT NULL,
    [Tipo]           SMALLINT        NOT NULL,
    [Anno]           DECIMAL (5)     NOT NULL,
    [Mese]           INT             NOT NULL,
    [GruppoCosti]    VARCHAR (3)     NOT NULL,
    [CostoMedio]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoUltimo]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoStandard]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoBudget]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoSimulato]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([IDTesta] ASC, [IDRiga] ASC, [Tipo] ASC, [Anno] ASC, [Mese] ASC, [GruppoCosti] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPValoriDBOPD] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPValoriDBOPD] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPValoriDBOPD] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPValoriDBOPD] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPValoriDBOPD] TO [Metodo98]
    AS [dbo];

