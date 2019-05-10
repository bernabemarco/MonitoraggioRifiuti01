CREATE TABLE [dbo].[GRI_T_TestaGCheckLists] (
    [IdTipoRapporto]     DECIMAL (5)   NOT NULL,
    [CodiceMezzo]        VARCHAR (50)  NOT NULL,
    [VersioneChekList]   DECIMAL (5)   NOT NULL,
    [TitoloChekList]     VARCHAR (80)  NULL,
    [FlagVerStd]         SMALLINT      DEFAULT ((0)) NULL,
    [DataInizioValidita] DATETIME      NULL,
    [Note]               VARCHAR (255) NULL,
    [stampa]             VARCHAR (1)   NULL,
    [UTENTEMODIFICA]     VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]       DATETIME      NOT NULL,
    [Chiave]             VARCHAR (60)  NULL,
    CONSTRAINT [PK_GRI_T_TestaGCheckLists] PRIMARY KEY CLUSTERED ([IdTipoRapporto] ASC, [CodiceMezzo] ASC, [VersioneChekList] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GRI_T_TestaGCheckLists] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GRI_T_TestaGCheckLists] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GRI_T_TestaGCheckLists] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GRI_T_TestaGCheckLists] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GRI_T_TestaGCheckLists] TO [Metodo98]
    AS [dbo];

