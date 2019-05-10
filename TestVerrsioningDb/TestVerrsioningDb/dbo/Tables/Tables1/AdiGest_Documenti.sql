CREATE TABLE [dbo].[AdiGest_Documenti] (
    [CODICE]          VARCHAR (3)   NOT NULL,
    [GENERAPDF]       SMALLINT      NULL,
    [GENERAETICHETTA] SMALLINT      NULL,
    [UTENTEMODIFICA]  VARCHAR (50)  NULL,
    [DATAMODIFICA]    DATETIME      NULL,
    [PERCORSOFILE]    VARCHAR (250) NULL,
    [PREFISSO]        VARCHAR (10)  NULL,
    [FAMIGLIA]        VARCHAR (250) NULL,
    [SCANNER]         SMALLINT      NULL,
    [SFOGLIA]         SMALLINT      NULL,
    [MODULOETICHETTA] VARCHAR (255) NULL,
    [MODULOSTAMPA]    VARCHAR (255) NULL,
    [SUFFISSO]        VARCHAR (10)  NULL,
    [INTRA]           SMALLINT      CONSTRAINT [DF_AdiGest_Documenti_INTRA] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_AdiGest_Documenti] PRIMARY KEY CLUSTERED ([CODICE] ASC, [INTRA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[AdiGest_Documenti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[AdiGest_Documenti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[AdiGest_Documenti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[AdiGest_Documenti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[AdiGest_Documenti] TO [Metodo98]
    AS [dbo];

