CREATE TABLE [dbo].[ALD_TabClasseArtNodoPrev] (
    [TipoPrev]               VARCHAR (3)  NOT NULL,
    [ClasseArticoloId]       VARCHAR (6)  NOT NULL,
    [NodoID]                 VARCHAR (50) NOT NULL,
    [FlagRilAttività]        INT          DEFAULT (0) NULL,
    [DescrizioneTipoTransaz] VARCHAR (80) DEFAULT ('') NULL,
    [UTENTEMODIFICA]         VARCHAR (25) NOT NULL,
    [DATAMODIFICA]           DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([TipoPrev] ASC, [ClasseArticoloId] ASC, [NodoID] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TabClasseArtNodoPrev] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TabClasseArtNodoPrev] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TabClasseArtNodoPrev] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TabClasseArtNodoPrev] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TabClasseArtNodoPrev] TO [Metodo98]
    AS [dbo];

