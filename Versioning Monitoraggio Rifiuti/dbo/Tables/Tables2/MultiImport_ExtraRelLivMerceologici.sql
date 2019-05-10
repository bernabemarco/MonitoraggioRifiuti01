CREATE TABLE [dbo].[MultiImport_ExtraRelLivMerceologici] (
    [CodLivelloInterno]   VARCHAR (250) NOT NULL,
    [CodLivelloBancaDati] VARCHAR (25)  NOT NULL,
    [UtenteModifica]      VARCHAR (25)  NOT NULL,
    [DataModifica]        DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([CodLivelloInterno] ASC, [CodLivelloBancaDati] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[MultiImport_ExtraRelLivMerceologici] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MultiImport_ExtraRelLivMerceologici] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[MultiImport_ExtraRelLivMerceologici] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MultiImport_ExtraRelLivMerceologici] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MultiImport_ExtraRelLivMerceologici] TO [Metodo98]
    AS [dbo];

