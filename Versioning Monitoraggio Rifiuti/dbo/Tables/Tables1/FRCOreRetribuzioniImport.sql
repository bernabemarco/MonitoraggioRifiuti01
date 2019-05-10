CREATE TABLE [dbo].[FRCOreRetribuzioniImport] (
    [ID]             INT             IDENTITY (1, 1) NOT NULL,
    [Ambiente]       VARCHAR (3)     DEFAULT ('') NULL,
    [Anno]           INT             DEFAULT ((0)) NULL,
    [Mese]           INT             DEFAULT ((0)) NULL,
    [IDRisorsa]      DECIMAL (10)    DEFAULT ((0)) NULL,
    [Centro]         VARCHAR (10)    DEFAULT ('') NULL,
    [Ore]            DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [Valore]         DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCOreRetribuzioniImport] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCOreRetribuzioniImport] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCOreRetribuzioniImport] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCOreRetribuzioniImport] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCOreRetribuzioniImport] TO [Metodo98]
    AS [dbo];

