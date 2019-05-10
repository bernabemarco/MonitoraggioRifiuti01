CREATE TABLE [dbo].[GRI_RAPPORTI_OreLavoroAddebito] (
    [IDRAPPORTO]     CHAR (14)      NOT NULL,
    [idRiga]         DECIMAL (5)    NOT NULL,
    [TipoAgente]     SMALLINT       NULL,
    [DATA]           DATETIME       NOT NULL,
    [TECNICO]        VARCHAR (7)    NOT NULL,
    [OREORD]         NUMERIC (5, 2) NULL,
    [ORESTRA]        NUMERIC (5, 2) NULL,
    [OREVIAGGIO]     NUMERIC (5, 2) NULL,
    [TRASFERTA]      NUMERIC (5, 2) NULL,
    [KM]             NUMERIC (6, 2) NULL,
    [UTENTEMODIFICA] VARCHAR (25)   NOT NULL,
    [DATAMODIFICA]   DATETIME       NOT NULL,
    [PERNOTTO]       NUMERIC (5, 2) NULL,
    CONSTRAINT [PK_GRI_RAPPORTI_OreLavoroAddebito] PRIMARY KEY CLUSTERED ([IDRAPPORTO] ASC, [idRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GRI_RAPPORTI_OreLavoroAddebito] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GRI_RAPPORTI_OreLavoroAddebito] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GRI_RAPPORTI_OreLavoroAddebito] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GRI_RAPPORTI_OreLavoroAddebito] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GRI_RAPPORTI_OreLavoroAddebito] TO [Metodo98]
    AS [dbo];

