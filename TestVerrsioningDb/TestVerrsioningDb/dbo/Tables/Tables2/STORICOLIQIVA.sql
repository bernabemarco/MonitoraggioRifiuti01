﻿CREATE TABLE [dbo].[STORICOLIQIVA] (
    [ANNO]               SMALLINT        NOT NULL,
    [MESE]               SMALLINT        NOT NULL,
    [TRIM]               SMALLINT        NOT NULL,
    [SUBFORNITURE]       SMALLINT        NULL,
    [EVENTIECCEZ]        SMALLINT        NULL,
    [VP2IMPONIBVEN]      DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [VP3IMPONIBACQ]      DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [VP4IVAVEN]          DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [VP5IVAACQ]          DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [VP6IVADEB]          DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [VP6IVACRED]         DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [VP7DEBPREC25]       DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [VP8CREDITOPREC]     DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [VP9CREDITOANNOPREC] DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [VP10VERSAUTOUE]     DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [VP11CREDIMPOSTA]    DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [VP12INTERESSI]      DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [VP13ACCONTO]        DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [VP14IVAVERS]        DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [VP14IVACRED]        DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [UTENTEMODIFICA]     VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]       DATETIME        NOT NULL,
    [FLGINVIATO]         SMALLINT        CONSTRAINT [DF_STORICOLIQIVA_FLGINVIATO] DEFAULT ((0)) NULL,
    [NOMEFILEXML]        VARCHAR (500)   NULL,
    [NOMEFILEPDF]        VARCHAR (500)   NULL,
    [BANCAVERS]          VARCHAR (7)     NULL,
    [DATAVERS]           DATETIME        NULL,
    [HUBID]              VARCHAR (100)   NULL,
    [SDIID]              VARCHAR (100)   NULL,
    [URLAGYO]            VARCHAR (500)   NULL,
    [IVAART17ACQ]        DECIMAL (19, 4) CONSTRAINT [DF_STORICOLIQIVA_IVAART17ACQ] DEFAULT ((0)) NULL,
    [IVAART17VEN]        DECIMAL (19, 4) CONSTRAINT [DF_STORICOLIQIVA_IVAART17VEN] DEFAULT ((0)) NULL,
    [OPSTRAORDINARIE]    SMALLINT        DEFAULT ((0)) NULL,
    [VP13METODO]         SMALLINT        DEFAULT ((0)) NULL,
    CONSTRAINT [PK_STORICOLIQIVA] PRIMARY KEY CLUSTERED ([ANNO] ASC, [MESE] ASC, [TRIM] ASC),
    CONSTRAINT [CHK_STORICOLIQIVA_OPSTRAORDINARIE] CHECK ([OPSTRAORDINARIE]=(1) OR [OPSTRAORDINARIE]=(0)),
    CONSTRAINT [CHK_STORICOLIQIVA_SUBFORNITURE] CHECK ([SUBFORNITURE]=(1) OR [SUBFORNITURE]=(0))
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[STORICOLIQIVA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[STORICOLIQIVA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[STORICOLIQIVA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[STORICOLIQIVA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[STORICOLIQIVA] TO [Metodo98]
    AS [dbo];
