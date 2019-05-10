CREATE TABLE [dbo].[ALD_TAB_SottoTipologieAcq] (
    [IDSottoTipAcq]   VARCHAR (6)   NOT NULL,
    [DescSottoTipAcq] VARCHAR (100) NULL,
    [IDCodMacroTip]   VARCHAR (6)   NULL,
    [IDCodAlboForn]   VARCHAR (6)   NULL,
    [Dismesso]        INT           NULL,
    [Note]            VARCHAR (100) NULL,
    [UTENTEMODIFICA]  VARCHAR (25)  NULL,
    [DATAMODIFICA]    DATETIME      NULL,
    CONSTRAINT [PK_ALD_TAB_SottoTipologieAcq] PRIMARY KEY CLUSTERED ([IDSottoTipAcq] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TAB_SottoTipologieAcq] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TAB_SottoTipologieAcq] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TAB_SottoTipologieAcq] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TAB_SottoTipologieAcq] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TAB_SottoTipologieAcq] TO [Metodo98]
    AS [dbo];

