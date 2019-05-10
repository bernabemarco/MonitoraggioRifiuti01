CREATE TABLE [dbo].[GEM_TabParametriAziendaGemma] (
    [IdSocieta]                          VARCHAR (3)   NOT NULL,
    [DESCRIZIONE]                        VARCHAR (80)  NULL,
    [ContatoreContratti]                 DECIMAL (5)   NOT NULL,
    [SiglaSocieta]                       VARCHAR (2)   NOT NULL,
    [SiglaDocListeMovMateriali]          VARCHAR (3)   NOT NULL,
    [UTENTEMODIFICA]                     VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]                       DATETIME      NOT NULL,
    [SiglaDocCicloPassivoTerzisti]       VARCHAR (3)   NULL,
    [RapportiPercorsoDocumentiCollegati] VARCHAR (200) NULL,
    [PercorsoAllegatiMezzi]              VARCHAR (200) NULL,
    [PercorsoImmaginiMezzi]              VARCHAR (200) NULL,
    [ModuloStpAnomalieRapp]              VARCHAR (200) NULL,
    CONSTRAINT [GEM_TabParametriAziendaGemma_PK] PRIMARY KEY CLUSTERED ([IdSocieta] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_TabParametriAziendaGemma] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_TabParametriAziendaGemma] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_TabParametriAziendaGemma] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_TabParametriAziendaGemma] TO [Metodo98]
    AS [dbo];

