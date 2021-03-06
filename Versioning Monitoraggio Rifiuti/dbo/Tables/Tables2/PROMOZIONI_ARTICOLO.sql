﻿CREATE TABLE [dbo].[PROMOZIONI_ARTICOLO] (
    [RIFPROGRESSIVO] DECIMAL (10)  NOT NULL,
    [NRRIGA]         INT           NOT NULL,
    [FLAGRIGA]       SMALLINT      NULL,
    [POSIZIONE]      INT           NULL,
    [CODICE]         VARCHAR (50)  NULL,
    [DESCRIZIONE]    VARCHAR (80)  NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    [CODICEPRIMARIO] VARCHAR (50)  DEFAULT ('') NULL,
    [VARESPLICITE]   VARCHAR (255) DEFAULT ('') NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [NRRIGA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PROMOZIONI_ARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PROMOZIONI_ARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PROMOZIONI_ARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PROMOZIONI_ARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PROMOZIONI_ARTICOLO] TO [Metodo98]
    AS [dbo];

