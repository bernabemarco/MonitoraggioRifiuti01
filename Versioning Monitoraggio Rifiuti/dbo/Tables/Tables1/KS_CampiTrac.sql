CREATE TABLE [dbo].[KS_CampiTrac] (
    [Posizione]      INT           NOT NULL,
    [Campo]          VARCHAR (50)  NULL,
    [FormatCampo]    VARCHAR (500) NULL,
    [UtenteModifica] VARCHAR (25)  NULL,
    [DataModifica]   DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Posizione] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[KS_CampiTrac] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[KS_CampiTrac] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[KS_CampiTrac] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[KS_CampiTrac] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[KS_CampiTrac] TO [Metodo98]
    AS [dbo];

