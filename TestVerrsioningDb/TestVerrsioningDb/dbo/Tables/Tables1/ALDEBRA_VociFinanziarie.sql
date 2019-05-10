CREATE TABLE [dbo].[ALDEBRA_VociFinanziarie] (
    [CodiceVoce]     VARCHAR (6)  COLLATE Latin1_General_CI_AS NOT NULL,
    [descrizione]    VARCHAR (80) COLLATE Latin1_General_CI_AS NULL,
    [UTENTEMODIFICA] VARCHAR (50) COLLATE Latin1_General_CI_AS NULL,
    [DATAMODIFICA]   DATETIME     NULL,
    CONSTRAINT [PK_ALDEBRA_VociFinanziarie] PRIMARY KEY CLUSTERED ([CodiceVoce] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALDEBRA_VociFinanziarie] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALDEBRA_VociFinanziarie] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALDEBRA_VociFinanziarie] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALDEBRA_VociFinanziarie] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALDEBRA_VociFinanziarie] TO [Metodo98]
    AS [dbo];

