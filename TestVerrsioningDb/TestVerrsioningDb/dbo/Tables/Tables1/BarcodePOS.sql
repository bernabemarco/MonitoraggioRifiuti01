CREATE TABLE [dbo].[BarcodePOS] (
    [CodArt]         VARCHAR (50) NOT NULL,
    [Barcode]        VARCHAR (12) NOT NULL,
    [Descrizione]    VARCHAR (18) NULL,
    [UM]             VARCHAR (3)  NOT NULL,
    [Preferenziale]  SMALLINT     DEFAULT (0) NOT NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([CodArt] ASC, [Barcode] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [BarcodeUnivoco]
    ON [dbo].[BarcodePOS]([Barcode] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BarcodePOS] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BarcodePOS] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BarcodePOS] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BarcodePOS] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BarcodePOS] TO [Metodo98]
    AS [dbo];

