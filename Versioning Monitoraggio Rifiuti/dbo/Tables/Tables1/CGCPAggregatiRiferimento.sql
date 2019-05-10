CREATE TABLE [dbo].[CGCPAggregatiRiferimento] (
    [Codice]         VARCHAR (10)  NOT NULL,
    [Descrizione]    VARCHAR (80)  DEFAULT ('') NULL,
    [OggettoCalcolo] VARCHAR (10)  DEFAULT ('') NULL,
    [Listino]        DECIMAL (5)   DEFAULT (0) NULL,
    [Note]           VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPAggregatiRiferimento] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPAggregatiRiferimento] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPAggregatiRiferimento] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPAggregatiRiferimento] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPAggregatiRiferimento] TO [Metodo98]
    AS [dbo];

