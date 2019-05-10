CREATE TABLE [dbo].[CGCPLegameRisorseCentri] (
    [CodiceRisorsa]  VARCHAR (5)   NOT NULL,
    [CodiceCDCTA]    VARCHAR (10)  DEFAULT ('') NULL,
    [CodiceCDCTM]    VARCHAR (10)  DEFAULT ('') NULL,
    [CodiceCDCTU]    VARCHAR (10)  DEFAULT ('') NULL,
    [Note]           VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([CodiceRisorsa] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPLegameRisorseCentri] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPLegameRisorseCentri] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPLegameRisorseCentri] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPLegameRisorseCentri] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPLegameRisorseCentri] TO [Metodo98]
    AS [dbo];

