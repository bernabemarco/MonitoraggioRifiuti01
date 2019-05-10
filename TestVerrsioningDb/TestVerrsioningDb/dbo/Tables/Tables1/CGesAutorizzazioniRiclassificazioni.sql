CREATE TABLE [dbo].[CGesAutorizzazioniRiclassificazioni] (
    [TipoRicl]       VARCHAR (5)   NOT NULL,
    [Utente]         VARCHAR (25)  NOT NULL,
    [Note]           VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([TipoRicl] ASC, [Utente] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesAutorizzazioniRiclassificazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesAutorizzazioniRiclassificazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesAutorizzazioniRiclassificazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesAutorizzazioniRiclassificazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesAutorizzazioniRiclassificazioni] TO [Metodo98]
    AS [dbo];

