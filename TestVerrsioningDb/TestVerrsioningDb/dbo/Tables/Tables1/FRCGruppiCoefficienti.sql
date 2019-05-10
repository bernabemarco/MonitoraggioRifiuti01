CREATE TABLE [dbo].[FRCGruppiCoefficienti] (
    [Codice]         VARCHAR (1)   NOT NULL,
    [Descrizione]    VARCHAR (100) DEFAULT ('') NULL,
    [TipoQualifica]  VARCHAR (3)   DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCGruppiCoefficienti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCGruppiCoefficienti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCGruppiCoefficienti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCGruppiCoefficienti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCGruppiCoefficienti] TO [Metodo98]
    AS [dbo];

