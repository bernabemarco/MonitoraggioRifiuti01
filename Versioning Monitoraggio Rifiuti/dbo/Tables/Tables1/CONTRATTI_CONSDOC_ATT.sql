﻿CREATE TABLE [dbo].[CONTRATTI_CONSDOC_ATT] (
    [ESERCIZIO]                 DECIMAL (5)  NOT NULL,
    [TIPODOC]                   VARCHAR (3)  NOT NULL,
    [DADATA]                    DATETIME     NULL,
    [ADATA]                     DATETIME     NULL,
    [CONSIDERARIGHEVALORE]      SMALLINT     DEFAULT ((0)) NULL,
    [CONSIDERARIGHEQTASCTMERCE] SMALLINT     DEFAULT ((0)) NULL,
    [FLGESERCIZIO]              SMALLINT     DEFAULT ((0)) NULL,
    [INSOTTRAZIONE]             SMALLINT     DEFAULT ((0)) NULL,
    [UTENTEMODIFICA]            VARCHAR (25) NULL,
    [DATAMODIFICA]              DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([ESERCIZIO] ASC, [TIPODOC] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONTRATTI_CONSDOC_ATT] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONTRATTI_CONSDOC_ATT] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONTRATTI_CONSDOC_ATT] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTI_CONSDOC_ATT] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONTRATTI_CONSDOC_ATT] TO [Metodo98]
    AS [dbo];
