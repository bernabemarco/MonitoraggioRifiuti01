CREATE TABLE [dbo].[CGCPWAttribuzioniRighe] (
    [NrTerminale]       DECIMAL (5)     NOT NULL,
    [Categoria]         DECIMAL (5)     NOT NULL,
    [Articolo]          VARCHAR (50)    NOT NULL,
    [OggettoCalcolo]    VARCHAR (10)    NOT NULL,
    [ValoreVariabile]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [ValoreFisso]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [Percentuale]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [DesArticolo]       VARCHAR (200)   DEFAULT ('') NULL,
    [DesOggettoCalcolo] VARCHAR (200)   DEFAULT ('') NULL,
    [Tipo]              SMALLINT        DEFAULT (1) NULL,
    [UtenteModifica]    VARCHAR (25)    NOT NULL,
    [DataModifica]      DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [Categoria] ASC, [Articolo] ASC, [OggettoCalcolo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPWAttribuzioniRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPWAttribuzioniRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPWAttribuzioniRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPWAttribuzioniRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPWAttribuzioniRighe] TO [Metodo98]
    AS [dbo];

