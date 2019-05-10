CREATE TABLE [dbo].[BudWAnalisiScostamentiRighe] (
    [NrTerminale]       DECIMAL (5)     NOT NULL,
    [NumRiga]           DECIMAL (10)    NOT NULL,
    [Codice]            VARCHAR (50)    DEFAULT ('') NULL,
    [Descrizione]       VARCHAR (200)   DEFAULT ('') NULL,
    [Grassetto]         SMALLINT        DEFAULT (0) NULL,
    [Indentazione]      SMALLINT        DEFAULT (0) NULL,
    [QuantitaRif]       DECIMAL (16, 6) DEFAULT (0) NULL,
    [ValoreRif]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [PrezzoRif]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [QuantitaCon]       DECIMAL (16, 6) DEFAULT (0) NULL,
    [ValoreCon]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [PrezzoCon]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [ScostamentoQta]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [ScostamentoPrezzo] DECIMAL (19, 6) DEFAULT (0) NULL,
    [ScostamentoMix]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [ScostamentoTotale] DECIMAL (19, 6) DEFAULT (0) NULL,
    [DesTipologia]      VARCHAR (200)   DEFAULT ('') NULL,
    [UtenteModifica]    VARCHAR (25)    NOT NULL,
    [DataModifica]      DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [NumRiga] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudWAnalisiScostamentiRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudWAnalisiScostamentiRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudWAnalisiScostamentiRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudWAnalisiScostamentiRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudWAnalisiScostamentiRighe] TO [Metodo98]
    AS [dbo];

