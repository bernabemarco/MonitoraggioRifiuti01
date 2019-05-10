CREATE TABLE [dbo].[ALD_GemmaDettaglioVenduto] (
    [GEMMAPROGR]              DECIMAL (10)    NOT NULL,
    [TIPODOC]                 VARCHAR (3)     NULL,
    [CODAGENTE1]              VARCHAR (7)     NULL,
    [CODAGENTE2]              VARCHAR (7)     NULL,
    [CODAGENTE3]              VARCHAR (7)     NULL,
    [IDCONTRATTO]             VARCHAR (13)    NULL,
    [CODARTICOLO]             VARCHAR (50)    NULL,
    [IMPORTOUNITARIONETTO]    DECIMAL (19, 4) CONSTRAINT [DF__ALD_Gemma__IMPOR__3C0D3642] DEFAULT (0) NOT NULL,
    [QTA]                     DECIMAL (16, 6) CONSTRAINT [DF__ALD_GemmaDe__QTA__3D015A7B] DEFAULT (0) NOT NULL,
    [DATACONTRATTO]           DATETIME        NOT NULL,
    [UTENTEMODIFICA]          VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]            DATETIME        NOT NULL,
    [DtEliminazioneContratto] DATETIME        NULL,
    CONSTRAINT [PK_ALD_GemmaDettaglioVenduto] PRIMARY KEY CLUSTERED ([GEMMAPROGR] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_GemmaDettaglioVenduto] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_GemmaDettaglioVenduto] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_GemmaDettaglioVenduto] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_GemmaDettaglioVenduto] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_GemmaDettaglioVenduto] TO [Metodo98]
    AS [dbo];

