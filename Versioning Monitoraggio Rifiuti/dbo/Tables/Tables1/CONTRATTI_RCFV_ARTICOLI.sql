﻿CREATE TABLE [dbo].[CONTRATTI_RCFV_ARTICOLI] (
    [RIFPROGRESSIVO] DECIMAL (10)  NOT NULL,
    [NRRIGA]         INT           NOT NULL,
    [FLAGRIGA]       SMALLINT      NULL,
    [POSIZIONE]      INT           NULL,
    [RIFERIMENTO]    VARCHAR (50)  NULL,
    [ARTICOLO]       VARCHAR (50)  NULL,
    [DESCRIZIONEART] VARCHAR (80)  NULL,
    [VARIANTI]       VARCHAR (50)  NULL,
    [DESCRIZIONE]    VARCHAR (80)  NULL,
    [TIPOREL]        SMALLINT      NULL,
    [MOSTRAVARIANTI] SMALLINT      NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    [VARESPLICITE]   VARCHAR (255) DEFAULT ('') NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONTRATTI_RCFV_ARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONTRATTI_RCFV_ARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONTRATTI_RCFV_ARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTI_RCFV_ARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONTRATTI_RCFV_ARTICOLI] TO [Metodo98]
    AS [dbo];

