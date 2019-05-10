CREATE TABLE [dbo].[BudDatiVariAzienda] (
    [Codice]             DECIMAL (5)   NOT NULL,
    [DesLivelloCliente1] VARCHAR (30)  DEFAULT ('') NULL,
    [DesLivelloCliente2] VARCHAR (30)  DEFAULT ('') NULL,
    [DesLivelloCliente3] VARCHAR (30)  DEFAULT ('') NULL,
    [PrefissoMPS]        VARCHAR (10)  DEFAULT ('') NULL,
    [SuffissoMPS]        VARCHAR (10)  DEFAULT ('') NULL,
    [Note]               VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica]     VARCHAR (25)  NOT NULL,
    [DataModifica]       DATETIME      NOT NULL,
    [ClienteAzienda]     VARCHAR (7)   DEFAULT ('') NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudDatiVariAzienda] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudDatiVariAzienda] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudDatiVariAzienda] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudDatiVariAzienda] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudDatiVariAzienda] TO [Metodo98]
    AS [dbo];

