CREATE TABLE [dbo].[FRCDatiVariAzienda] (
    [Codice]                 DECIMAL (5)   NOT NULL,
    [PercorsoFileExcel]      VARCHAR (200) DEFAULT ('') NULL,
    [UtenteModifica]         VARCHAR (25)  NOT NULL,
    [DataModifica]           DATETIME      NOT NULL,
    [ContoProvv]             VARCHAR (7)   DEFAULT ('') NULL,
    [ContoLavEst]            VARCHAR (7)   DEFAULT ('') NULL,
    [ApplicaVarPercLiv]      VARCHAR (10)  DEFAULT ('') NULL,
    [ContoSconto]            VARCHAR (7)   DEFAULT ('') NULL,
    [ContoCostoTrasf]        VARCHAR (7)   DEFAULT ('') NULL,
    [ContoDiBa]              VARCHAR (7)   DEFAULT ('') NULL,
    [ClientiDestinazione]    SMALLINT      DEFAULT ((0)) NULL,
    [UsaCostiStandardCiclo]  SMALLINT      DEFAULT ((0)) NULL,
    [UsaArticoloAlternativo] SMALLINT      DEFAULT ((0)) NULL,
    [AzzeraRicaviOmaggi]     SMALLINT      DEFAULT ((0)) NULL,
    [NomeFileQLIK]           VARCHAR (100) DEFAULT ('') NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCDatiVariAzienda] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCDatiVariAzienda] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCDatiVariAzienda] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCDatiVariAzienda] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCDatiVariAzienda] TO [Metodo98]
    AS [dbo];

