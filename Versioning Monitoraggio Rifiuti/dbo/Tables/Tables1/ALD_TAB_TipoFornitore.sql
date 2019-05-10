CREATE TABLE [dbo].[ALD_TAB_TipoFornitore] (
    [IDTipoForn]     VARCHAR (6)   NOT NULL,
    [Descrizione]    VARCHAR (100) NULL,
    [Dismesso]       INT           NULL,
    [Note]           VARCHAR (100) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NULL,
    [DATAMODIFICA]   DATETIME      NULL,
    CONSTRAINT [PK_ALD_TAB_TipoFornitore] PRIMARY KEY CLUSTERED ([IDTipoForn] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TAB_TipoFornitore] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TAB_TipoFornitore] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TAB_TipoFornitore] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TAB_TipoFornitore] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TAB_TipoFornitore] TO [Metodo98]
    AS [dbo];

