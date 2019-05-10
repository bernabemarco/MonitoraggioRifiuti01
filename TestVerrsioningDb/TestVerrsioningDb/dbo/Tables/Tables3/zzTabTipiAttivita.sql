CREATE TABLE [dbo].[zzTabTipiAttivita] (
    [CodTipo]         VARCHAR (25)  NOT NULL,
    [DescrizioneTipo] VARCHAR (100) NOT NULL,
    [UtenteModifica]  VARCHAR (25)  NULL,
    [DataModifica]    DATETIME      NULL,
    CONSTRAINT [PK_TipiAttivita] PRIMARY KEY CLUSTERED ([CodTipo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[zzTabTipiAttivita] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[zzTabTipiAttivita] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[zzTabTipiAttivita] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[zzTabTipiAttivita] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[zzTabTipiAttivita] TO [Metodo98]
    AS [dbo];

