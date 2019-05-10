CREATE TABLE [dbo].[IE_ExpProfiles] (
    [Progressivo]    DECIMAL (18)  NOT NULL,
    [Descrizione]    VARCHAR (80)  NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    [Template]       VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[IE_ExpProfiles] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[IE_ExpProfiles] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[IE_ExpProfiles] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[IE_ExpProfiles] TO [Metodo98]
    AS [dbo];

