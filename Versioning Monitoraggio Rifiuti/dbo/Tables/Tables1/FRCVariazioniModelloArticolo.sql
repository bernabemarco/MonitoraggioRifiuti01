CREATE TABLE [dbo].[FRCVariazioniModelloArticolo] (
    [Ambiente]       VARCHAR (3)     NOT NULL,
    [Anno]           INT             NOT NULL,
    [MeseInizio]     INT             NOT NULL,
    [MeseFine]       INT             NOT NULL,
    [Modello]        VARCHAR (20)    NOT NULL,
    [PercQuantita]   DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [PercPrezzo]     DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Ambiente] ASC, [Anno] ASC, [MeseInizio] ASC, [MeseFine] ASC, [Modello] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCVariazioniModelloArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCVariazioniModelloArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCVariazioniModelloArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVariazioniModelloArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCVariazioniModelloArticolo] TO [Metodo98]
    AS [dbo];

