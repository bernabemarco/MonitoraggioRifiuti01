﻿CREATE TABLE [dbo].[TEMPANALISIRITARDIPROD] (
    [NRTERMINALE]     SMALLINT     NOT NULL,
    [TIPORECORD]      SMALLINT     NOT NULL,
    [IDTESTA]         DECIMAL (10) NOT NULL,
    [IDRIGA]          INT          NOT NULL,
    [RIFORDINE]       VARCHAR (30) NOT NULL,
    [GGRITARDO]       SMALLINT     NULL,
    [DATACONSEGNA]    DATETIME     NULL,
    [NUOVADATAINIZIO] DATETIME     NULL,
    [NUOVADATACONS]   DATETIME     NULL,
    [CONSIDERA]       SMALLINT     NULL,
    [LIVPRODUZIONE]   VARCHAR (1)  NULL,
    [CODARTICOLO]     VARCHAR (50) NULL,
    [RIFCOMMCLI]      VARCHAR (30) NULL,
    [UTENTEMODIFICA]  VARCHAR (25) NOT NULL,
    [DATAMODIFICA]    DATETIME     NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPANALISIRITARDIPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPANALISIRITARDIPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPANALISIRITARDIPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPANALISIRITARDIPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPANALISIRITARDIPROD] TO [Metodo98]
    AS [dbo];
