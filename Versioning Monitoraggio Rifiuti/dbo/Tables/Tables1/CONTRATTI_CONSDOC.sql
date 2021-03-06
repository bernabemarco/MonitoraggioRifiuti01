﻿CREATE TABLE [dbo].[CONTRATTI_CONSDOC] (
    [RIFPROGRESSIVO]            DECIMAL (10) NOT NULL,
    [NRRIGA]                    INT          NOT NULL,
    [FLAGRIGA]                  SMALLINT     NULL,
    [POSIZIONE]                 INT          NULL,
    [TIPODOC]                   VARCHAR (3)  NULL,
    [DADATA]                    DATETIME     NULL,
    [ADATA]                     DATETIME     NULL,
    [UTENTEMODIFICA]            VARCHAR (25) NULL,
    [DATAMODIFICA]              DATETIME     NULL,
    [CONSIDERARIGHEVALORE]      SMALLINT     DEFAULT (0) NULL,
    [CONSIDERARIGHEQTASCTMERCE] SMALLINT     DEFAULT (0) NULL,
    [FLGESERCIZIO]              SMALLINT     DEFAULT (0) NULL,
    [INSOTTRAZIONE]             SMALLINT     DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONTRATTI_CONSDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONTRATTI_CONSDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONTRATTI_CONSDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTI_CONSDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONTRATTI_CONSDOC] TO [Metodo98]
    AS [dbo];

