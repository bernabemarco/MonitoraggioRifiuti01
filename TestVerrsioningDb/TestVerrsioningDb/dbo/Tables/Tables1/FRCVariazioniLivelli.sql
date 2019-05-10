CREATE TABLE [dbo].[FRCVariazioniLivelli] (
    [Ambiente]       VARCHAR (3)     NOT NULL,
    [Anno]           INT             NOT NULL,
    [MeseInizio]     INT             NOT NULL,
    [MeseFine]       INT             NOT NULL,
    [Riga]           INT             NOT NULL,
    [PercQuantita]   DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [PercPrezzo]     DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [Cliente]        VARCHAR (7)     DEFAULT ('') NULL,
    [Settore]        DECIMAL (5)     DEFAULT ((0)) NULL,
    [Zona]           DECIMAL (5)     DEFAULT ((0)) NULL,
    [CategoriaC]     DECIMAL (5)     DEFAULT ((0)) NULL,
    [Agente1]        VARCHAR (7)     DEFAULT ('') NULL,
    [Agente2]        VARCHAR (7)     DEFAULT ('') NULL,
    [Agente3]        VARCHAR (7)     DEFAULT ('') NULL,
    [Articolo]       VARCHAR (50)    DEFAULT ('') NULL,
    [Gruppo]         DECIMAL (5)     DEFAULT ((0)) NULL,
    [CategoriaA]     DECIMAL (5)     DEFAULT ((0)) NULL,
    [CategoriaStat]  DECIMAL (5)     DEFAULT ((0)) NULL,
    [Serie]          VARCHAR (20)    DEFAULT ('') NULL,
    [Modello]        VARCHAR (20)    DEFAULT ('') NULL,
    [Conto]          VARCHAR (7)     DEFAULT ('') NULL,
    [Centro]         VARCHAR (10)    DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Ambiente] ASC, [Anno] ASC, [MeseInizio] ASC, [MeseFine] ASC, [Riga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCVariazioniLivelli] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCVariazioniLivelli] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCVariazioniLivelli] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVariazioniLivelli] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCVariazioniLivelli] TO [Metodo98]
    AS [dbo];

