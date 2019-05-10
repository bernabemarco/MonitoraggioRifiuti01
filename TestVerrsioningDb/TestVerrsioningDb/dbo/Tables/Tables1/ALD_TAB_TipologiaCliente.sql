CREATE TABLE [dbo].[ALD_TAB_TipologiaCliente] (
    [Codice]         SMALLINT      NOT NULL,
    [Descrizione]    NVARCHAR (80) NULL,
    [FlStratecigo]   SMALLINT      DEFAULT ((0)) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    CONSTRAINT [PK_ALD_TAB_TipologiaCliente] PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TAB_TipologiaCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TAB_TipologiaCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TAB_TipologiaCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TAB_TipologiaCliente] TO [Metodo98]
    AS [dbo];

