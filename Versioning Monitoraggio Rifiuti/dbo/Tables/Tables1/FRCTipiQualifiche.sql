CREATE TABLE [dbo].[FRCTipiQualifiche] (
    [Codice]         VARCHAR (3)  NOT NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCTipiQualifiche] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCTipiQualifiche] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCTipiQualifiche] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCTipiQualifiche] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCTipiQualifiche] TO [Metodo98]
    AS [dbo];

