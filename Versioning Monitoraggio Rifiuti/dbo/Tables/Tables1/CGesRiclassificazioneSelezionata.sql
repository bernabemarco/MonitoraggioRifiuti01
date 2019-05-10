CREATE TABLE [dbo].[CGesRiclassificazioneSelezionata] (
    [TipoRicl] VARCHAR (5) NOT NULL,
    PRIMARY KEY CLUSTERED ([TipoRicl] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesRiclassificazioneSelezionata] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesRiclassificazioneSelezionata] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesRiclassificazioneSelezionata] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesRiclassificazioneSelezionata] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesRiclassificazioneSelezionata] TO [Metodo98]
    AS [dbo];

