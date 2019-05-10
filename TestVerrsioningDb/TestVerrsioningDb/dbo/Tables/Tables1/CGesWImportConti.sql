CREATE TABLE [dbo].[CGesWImportConti] (
    [Progressivo]       DECIMAL (10)   NOT NULL,
    [CodConto]          VARCHAR (20)   DEFAULT ('') NULL,
    [Descrizione]       VARCHAR (80)   DEFAULT ('') NULL,
    [Mastro]            VARCHAR (5)    DEFAULT ('') NULL,
    [PercVariabilita]   DECIMAL (7, 2) DEFAULT (0) NULL,
    [ContoConguaglio]   VARCHAR (3)    DEFAULT ('') NULL,
    [Raggruppamento]    VARCHAR (3)    DEFAULT ('') NULL,
    [CoeffVariazione]   VARCHAR (3)    DEFAULT ('') NULL,
    [DataRegistrazione] DATETIME       NULL,
    [FlagVal]           SMALLINT       DEFAULT (0) NULL,
    [DescrizioneErrore] VARCHAR (200)  DEFAULT ('') NULL,
    [UtenteModifica]    VARCHAR (25)   NOT NULL,
    [DataModifica]      DATETIME       NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesWImportConti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesWImportConti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesWImportConti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesWImportConti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesWImportConti] TO [Metodo98]
    AS [dbo];

