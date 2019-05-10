CREATE TABLE [dbo].[Aldebra_parametriscannerUtente] (
    [Utente]           VARCHAR (50) NOT NULL,
    [immaginimultiple] SMALLINT     CONSTRAINT [DF_Aldebra_parametriscannerUtente_immaginimultiple] DEFAULT (0) NULL,
    [mantieniimmagine] SMALLINT     CONSTRAINT [DF_Aldebra_parametriscannerUtente_mantieniimmagini] DEFAULT (0) NULL,
    [usaADF]           SMALLINT     CONSTRAINT [DF_Aldebra_parametriscannerUtente_usaADF] DEFAULT ((-1)) NULL,
    [numeroimmagini]   SMALLINT     NULL,
    [driverscanner]    SMALLINT     NULL,
    [impostacolore]    SMALLINT     NULL,
    [usainterfaccia]   SMALLINT     NULL,
    [UtenteModifica]   VARCHAR (50) NULL,
    [Datamodifica]     DATETIME     NULL,
    CONSTRAINT [PK_Aldebra_parametriscannerUtente] PRIMARY KEY CLUSTERED ([Utente] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Aldebra_parametriscannerUtente] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Aldebra_parametriscannerUtente] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Aldebra_parametriscannerUtente] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Aldebra_parametriscannerUtente] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Aldebra_parametriscannerUtente] TO [Metodo98]
    AS [dbo];

