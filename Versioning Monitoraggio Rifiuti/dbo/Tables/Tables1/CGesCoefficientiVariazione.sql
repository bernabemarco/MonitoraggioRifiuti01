CREATE TABLE [dbo].[CGesCoefficientiVariazione] (
    [Codice]         VARCHAR (3)    NOT NULL,
    [Descrizione]    VARCHAR (80)   DEFAULT ('') NULL,
    [PercVariabile]  DECIMAL (7, 2) DEFAULT (0) NULL,
    [PercFisso]      DECIMAL (7, 2) DEFAULT (0) NULL,
    [Note]           VARCHAR (100)  DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)   NOT NULL,
    [DataModifica]   DATETIME       NOT NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesCoefficientiVariazione] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesCoefficientiVariazione] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesCoefficientiVariazione] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesCoefficientiVariazione] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesCoefficientiVariazione] TO [Metodo98]
    AS [dbo];

