CREATE TABLE [dbo].[ALD_GemmaDettaglioFatturatoTecnici] (
    [GEMMAPROGR]            DECIMAL (10)    NOT NULL,
    [TIPODOC]               VARCHAR (3)     NULL,
    [CODAGENTE1]            VARCHAR (7)     NULL,
    [CODAGENTE2]            VARCHAR (7)     NULL,
    [CODAGENTE3]            VARCHAR (7)     NULL,
    [IDRAPPORTO]            VARCHAR (14)    NULL,
    [CODARTICOLO]           VARCHAR (50)    NULL,
    [IMPORTOUNITARIONETTO]  DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [QTA]                   DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [DATARAPPORTOFATTURATO] DATETIME        NOT NULL,
    [UTENTEMODIFICA]        VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]          DATETIME        NOT NULL,
    CONSTRAINT [PK_ALD_GemmaDettaglioFatturatoTecnici] PRIMARY KEY CLUSTERED ([GEMMAPROGR] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_GemmaDettaglioFatturatoTecnici] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_GemmaDettaglioFatturatoTecnici] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_GemmaDettaglioFatturatoTecnici] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_GemmaDettaglioFatturatoTecnici] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_GemmaDettaglioFatturatoTecnici] TO [Metodo98]
    AS [dbo];

