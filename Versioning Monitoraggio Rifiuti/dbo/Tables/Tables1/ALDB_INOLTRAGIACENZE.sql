CREATE TABLE [dbo].[ALDB_INOLTRAGIACENZE] (
    [RecSel]               SMALLINT      DEFAULT ((0)) NULL,
    [Progressivo]          INT           NOT NULL,
    [IDRiga]               INT           NOT NULL,
    [IndirizzoMail]        VARCHAR (255) NULL,
    [CodTecnico]           VARCHAR (7)   NULL,
    [DescTecnico]          VARCHAR (80)  NULL,
    [PercorsoFile]         VARCHAR (255) NULL,
    [Deposito]             VARCHAR (10)  NULL,
    [Ubicazione]           VARCHAR (10)  NULL,
    [Articolo]             VARCHAR (50)  NULL,
    [DescArticolo]         VARCHAR (255) NULL,
    [UM]                   VARCHAR (4)   NULL,
    [Giacenza]             FLOAT (53)    NULL,
    [UtenteModifica]       VARCHAR (25)  NOT NULL,
    [DataModifica]         VARCHAR (25)  NOT NULL,
    [CORDINATORE]          VARCHAR (80)  NULL,
    [INDIRIZZOCORDINATORE] VARCHAR (255) NULL,
    CONSTRAINT [PK_ALDB_INOLTRAGIACENZE] PRIMARY KEY CLUSTERED ([Progressivo] ASC, [IDRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALDB_INOLTRAGIACENZE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALDB_INOLTRAGIACENZE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALDB_INOLTRAGIACENZE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALDB_INOLTRAGIACENZE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALDB_INOLTRAGIACENZE] TO [Metodo98]
    AS [dbo];

