CREATE TABLE [dbo].[CGCPLegameCDLCentri] (
    [CodiceCDL]      VARCHAR (5)   NOT NULL,
    [CodiceCDCTA]    VARCHAR (10)  DEFAULT ('') NULL,
    [CodiceCDCTM]    VARCHAR (10)  DEFAULT ('') NULL,
    [CodiceCDCTU]    VARCHAR (10)  DEFAULT ('') NULL,
    [Note]           VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([CodiceCDL] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPLegameCDLCentri] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPLegameCDLCentri] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPLegameCDLCentri] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPLegameCDLCentri] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPLegameCDLCentri] TO [Metodo98]
    AS [dbo];

