CREATE TABLE [dbo].[CGesImportazioneMovcon] (
    [ID]               INT             IDENTITY (1, 1) NOT NULL,
    [Conto]            VARCHAR (30)    NULL,
    [Destinazione]     VARCHAR (10)    NULL,
    [AnnoInizio]       DECIMAL (5)     NULL,
    [MeseInizio]       INT             NULL,
    [AnnoFine]         DECIMAL (5)     NULL,
    [MeseFine]         INT             NULL,
    [Valore]           DECIMAL (19, 6) NULL,
    [CodDistribuzione] VARCHAR (3)     NULL,
    [Note]             VARCHAR (100)   NULL,
    CONSTRAINT [KEY_CGesImportazioneMovcon] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesImportazioneMovcon] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesImportazioneMovcon] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesImportazioneMovcon] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesImportazioneMovcon] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesImportazioneMovcon] TO [Metodo98]
    AS [dbo];

