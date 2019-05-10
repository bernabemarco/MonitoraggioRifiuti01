CREATE TABLE [dbo].[FRCProdottoModelloArticolo] (
    [Ambiente]       VARCHAR (3)  NOT NULL,
    [Modello]        VARCHAR (20) NOT NULL,
    [CDRProdotto]    VARCHAR (10) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Ambiente] ASC, [Modello] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCProdottoModelloArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCProdottoModelloArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCProdottoModelloArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCProdottoModelloArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCProdottoModelloArticolo] TO [Metodo98]
    AS [dbo];

