﻿CREATE TABLE [dbo].[CONTRATTI_RESPONS_INTERNI] (
    [RIFPROGRESSIVO] DECIMAL (10)  NOT NULL,
    [NRRIGA]         INT           NOT NULL,
    [FLAGRIGA]       SMALLINT      NULL,
    [POSIZIONE]      INT           NULL,
    [ATTIVITA]       VARCHAR (50)  NULL,
    [RESP1]          VARCHAR (50)  NULL,
    [RESP2]          VARCHAR (50)  NULL,
    [RESP3]          VARCHAR (50)  NULL,
    [DATA]           DATETIME      NULL,
    [ALLEGATO]       VARCHAR (500) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONTRATTI_RESPONS_INTERNI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONTRATTI_RESPONS_INTERNI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONTRATTI_RESPONS_INTERNI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTI_RESPONS_INTERNI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONTRATTI_RESPONS_INTERNI] TO [Metodo98]
    AS [dbo];

