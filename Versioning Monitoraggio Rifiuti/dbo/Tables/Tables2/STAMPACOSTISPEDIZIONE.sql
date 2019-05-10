﻿CREATE TABLE [dbo].[STAMPACOSTISPEDIZIONE] (
    [TERMINALE]           SMALLINT        NOT NULL,
    [TIPODOC]             VARCHAR (3)     NULL,
    [ANNODOC]             SMALLINT        NOT NULL,
    [NUMERODOC]           INT             NOT NULL,
    [BIS]                 CHAR (1)        NOT NULL,
    [CODSPED]             DECIMAL (5)     NOT NULL,
    [RIGACOSTO]           INT             NOT NULL,
    [PESOTASSATO]         DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [SPINOLTRO]           DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [COSTOSPEDIZIONE]     DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [SpInoltroEuro]       DECIMAL (19, 4) NULL,
    [CostoSpedizioneEuro] DECIMAL (19, 4) NULL,
    [PRCTOTMERCE]         DECIMAL (8, 5)  NULL,
    [IMPTOTMERCE]         DECIMAL (19, 6) NULL,
    [IMPTOTMERCEEURO]     DECIMAL (19, 6) NULL,
    [INOLTROUNITKG]       DECIMAL (19, 6) NULL,
    [INOLTROUNITKGEURO]   DECIMAL (19, 6) NULL
);


GO
CREATE NONCLUSTERED INDEX [STPCOSTISPED_SPED]
    ON [dbo].[STAMPACOSTISPEDIZIONE]([CODSPED] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[STAMPACOSTISPEDIZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[STAMPACOSTISPEDIZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[STAMPACOSTISPEDIZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[STAMPACOSTISPEDIZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[STAMPACOSTISPEDIZIONE] TO [Metodo98]
    AS [dbo];

