﻿CREATE TABLE [dbo].[GRI_RAPPORTI_Componenti] (
    [IDRAPPORTO]          VARCHAR (14)    NOT NULL,
    [IdRigaMezzo]         DECIMAL (5)     NOT NULL,
    [POSIZIONE]           DECIMAL (5)     NOT NULL,
    [IdApparato]          VARCHAR (50)    NOT NULL,
    [IdSottoTipoApparato] VARCHAR (7)     NULL,
    [MARCA]               VARCHAR (50)    NULL,
    [MODELLO]             VARCHAR (50)    NULL,
    [QUANTITA]            DECIMAL (5)     DEFAULT ((1)) NULL,
    [IMPORTO_UNITARIO]    DECIMAL (9, 2)  DEFAULT ((0)) NULL,
    [ELIMINATO]           CHAR (1)        DEFAULT ('0') NOT NULL,
    [PROVVIGIONE1]        NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [PROVVIGIONE2]        NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [PROVVIGIONE3]        NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [NOTE]                VARCHAR (1000)  NULL,
    [UTENTEMODIFICA]      VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]        DATETIME        NOT NULL,
    [SEGNALATO]           SMALLINT        NULL,
    CONSTRAINT [GRI_RAPPORTI_Componenti_PK] PRIMARY KEY CLUSTERED ([IDRAPPORTO] ASC, [IdRigaMezzo] ASC, [POSIZIONE] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GRI_RAPPORTI_Componenti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GRI_RAPPORTI_Componenti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GRI_RAPPORTI_Componenti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GRI_RAPPORTI_Componenti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GRI_RAPPORTI_Componenti] TO [Metodo98]
    AS [dbo];

