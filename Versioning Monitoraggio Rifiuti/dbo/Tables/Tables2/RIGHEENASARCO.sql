﻿CREATE TABLE [dbo].[RIGHEENASARCO] (
    [NRBOZZA]            DECIMAL (10)    NOT NULL,
    [NRRIGA]             DECIMAL (5)     NOT NULL,
    [FLAGRIGA]           SMALLINT        NULL,
    [POSIZIONE]          DECIMAL (5)     NULL,
    [MESECOMPETENZA]     SMALLINT        NULL,
    [ANNOCOMPETENZA]     SMALLINT        NULL,
    [DSCRIGA]            VARCHAR (80)    NULL,
    [SEGNOIMPORTI]       SMALLINT        DEFAULT (0) NULL,
    [IMPORTO]            DECIMAL (19, 4) DEFAULT (0) NULL,
    [IMPORTOEURO]        DECIMAL (19, 4) DEFAULT (0) NULL,
    [CODICEIVA]          DECIMAL (5)     NOT NULL,
    [PERCENASAGE]        DECIMAL (8, 5)  DEFAULT (0) NULL,
    [IMPORTOENASAGE]     DECIMAL (19, 4) DEFAULT (0) NULL,
    [IMPORTOENASAGEEURO] DECIMAL (19, 4) DEFAULT (0) NULL,
    [PERCENASAZ]         DECIMAL (8, 5)  DEFAULT (0) NULL,
    [IMPORTOENASAZ]      DECIMAL (19, 4) DEFAULT (0) NULL,
    [IMPORTOENASAZEURO]  DECIMAL (19, 4) DEFAULT (0) NULL,
    [UTENTEMODIFICA]     VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]       DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([NRBOZZA] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90),
    CHECK ([SEGNOIMPORTI] is null or [SEGNOIMPORTI] = 1 or [SEGNOIMPORTI] = 0)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[RIGHEENASARCO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[RIGHEENASARCO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[RIGHEENASARCO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[RIGHEENASARCO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[RIGHEENASARCO] TO [Metodo98]
    AS [dbo];
