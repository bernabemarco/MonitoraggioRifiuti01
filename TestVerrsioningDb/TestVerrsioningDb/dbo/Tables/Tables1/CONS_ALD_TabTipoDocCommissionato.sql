CREATE TABLE [dbo].[CONS_ALD_TabTipoDocCommissionato] (
    [TipoDoc]        VARCHAR (3)  NOT NULL,
    [Descrizione]    VARCHAR (80) NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_CONS_ALD_TabTipoDocCommissionato] PRIMARY KEY CLUSTERED ([TipoDoc] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONS_ALD_TabTipoDocCommissionato] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONS_ALD_TabTipoDocCommissionato] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONS_ALD_TabTipoDocCommissionato] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONS_ALD_TabTipoDocCommissionato] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONS_ALD_TabTipoDocCommissionato] TO [Metodo98]
    AS [dbo];

