CREATE TABLE [dbo].[CONS_ALD_TABSottoASA] (
    [IdSottoASA]     VARCHAR (5)     NOT NULL,
    [Descrizione]    VARCHAR (80)    NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [idAsa]          VARCHAR (2)     NULL,
    [ScontoMax]      DECIMAL (16, 2) DEFAULT ((0)) NOT NULL,
    [ScontoLimite]   DECIMAL (16, 2) DEFAULT ((0)) NOT NULL,
    [Scontooltre]    DECIMAL (16, 2) DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_CONS_ALD_TABSottoASA] PRIMARY KEY CLUSTERED ([IdSottoASA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONS_ALD_TABSottoASA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONS_ALD_TABSottoASA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONS_ALD_TABSottoASA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONS_ALD_TABSottoASA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONS_ALD_TABSottoASA] TO [Metodo98]
    AS [dbo];

