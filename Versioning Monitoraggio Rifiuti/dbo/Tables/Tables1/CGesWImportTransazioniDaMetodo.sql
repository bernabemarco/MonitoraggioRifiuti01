CREATE TABLE [dbo].[CGesWImportTransazioniDaMetodo] (
    [Progressivo]       DECIMAL (10)    NOT NULL,
    [Anno]              DECIMAL (5)     DEFAULT (0) NULL,
    [Mese]              INT             DEFAULT (0) NULL,
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
    ON OBJECT::[dbo].[CGesWImportTransazioniDaMetodo] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesWImportTransazioniDaMetodo] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesWImportTransazioniDaMetodo] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesWImportTransazioniDaMetodo] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesWImportTransazioniDaMetodo] TO [Metodo98]
    AS [dbo];

