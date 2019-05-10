CREATE TABLE [dbo].[CGesWImportTransazioniDaCespiti] (
    [Progressivo]       DECIMAL (10)    NOT NULL,
    [AnnoInizio]        DECIMAL (5)     DEFAULT (0) NULL,
    [MeseInizio]        INT             DEFAULT (0) NULL,
    [AnnoFine]          DECIMAL (5)     DEFAULT (0) NULL,
    [MeseFine]          INT             DEFAULT (0) NULL,
    [CodContoRaccordo]  VARCHAR (30)    DEFAULT ('') NULL,
    [CodDestinazione]   VARCHAR (10)    DEFAULT ('') NULL,
    [Valore]            DECIMAL (19, 6) DEFAULT (0) NULL,
    [FlagErrore]        SMALLINT        DEFAULT (0) NULL,
    [DescrizioneErrore] VARCHAR (200)   DEFAULT ('') NULL,
    [Note]              VARCHAR (100)   DEFAULT ('') NULL,
    [UtenteModifica]    VARCHAR (25)    NOT NULL,
    [DataModifica]      DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesWImportTransazioniDaCespiti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesWImportTransazioniDaCespiti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesWImportTransazioniDaCespiti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesWImportTransazioniDaCespiti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesWImportTransazioniDaCespiti] TO [Metodo98]
    AS [dbo];

