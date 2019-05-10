CREATE TABLE [dbo].[GEM_TabParametriAziendaGemmaContatori] (
    [IdSocieta]         VARCHAR (3)  NOT NULL,
    [IdRiga]            DECIMAL (5)  NOT NULL,
    [ContatoreRapporti] DECIMAL (5)  NOT NULL,
    [SiglaRapporti]     VARCHAR (3)  NULL,
    [TipoRapporto]      VARCHAR (3)  NULL,
    [UTENTEMODIFICA]    VARCHAR (25) NOT NULL,
    [DATAMODIFICA]      DATETIME     NOT NULL,
    [PrefissoFamAdiuto] VARCHAR (10) NULL,
    CONSTRAINT [GEM_TabParametriAziendaGemmaContatori_PK] PRIMARY KEY CLUSTERED ([IdSocieta] ASC, [IdRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_TabParametriAziendaGemmaContatori] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_TabParametriAziendaGemmaContatori] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_TabParametriAziendaGemmaContatori] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_TabParametriAziendaGemmaContatori] TO [Metodo98]
    AS [dbo];

