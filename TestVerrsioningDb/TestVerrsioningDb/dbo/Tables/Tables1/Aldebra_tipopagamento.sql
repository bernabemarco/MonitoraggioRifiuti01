CREATE TABLE [dbo].[Aldebra_tipopagamento] (
    [CodiceEffetto]  NUMERIC (18) NOT NULL,
    [TipoPagamento]  CHAR (2)     COLLATE Latin1_General_CI_AS NULL,
    [UTENTEMODIFICA] VARCHAR (50) COLLATE Latin1_General_CI_AS NULL,
    [DATAMODIFICA]   DATETIME     NULL,
    CONSTRAINT [PK_Aldebra_tipopagamento] PRIMARY KEY CLUSTERED ([CodiceEffetto] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Aldebra_tipopagamento] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Aldebra_tipopagamento] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Aldebra_tipopagamento] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Aldebra_tipopagamento] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Aldebra_tipopagamento] TO [Metodo98]
    AS [dbo];

