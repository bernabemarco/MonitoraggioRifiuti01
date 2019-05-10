CREATE TABLE [dbo].[ALDEBRA_DatiStandard] (
    [AZIENDA]        VARCHAR (10)  COLLATE Latin1_General_CI_AS NOT NULL,
    [FILEPDC]        VARCHAR (255) COLLATE Latin1_General_CI_AS NULL,
    [FILESCAD]       VARCHAR (255) COLLATE Latin1_General_CI_AS NULL,
    [FILEIMP]        VARCHAR (255) COLLATE Latin1_General_CI_AS NULL,
    [MULTIAZ]        BIT           NULL,
    [DATAMODIFICA]   DATETIME      NULL,
    [UTENTEMODIFICA] VARCHAR (50)  COLLATE Latin1_General_CI_AS NULL,
    [CAUSALECONT]    DECIMAL (5)   NULL,
    [USACAUSALESTD]  SMALLINT      DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_ALDEBRA_DatiStandard] PRIMARY KEY CLUSTERED ([AZIENDA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALDEBRA_DatiStandard] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALDEBRA_DatiStandard] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALDEBRA_DatiStandard] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALDEBRA_DatiStandard] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALDEBRA_DatiStandard] TO [Metodo98]
    AS [dbo];

