CREATE TABLE [dbo].[ALD_TAB_StatoFornitore] (
    [IDStatoForn]        VARCHAR (6)   NOT NULL,
    [Descrizione]        VARCHAR (100) NULL,
    [Dismesso]           INT           NULL,
    [Note]               VARCHAR (100) NULL,
    [UTENTEMODIFICA]     VARCHAR (25)  NULL,
    [DATAMODIFICA]       DATETIME      NULL,
    [STATOORDINI]        SMALLINT      NULL,
    [STATOBOLLE]         SMALLINT      NULL,
    [STATOFATTURE]       SMALLINT      NULL,
    [STATONOTEACCREDITO] SMALLINT      NULL,
    [STATOALTRO]         SMALLINT      NULL,
    [AvvBloccoPortali]   INT           NULL,
    [AvvBloccoVTE]       INT           NULL,
    CONSTRAINT [PK_ALD_TAB_StatoFornitore] PRIMARY KEY CLUSTERED ([IDStatoForn] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TAB_StatoFornitore] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TAB_StatoFornitore] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TAB_StatoFornitore] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TAB_StatoFornitore] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TAB_StatoFornitore] TO [Metodo98]
    AS [dbo];

