CREATE TABLE [dbo].[FRCWValoreRetribuzioniDettaglio] (
    [NrTerminale]    DECIMAL (5)     NOT NULL,
    [IDRisorsa]      DECIMAL (10)    NOT NULL,
    [NumeroRiga]     INT             NOT NULL,
    [MeseInizio]     INT             DEFAULT ((0)) NULL,
    [MeseFine]       INT             DEFAULT ((0)) NULL,
    [VoceCosto]      VARCHAR (20)    DEFAULT ('') NULL,
    [Valore]         DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [Note]           VARCHAR (100)   DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [IDRisorsa] ASC, [NumeroRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCWValoreRetribuzioniDettaglio] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCWValoreRetribuzioniDettaglio] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCWValoreRetribuzioniDettaglio] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCWValoreRetribuzioniDettaglio] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCWValoreRetribuzioniDettaglio] TO [Metodo98]
    AS [dbo];

