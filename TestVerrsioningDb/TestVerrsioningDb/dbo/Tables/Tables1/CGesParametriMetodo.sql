CREATE TABLE [dbo].[CGesParametriMetodo] (
    [FonteDati]       VARCHAR (30)  NOT NULL,
    [NomeUtente]      VARCHAR (25)  DEFAULT ('') NULL,
    [PWDAccesso]      VARCHAR (25)  DEFAULT ('') NULL,
    [CDCNonDestinato] VARCHAR (10)  DEFAULT ('') NULL,
    [PianoConti]      SMALLINT      DEFAULT (0) NULL,
    [EstrazioneDa]    SMALLINT      DEFAULT (0) NULL,
    [TipoSelezione]   SMALLINT      DEFAULT (0) NULL,
    [Note]            VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica]  VARCHAR (25)  NOT NULL,
    [DataModifica]    DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([FonteDati] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesParametriMetodo] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesParametriMetodo] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesParametriMetodo] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesParametriMetodo] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesParametriMetodo] TO [Metodo98]
    AS [dbo];

