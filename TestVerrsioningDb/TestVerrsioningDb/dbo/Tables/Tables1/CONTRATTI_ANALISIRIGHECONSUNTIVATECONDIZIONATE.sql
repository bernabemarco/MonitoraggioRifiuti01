CREATE TABLE [dbo].[CONTRATTI_ANALISIRIGHECONSUNTIVATECONDIZIONATE] (
    [contratto]                      DECIMAL (10)    NOT NULL,
    [condizionato]                   DECIMAL (10)    NOT NULL,
    [articolo]                       VARCHAR (80)    NOT NULL,
    [valoreavanzamentoarticolo]      DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [valoreavanzamentocontributo]    DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [valorepremiomaturatocontributo] DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [valorepremioarticolo]           DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [utentemodifica]                 VARCHAR (20)    NULL,
    [datamodifica]                   DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([contratto] ASC, [condizionato] ASC, [articolo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONTRATTI_ANALISIRIGHECONSUNTIVATECONDIZIONATE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONTRATTI_ANALISIRIGHECONSUNTIVATECONDIZIONATE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONTRATTI_ANALISIRIGHECONSUNTIVATECONDIZIONATE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTI_ANALISIRIGHECONSUNTIVATECONDIZIONATE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONTRATTI_ANALISIRIGHECONSUNTIVATECONDIZIONATE] TO [Metodo98]
    AS [dbo];

