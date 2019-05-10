CREATE TABLE [dbo].[ScadenziarioPOS] (
    [CodArt]         VARCHAR (50) NOT NULL,
    [Barcode]        VARCHAR (12) DEFAULT ('') NOT NULL,
    [TipoOperazione] VARCHAR (1)  DEFAULT ('M') NOT NULL,
    [EtcStampata]    SMALLINT     DEFAULT (0) NULL,
    [InviatoCasse]   SMALLINT     DEFAULT (0) NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([CodArt] ASC, [Barcode] ASC, [TipoOperazione] ASC) WITH (FILLFACTOR = 90),
    CHECK ([TipoOperazione] is null or ([TipoOperazione] = 'A' or [TipoOperazione] = 'M'))
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ScadenziarioPOS] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ScadenziarioPOS] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ScadenziarioPOS] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ScadenziarioPOS] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ScadenziarioPOS] TO [Metodo98]
    AS [dbo];

