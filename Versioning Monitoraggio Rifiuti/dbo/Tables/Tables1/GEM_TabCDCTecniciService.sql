CREATE TABLE [dbo].[GEM_TabCDCTecniciService] (
    [CDCTECNICISERVICE]        DECIMAL (5)     NOT NULL,
    [DESCRIZIONE]              VARCHAR (80)    NULL,
    [CostoOrarioOrdinario]     NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [CostoOrarioViaggio]       NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [CostoOrarioStraordinario] NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [CostoKM]                  NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [CostoOrarioMezzo]         NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [CostoTrasfGiornaliera]    NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [UTENTEMODIFICA]           VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]             DATETIME        NOT NULL,
    CONSTRAINT [GEM_TabCDCTecniciService_PK] PRIMARY KEY CLUSTERED ([CDCTECNICISERVICE] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_TabCDCTecniciService] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_TabCDCTecniciService] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_TabCDCTecniciService] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_TabCDCTecniciService] TO [Metodo98]
    AS [dbo];

