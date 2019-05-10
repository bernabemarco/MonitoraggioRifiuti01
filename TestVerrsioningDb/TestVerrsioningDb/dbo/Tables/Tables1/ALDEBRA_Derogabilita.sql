CREATE TABLE [dbo].[ALDEBRA_Derogabilita] (
    [Codice]         CHAR (2)     COLLATE Latin1_General_CI_AS NOT NULL,
    [Descrizione]    CHAR (50)    COLLATE Latin1_General_CI_AS NULL,
    [UTENTEMODIFICA] VARCHAR (50) COLLATE Latin1_General_CI_AS NULL,
    [DATAMODIFICA]   DATETIME     NULL,
    CONSTRAINT [PK_ALDEBRA_Derogabilita] PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALDEBRA_Derogabilita] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALDEBRA_Derogabilita] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALDEBRA_Derogabilita] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALDEBRA_Derogabilita] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALDEBRA_Derogabilita] TO [Metodo98]
    AS [dbo];

