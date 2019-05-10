CREATE TABLE [dbo].[GRI_RAPPORTI_OreLavoroInterno] (
    [IDRAPPORTO]       CHAR (14)       NOT NULL,
    [idRiga]           DECIMAL (5)     NOT NULL,
    [DATA]             DATETIME        NOT NULL,
    [TECNICO]          VARCHAR (7)     NOT NULL,
    [OREORD]           NUMERIC (5, 2)  DEFAULT ((0)) NULL,
    [ORESTRA]          NUMERIC (5, 2)  DEFAULT ((0)) NULL,
    [OREVIAGGIO]       NUMERIC (5, 2)  DEFAULT ((0)) NULL,
    [TRASFERTA]        NUMERIC (5, 2)  DEFAULT ((0)) NULL,
    [KM]               NUMERIC (6, 2)  DEFAULT ((0)) NULL,
    [NumNottiTasferta] DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [SpeseVittoEVarie] DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [NumeroGGuso]      DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [UTENTEMODIFICA]   VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]     DATETIME        NOT NULL,
    CONSTRAINT [PK_GRI_RAPPORTI_OreLavoroInterno] PRIMARY KEY CLUSTERED ([IDRAPPORTO] ASC, [idRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GRI_RAPPORTI_OreLavoroInterno] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GRI_RAPPORTI_OreLavoroInterno] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GRI_RAPPORTI_OreLavoroInterno] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GRI_RAPPORTI_OreLavoroInterno] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GRI_RAPPORTI_OreLavoroInterno] TO [Metodo98]
    AS [dbo];

