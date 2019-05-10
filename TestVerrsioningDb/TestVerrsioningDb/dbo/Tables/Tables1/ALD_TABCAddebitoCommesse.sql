CREATE TABLE [dbo].[ALD_TABCAddebitoCommesse] (
    [idRiga]                     DECIMAL (5)  NOT NULL,
    [DESCRIZIONE]                VARCHAR (80) NULL,
    [TipoCom]                    VARCHAR (3)  NULL,
    [CodArt_NRimborsiPranzo]     VARCHAR (50) NOT NULL,
    [CodArt_NNottiTrasf]         VARCHAR (50) NOT NULL,
    [CodArt_VittoAlloggioVarie]  VARCHAR (50) NOT NULL,
    [CodArt_KMPercorsi]          VARCHAR (50) NOT NULL,
    [CodArt_CostoFissoAutomezzo] VARCHAR (50) NOT NULL,
    [UTENTEMODIFICA]             VARCHAR (25) NOT NULL,
    [DATAMODIFICA]               DATETIME     NOT NULL,
    CONSTRAINT [PK_ALD_TABCAddebitoCommesse] PRIMARY KEY CLUSTERED ([idRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TABCAddebitoCommesse] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TABCAddebitoCommesse] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TABCAddebitoCommesse] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TABCAddebitoCommesse] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TABCAddebitoCommesse] TO [Metodo98]
    AS [dbo];

