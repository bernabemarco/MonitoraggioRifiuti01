﻿CREATE TABLE [dbo].[GEM_SEZIONECONTRATTORAPPORTI_OreLavoroINTERNE] (
    [IDRAPPORTO]        CHAR (14)      NOT NULL,
    [idRiga]            DECIMAL (5)    NOT NULL,
    [IDCONTRATTO]       VARCHAR (13)   NOT NULL,
    [SEZIONECONTRATTO]  DECIMAL (5)    NOT NULL,
    [TIPOLOGIARAPPORTO] VARCHAR (2)    NOT NULL,
    [DATA]              DATETIME       NOT NULL,
    [TECNICO]           VARCHAR (7)    NOT NULL,
    [OREORD]            NUMERIC (5, 2) NULL,
    [ORESTRA]           NUMERIC (5, 2) NULL,
    [OREVIAGGIO]        NUMERIC (5, 2) NULL,
    [TRASFERTA]         NUMERIC (5, 2) NULL,
    [KM]                NUMERIC (6, 2) NULL,
    [UTENTEMODIFICA]    VARCHAR (25)   NOT NULL,
    [DATAMODIFICA]      DATETIME       NOT NULL,
    [PERNOTTO]          NUMERIC (5, 2) NULL,
    CONSTRAINT [PK_GEM_SEZIONECONTRATTORAPPORTI_OreLavoroINTERNE] PRIMARY KEY CLUSTERED ([IDRAPPORTO] ASC, [idRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_SEZIONECONTRATTORAPPORTI_OreLavoroINTERNE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_SEZIONECONTRATTORAPPORTI_OreLavoroINTERNE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_SEZIONECONTRATTORAPPORTI_OreLavoroINTERNE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_SEZIONECONTRATTORAPPORTI_OreLavoroINTERNE] TO [Metodo98]
    AS [dbo];

