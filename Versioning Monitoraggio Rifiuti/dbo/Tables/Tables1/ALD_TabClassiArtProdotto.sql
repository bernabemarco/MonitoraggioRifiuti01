CREATE TABLE [dbo].[ALD_TabClassiArtProdotto] (
    [ClasseArticoloId]   VARCHAR (6)  NOT NULL,
    [Descrizione]        VARCHAR (80) DEFAULT ('') NULL,
    [TipoClasse]         VARCHAR (3)  DEFAULT ('') NULL,
    [TipoDocPrevisione]  VARCHAR (3)  DEFAULT ('') NULL,
    [UTENTEMODIFICA]     VARCHAR (25) NOT NULL,
    [DATAMODIFICA]       DATETIME     NOT NULL,
    [TotalizzPreventivo] VARCHAR (3)  DEFAULT ('') NULL,
    PRIMARY KEY CLUSTERED ([ClasseArticoloId] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TabClassiArtProdotto] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TabClassiArtProdotto] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TabClassiArtProdotto] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TabClassiArtProdotto] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TabClassiArtProdotto] TO [Metodo98]
    AS [dbo];

