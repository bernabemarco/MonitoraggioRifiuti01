CREATE TABLE [dbo].[CONS_ALD_TabTipoCommessaASA] (
    [TipoCommessa]   VARCHAR (3)  NOT NULL,
    [IdASA]          VARCHAR (2)  NOT NULL,
    [Descrizione]    VARCHAR (80) NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    [IdTipologiaCom] VARCHAR (3)  NULL,
    CONSTRAINT [PK_CONS_TabTipoCommessaASA] PRIMARY KEY CLUSTERED ([TipoCommessa] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONS_ALD_TabTipoCommessaASA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONS_ALD_TabTipoCommessaASA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONS_ALD_TabTipoCommessaASA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONS_ALD_TabTipoCommessaASA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONS_ALD_TabTipoCommessaASA] TO [Metodo98]
    AS [dbo];

