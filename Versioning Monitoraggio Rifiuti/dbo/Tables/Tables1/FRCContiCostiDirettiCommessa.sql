CREATE TABLE [dbo].[FRCContiCostiDirettiCommessa] (
    [CodConto]       VARCHAR (7)  NOT NULL,
    [Tipo]           SMALLINT     DEFAULT ((0)) NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([CodConto] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCContiCostiDirettiCommessa] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCContiCostiDirettiCommessa] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCContiCostiDirettiCommessa] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCContiCostiDirettiCommessa] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCContiCostiDirettiCommessa] TO [Metodo98]
    AS [dbo];

