CREATE TABLE [dbo].[ALD_RilevazioneAttivitaCommessa] (
    [Progressivo]            DECIMAL (10)    NOT NULL,
    [Soggetto]               VARCHAR (50)    NOT NULL,
    [RifCommessaCliente]     VARCHAR (30)    NOT NULL,
    [DescrizioneTipoTransaz] VARCHAR (80)    DEFAULT ('') NULL,
    [DataInizioIntervento]   DATETIME        DEFAULT (getdate()) NOT NULL,
    [DescrizioneAttivita]    VARCHAR (80)    DEFAULT ('') NULL,
    [OreLavorate]            DECIMAL (16, 6) DEFAULT (0) NULL,
    [NumTrasferte]           DECIMAL (16, 6) DEFAULT (0) NULL,
    [NumNottiTasferta]       DECIMAL (16, 6) DEFAULT (0) NULL,
    [OreViaggio]             DECIMAL (16, 6) DEFAULT (0) NULL,
    [SpeseVittoEVarie]       DECIMAL (16, 6) DEFAULT (0) NULL,
    [KmPercorsi]             DECIMAL (16, 6) DEFAULT (0) NULL,
    [NumeroGGuso]            DECIMAL (16, 6) DEFAULT (0) NULL,
    [TargaFurgone]           VARCHAR (20)    DEFAULT ('') NULL,
    [NoteRapporto]           VARCHAR (1000)  DEFAULT ('') NULL,
    [Evaso]                  INT             DEFAULT (0) NULL,
    [UTENTEMODIFICA]         VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]           DATETIME        NOT NULL,
    [IdRapportoIntervento]   VARCHAR (14)    NULL,
    CONSTRAINT [PK_ALD_RilevazioneAttivitaCommessa] PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_RilevazioneAttivitaCommessa] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_RilevazioneAttivitaCommessa] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_RilevazioneAttivitaCommessa] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_RilevazioneAttivitaCommessa] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_RilevazioneAttivitaCommessa] TO [Metodo98]
    AS [dbo];

