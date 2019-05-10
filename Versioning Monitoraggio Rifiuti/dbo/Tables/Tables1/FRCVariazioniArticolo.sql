CREATE TABLE [dbo].[FRCVariazioniArticolo] (
    [Ambiente]       VARCHAR (3)     NOT NULL,
    [Anno]           INT             NOT NULL,
    [MeseInizio]     INT             NOT NULL,
    [MeseFine]       INT             NOT NULL,
    [Articolo]       VARCHAR (50)    NOT NULL,
    [PercQuantita]   DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [PercPrezzo]     DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Ambiente] ASC, [Anno] ASC, [MeseInizio] ASC, [MeseFine] ASC, [Articolo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCVariazioniArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCVariazioniArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCVariazioniArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVariazioniArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCVariazioniArticolo] TO [Metodo98]
    AS [dbo];

