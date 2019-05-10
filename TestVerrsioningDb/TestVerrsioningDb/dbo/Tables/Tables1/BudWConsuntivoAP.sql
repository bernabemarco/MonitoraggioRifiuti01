CREATE TABLE [dbo].[BudWConsuntivoAP] (
    [NrTerminale]    DECIMAL (5)     NOT NULL,
    [Articolo]       VARCHAR (50)    NOT NULL,
    [Anno]           INT             NOT NULL,
    [Mese]           INT             NOT NULL,
    [Quantita]       DECIMAL (16, 6) DEFAULT (0) NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [Articolo] ASC, [Anno] ASC, [Mese] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudWConsuntivoAP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudWConsuntivoAP] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudWConsuntivoAP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudWConsuntivoAP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudWConsuntivoAP] TO [Metodo98]
    AS [dbo];

