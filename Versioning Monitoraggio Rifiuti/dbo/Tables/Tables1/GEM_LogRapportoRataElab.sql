CREATE TABLE [dbo].[GEM_LogRapportoRataElab] (
    [Progressivo]    NUMERIC (13) IDENTITY (1, 1) NOT NULL,
    [idSessione]     INT          NOT NULL,
    [IDRAPPORTO]     VARCHAR (14) DEFAULT ('') NULL,
    [IDContratto]    VARCHAR (13) DEFAULT ('') NULL,
    [NumeroRata]     NUMERIC (13) DEFAULT ((0)) NULL,
    [DataModifica]   DATETIME     NOT NULL,
    [UtenteModifica] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_GEM_LogRapportoRataElab] PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_LogRapportoRataElab] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_LogRapportoRataElab] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_LogRapportoRataElab] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_LogRapportoRataElab] TO [Metodo98]
    AS [dbo];

