CREATE TABLE [dbo].[ALD_TAB_TipoCliente] (
    [Codice]            SMALLINT      NOT NULL,
    [Descrizione]       NVARCHAR (80) NULL,
    [UTENTEMODIFICA]    VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]      DATETIME      NOT NULL,
    [ava_tipologia]     SMALLINT      NULL,
    [CodClienteModello] VARCHAR (7)   NULL,
    [ClassCID]          VARCHAR (10)  NULL,
    [FlgCondominio]     SMALLINT      DEFAULT ((0)) NULL,
    [FlgPersonaFisica]  SMALLINT      DEFAULT ((0)) NULL,
    [AllertNote]        VARCHAR (500) NULL,
    [FlgControlliPA]    SMALLINT      DEFAULT ((0)) NULL,
    CONSTRAINT [PK_ALD_TAB_TipoCliente] PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TAB_TipoCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TAB_TipoCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TAB_TipoCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TAB_TipoCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TAB_TipoCliente] TO [Metodo98]
    AS [dbo];

