CREATE TABLE [dbo].[CGesWImportTransazioni] (
    [Progressivo]       DECIMAL (10)    NOT NULL,
    [CodContoRaccordo]  VARCHAR (30)    DEFAULT ('') NULL,
    [CodDestinazione]   VARCHAR (10)    DEFAULT ('') NULL,
    [AnnoInizio]        DECIMAL (5)     DEFAULT (0) NULL,
    [MeseInizio]        INT             DEFAULT (0) NULL,
    [AnnoFine]          DECIMAL (5)     DEFAULT (0) NULL,
    [MeseFine]          INT             DEFAULT (0) NULL,
    [Valore]            DECIMAL (19, 6) DEFAULT (0) NULL,
    [CodDistribuzione]  VARCHAR (3)     DEFAULT ('') NULL,
    [Note]              VARCHAR (100)   DEFAULT ('') NULL,
    [DataRegistrazione] DATETIME        NULL,
    [FlagVal]           SMALLINT        DEFAULT (0) NULL,
    [Ambiente]          VARCHAR (3)     DEFAULT ('') NULL,
    [DescrizioneErrore] VARCHAR (200)   DEFAULT ('') NULL,
    [UtenteModifica]    VARCHAR (25)    NOT NULL,
    [DataModifica]      DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesWImportTransazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesWImportTransazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesWImportTransazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesWImportTransazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesWImportTransazioni] TO [Metodo98]
    AS [dbo];

