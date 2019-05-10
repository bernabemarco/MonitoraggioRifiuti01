CREATE TABLE [dbo].[AdiGest_Contabilita] (
    [CODICE]          NUMERIC (5)   NOT NULL,
    [GENERAETICHETTA] SMALLINT      NULL,
    [utentemodifica]  VARCHAR (50)  NULL,
    [datamodifica]    DATETIME      NULL,
    [SCANNER]         SMALLINT      NULL,
    [SFOGLIA]         SMALLINT      NULL,
    [PREFISSO]        VARCHAR (10)  NULL,
    [FAMIGLIA]        VARCHAR (250) NULL,
    [MODULOETICHETTA] VARCHAR (255) NULL,
    [SUFFISSO]        VARCHAR (10)  NULL,
    [INTRA]           SMALLINT      CONSTRAINT [DF_AdiGest_Contabilita_INTRA] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_AdiGest_Contabilita] PRIMARY KEY CLUSTERED ([CODICE] ASC, [INTRA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[AdiGest_Contabilita] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[AdiGest_Contabilita] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[AdiGest_Contabilita] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[AdiGest_Contabilita] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[AdiGest_Contabilita] TO [Metodo98]
    AS [dbo];

