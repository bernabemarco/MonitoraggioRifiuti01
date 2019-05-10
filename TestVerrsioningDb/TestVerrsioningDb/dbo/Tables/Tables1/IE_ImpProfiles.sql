CREATE TABLE [dbo].[IE_ImpProfiles] (
    [Progressivo]         DECIMAL (18)  NOT NULL,
    [Descrizione]         VARCHAR (80)  NULL,
    [Template]            VARCHAR (100) NULL,
    [CodiceDoc]           VARCHAR (3)   NULL,
    [GestioneFileSuccess] SMALLINT      DEFAULT ((0)) NULL,
    [CartellaFileSuccess] VARCHAR (500) DEFAULT ('') NULL,
    [GestioneFileError]   SMALLINT      DEFAULT ((0)) NULL,
    [CartellaFileError]   VARCHAR (500) DEFAULT ('') NULL,
    [UtenteModifica]      VARCHAR (25)  NOT NULL,
    [DataModifica]        DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[IE_ImpProfiles] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[IE_ImpProfiles] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[IE_ImpProfiles] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[IE_ImpProfiles] TO [Metodo98]
    AS [dbo];

