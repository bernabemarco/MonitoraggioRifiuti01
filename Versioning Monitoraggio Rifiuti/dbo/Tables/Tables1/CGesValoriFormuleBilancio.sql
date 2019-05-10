CREATE TABLE [dbo].[CGesValoriFormuleBilancio] (
    [ProgressivoFormula] DECIMAL (10)    NOT NULL,
    [Ambiente]           VARCHAR (3)     NOT NULL,
    [AnnoInizio]         DECIMAL (5)     NOT NULL,
    [MeseInizio]         INT             NOT NULL,
    [AnnoFine]           DECIMAL (5)     NOT NULL,
    [MeseFine]           INT             NOT NULL,
    [Valore]             DECIMAL (19, 6) DEFAULT (0) NULL,
    [NumSelezione]       INT             DEFAULT (0) NULL,
    [Intestazione]       VARCHAR (50)    DEFAULT ('') NULL,
    [UtenteModifica]     VARCHAR (25)    NOT NULL,
    [DataModifica]       DATETIME        NOT NULL,
    [Nome]               VARCHAR (50)    DEFAULT ('') NULL,
    [NumeroOrdine]       INT             DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([ProgressivoFormula] ASC, [Ambiente] ASC, [AnnoInizio] ASC, [MeseInizio] ASC, [AnnoFine] ASC, [MeseFine] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesValoriFormuleBilancio] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesValoriFormuleBilancio] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesValoriFormuleBilancio] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesValoriFormuleBilancio] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesValoriFormuleBilancio] TO [Metodo98]
    AS [dbo];

