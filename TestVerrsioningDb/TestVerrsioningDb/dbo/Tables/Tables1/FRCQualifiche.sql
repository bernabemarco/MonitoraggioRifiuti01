CREATE TABLE [dbo].[FRCQualifiche] (
    [Codice]              INT           NOT NULL,
    [Descrizione]         VARCHAR (100) DEFAULT ('') NULL,
    [TipoQualifica]       VARCHAR (3)   DEFAULT ('') NULL,
    [CodiceRif]           INT           DEFAULT ((0)) NULL,
    [CodiceDistribuzione] VARCHAR (3)   DEFAULT ('') NULL,
    [Note]                VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica]      VARCHAR (25)  NOT NULL,
    [DataModifica]        DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCQualifiche] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCQualifiche] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCQualifiche] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCQualifiche] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCQualifiche] TO [Metodo98]
    AS [dbo];

