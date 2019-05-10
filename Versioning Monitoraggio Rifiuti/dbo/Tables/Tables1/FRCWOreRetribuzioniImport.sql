CREATE TABLE [dbo].[FRCWOreRetribuzioniImport] (
    [ID]          INT             IDENTITY (1, 1) NOT NULL,
    [NrTerminale] DECIMAL (5)     DEFAULT ((0)) NULL,
    [Mese]        INT             DEFAULT ((0)) NULL,
    [IDRisorsa]   DECIMAL (10)    DEFAULT ((0)) NULL,
    [Centro]      VARCHAR (10)    DEFAULT ('') NULL,
    [Ore]         DECIMAL (19, 6) DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCWOreRetribuzioniImport] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCWOreRetribuzioniImport] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCWOreRetribuzioniImport] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCWOreRetribuzioniImport] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCWOreRetribuzioniImport] TO [Metodo98]
    AS [dbo];

