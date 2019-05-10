CREATE TABLE [dbo].[GEM_STO_RAPPORTI_DocumentiCollegati] (
    [IDRapporto]       VARCHAR (14)  NOT NULL,
    [IDCONTRATTO]      VARCHAR (13)  NOT NULL,
    [SEZIONECONTRATTO] DECIMAL (5)   NOT NULL,
    [IDRIGA]           DECIMAL (5)   NOT NULL,
    [DATAINSERIMENTO]  DATETIME      NULL,
    [REFERENTE]        VARCHAR (100) NULL,
    [OGGETTO]          VARCHAR (500) NULL,
    [ALLEGATO]         VARCHAR (500) NULL,
    [PublicaGOnLine]   SMALLINT      DEFAULT ((0)) NULL,
    [DocValido]        SMALLINT      DEFAULT ((1)) NULL,
    [DATAMODIFICA]     DATETIME      NULL,
    [UTENTEMODIFICA]   VARCHAR (25)  NULL,
    CONSTRAINT [GEM_STO_RAPPORTI_DocumentiCollegati_PK] PRIMARY KEY CLUSTERED ([IDRapporto] ASC, [IDRIGA] ASC, [IDCONTRATTO] ASC, [SEZIONECONTRATTO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_STO_RAPPORTI_DocumentiCollegati] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_STO_RAPPORTI_DocumentiCollegati] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_STO_RAPPORTI_DocumentiCollegati] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_STO_RAPPORTI_DocumentiCollegati] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_STO_RAPPORTI_DocumentiCollegati] TO [Metodo98]
    AS [dbo];

