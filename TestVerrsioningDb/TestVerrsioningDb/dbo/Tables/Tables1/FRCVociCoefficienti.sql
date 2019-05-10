CREATE TABLE [dbo].[FRCVociCoefficienti] (
    [Codice]         VARCHAR (20)  NOT NULL,
    [Descrizione]    VARCHAR (100) DEFAULT ('') NULL,
    [Gruppo]         VARCHAR (1)   DEFAULT ('') NULL,
    [Percentuale]    SMALLINT      DEFAULT ((0)) NULL,
    [Ore]            SMALLINT      DEFAULT ((0)) NULL,
    [Note]           VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCVociCoefficienti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCVociCoefficienti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCVociCoefficienti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVociCoefficienti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCVociCoefficienti] TO [Metodo98]
    AS [dbo];

