CREATE TABLE [dbo].[FRCRisorse] (
    [Progressivo]      DECIMAL (10)  NOT NULL,
    [Codice]           VARCHAR (20)  DEFAULT ('') NULL,
    [Cognome]          VARCHAR (80)  DEFAULT ('') NULL,
    [Nome]             VARCHAR (80)  DEFAULT ('') NULL,
    [DataValidita]     DATETIME      NULL,
    [Qualifica]        INT           DEFAULT ((0)) NULL,
    [Livello]          VARCHAR (50)  DEFAULT ('') NULL,
    [Attivo]           SMALLINT      DEFAULT ((0)) NULL,
    [CodDestinazione]  VARCHAR (10)  DEFAULT ('') NULL,
    [Note]             VARCHAR (500) DEFAULT ('') NULL,
    [UtenteModifica]   VARCHAR (25)  NOT NULL,
    [DataModifica]     DATETIME      NOT NULL,
    [DataFineValidita] DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCRisorse] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCRisorse] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCRisorse] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCRisorse] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCRisorse] TO [Metodo98]
    AS [dbo];

