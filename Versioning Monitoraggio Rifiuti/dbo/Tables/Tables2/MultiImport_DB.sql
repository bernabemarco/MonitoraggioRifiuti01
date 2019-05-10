CREATE TABLE [dbo].[MultiImport_DB] (
    [CodBancaDati]        VARCHAR (10)  NOT NULL,
    [CodInternoBancaDati] VARCHAR (50)  NOT NULL,
    [CodArt]              VARCHAR (50)  NOT NULL,
    [CodLivelloInterno]   VARCHAR (100) NULL,
    [CodLivelloBancaDati] VARCHAR (25)  NULL,
    [UtenteModifica]      VARCHAR (25)  NOT NULL,
    [DataModifica]        DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([CodBancaDati] ASC, [CodInternoBancaDati] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[MultiImport_DB] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MultiImport_DB] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[MultiImport_DB] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MultiImport_DB] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MultiImport_DB] TO [Metodo98]
    AS [dbo];

