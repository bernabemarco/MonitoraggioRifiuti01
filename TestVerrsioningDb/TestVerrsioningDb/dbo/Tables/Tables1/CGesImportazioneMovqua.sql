CREATE TABLE [dbo].[CGesImportazioneMovqua] (
    [ID]               INT             IDENTITY (1, 1) NOT NULL,
    [UM]               VARCHAR (5)     NULL,
    [OrigineQta]       VARCHAR (10)    NULL,
    [DestinazioneQta]  VARCHAR (10)    NULL,
    [AnnoInizio]       DECIMAL (5)     NULL,
    [MeseInizio]       INT             NULL,
    [AnnoFine]         DECIMAL (5)     NULL,
    [MeseFine]         INT             NULL,
    [Quantita]         DECIMAL (19, 6) NULL,
    [CodDistribuzione] VARCHAR (3)     NULL,
    [Note]             VARCHAR (100)   NULL,
    CONSTRAINT [KEY_CGesImportazioneMovqua] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesImportazioneMovqua] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesImportazioneMovqua] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesImportazioneMovqua] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesImportazioneMovqua] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesImportazioneMovqua] TO [Metodo98]
    AS [dbo];

