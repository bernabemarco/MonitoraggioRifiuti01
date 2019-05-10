CREATE TABLE [dbo].[CONS_ALD_TABASA] (
    [IdASA]          VARCHAR (2)  NOT NULL,
    [Descrizione]    VARCHAR (80) NULL,
    [IdServizio]     VARCHAR (2)  NULL,
    [IdPrestazione]  VARCHAR (3)  NULL,
    [IdRaggrPrest]   VARCHAR (2)  NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_CONS_ALD_TABASA] PRIMARY KEY CLUSTERED ([IdASA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONS_ALD_TABASA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONS_ALD_TABASA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONS_ALD_TABASA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONS_ALD_TABASA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONS_ALD_TABASA] TO [Metodo98]
    AS [dbo];

