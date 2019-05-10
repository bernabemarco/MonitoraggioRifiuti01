CREATE TABLE [dbo].[zzTabEsitiAttivita] (
    [CodEsito]         VARCHAR (25)  NOT NULL,
    [DescrizioneEsito] VARCHAR (100) NOT NULL,
    [UtenteModifica]   VARCHAR (25)  NULL,
    [DataModifica]     DATETIME      NULL,
    CONSTRAINT [PK_EsitiAttivita] PRIMARY KEY CLUSTERED ([CodEsito] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[zzTabEsitiAttivita] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[zzTabEsitiAttivita] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[zzTabEsitiAttivita] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[zzTabEsitiAttivita] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[zzTabEsitiAttivita] TO [Metodo98]
    AS [dbo];

