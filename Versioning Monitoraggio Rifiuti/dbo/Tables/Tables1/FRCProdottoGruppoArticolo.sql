CREATE TABLE [dbo].[FRCProdottoGruppoArticolo] (
    [Ambiente]       VARCHAR (3)  NOT NULL,
    [Gruppo]         DECIMAL (5)  NOT NULL,
    [CDRProdotto]    VARCHAR (10) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Ambiente] ASC, [Gruppo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCProdottoGruppoArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCProdottoGruppoArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCProdottoGruppoArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCProdottoGruppoArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCProdottoGruppoArticolo] TO [Metodo98]
    AS [dbo];

