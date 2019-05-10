CREATE TABLE [dbo].[FRCRiferimentoTemporale] (
    [Codice]         VARCHAR (50) NOT NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCRiferimentoTemporale] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCRiferimentoTemporale] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCRiferimentoTemporale] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCRiferimentoTemporale] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCRiferimentoTemporale] TO [Metodo98]
    AS [dbo];

