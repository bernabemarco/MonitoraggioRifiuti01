CREATE TABLE [dbo].[GEM_TMP_ELEMENTI_FATT] (
    [idSESSIONE]             INT             NOT NULL,
    [Progr]                  DECIMAL (10)    NOT NULL,
    [IDCONTRATTO]            VARCHAR (13)    NOT NULL,
    [SEZIONECONTRATTO]       DECIMAL (5)     NOT NULL,
    [IDRAPPORTO]             VARCHAR (14)    NOT NULL,
    [TipologiaElemento]      VARCHAR (1)     NULL,
    [IDRiga]                 DECIMAL (5)     NOT NULL,
    [CodArticolo]            VARCHAR (50)    NULL,
    [DscrizioneRiga]         VARCHAR (80)    NULL,
    [QTA]                    NUMERIC (10, 2) DEFAULT ((0)) NOT NULL,
    [PREZZO]                 NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [SCONTO]                 NUMERIC (10, 5) NULL,
    [PREZZONETTO]            NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [TOTNETTORIGA]           NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [TOTLORDORIGA]           NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [PROVVIGIONE1]           NUMERIC (18, 2) NULL,
    [PROVVIGIONE2]           NUMERIC (18, 2) NULL,
    [PROVVIGIONE3]           NUMERIC (18, 2) NULL,
    [TipoFatturazione]       VARCHAR (20)    NULL,
    [Validita]               VARCHAR (20)    NULL,
    [TestaContr_IdDivisione] SMALLINT        DEFAULT ((0)) NULL,
    [SezContr_IdDivisione]   SMALLINT        DEFAULT ((0)) NULL,
    [SezContr_CodIva]        DECIMAL (5)     DEFAULT ((0)) NULL,
    [UTENTEMODIFICA]         VARCHAR (25)    NULL,
    [DATAMODIFICA]           DATETIME        NULL,
    CONSTRAINT [PK_GEM_TMP_ELEMENTI_FATT] PRIMARY KEY CLUSTERED ([idSESSIONE] ASC, [Progr] ASC, [IDCONTRATTO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_TMP_ELEMENTI_FATT] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_TMP_ELEMENTI_FATT] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_TMP_ELEMENTI_FATT] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_TMP_ELEMENTI_FATT] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_TMP_ELEMENTI_FATT] TO [Metodo98]
    AS [dbo];

