CREATE TABLE [dbo].[GEM_ListiniContrattiMatrice] (
    [idGListinoContr]         DECIMAL (10) NOT NULL,
    [DESCRIZIONE]             VARCHAR (80) NULL,
    [DATAINIVALIDITA]         DATETIME     NOT NULL,
    [DATAFINEVALIDITA]        DATETIME     NOT NULL,
    [DATARINNOVO]             DATETIME     NULL,
    [CodCliente]              VARCHAR (7)  NOT NULL,
    [idTipologMezzo]          DECIMAL (5)  NOT NULL,
    [idGListinoModello]       DECIMAL (5)  NOT NULL,
    [CodAgente1]              VARCHAR (7)  NOT NULL,
    [CodAgente2]              VARCHAR (7)  NOT NULL,
    [ApplicazioneProvvigione] VARCHAR (1)  DEFAULT ('A') NOT NULL,
    [UTENTEMODIFICA]          VARCHAR (25) NOT NULL,
    [DATAMODIFICA]            DATETIME     NOT NULL,
    [CODICEMEZZO]             VARCHAR (50) NULL,
    CONSTRAINT [GEM_ListiniContrattiMatrice_PK] PRIMARY KEY CLUSTERED ([idGListinoContr] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_ListiniContrattiMatrice] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_ListiniContrattiMatrice] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_ListiniContrattiMatrice] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_ListiniContrattiMatrice] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_ListiniContrattiMatrice] TO [Metodo98]
    AS [dbo];

