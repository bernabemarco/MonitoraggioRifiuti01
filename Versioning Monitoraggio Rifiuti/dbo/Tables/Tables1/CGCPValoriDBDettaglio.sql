CREATE TABLE [dbo].[CGCPValoriDBDettaglio] (
    [Articolo]       VARCHAR (50)    NOT NULL,
    [Anno]           DECIMAL (5)     NOT NULL,
    [Mese]           INT             NOT NULL,
    [GruppoCosti]    VARCHAR (3)     NOT NULL,
    [ArticoloPadre]  VARCHAR (50)    NOT NULL,
    [CostoMedio]     DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [CostoUltimo]    DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [CostoStandard]  DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [CostoBudget]    DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [CostoSimulato]  DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Articolo] ASC, [Anno] ASC, [Mese] ASC, [GruppoCosti] ASC, [ArticoloPadre] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPValoriDBDettaglio] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPValoriDBDettaglio] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPValoriDBDettaglio] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPValoriDBDettaglio] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPValoriDBDettaglio] TO [Metodo98]
    AS [dbo];

