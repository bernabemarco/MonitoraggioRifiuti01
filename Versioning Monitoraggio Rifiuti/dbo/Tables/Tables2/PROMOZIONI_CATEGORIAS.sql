﻿CREATE TABLE [dbo].[PROMOZIONI_CATEGORIAS] (
    [RIFPROGRESSIVO] DECIMAL (10) NOT NULL,
    [NRRIGA]         INT          NOT NULL,
    [FLAGRIGA]       SMALLINT     NULL,
    [POSIZIONE]      INT          NULL,
    [CODICE]         DECIMAL (5)  NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [NRRIGA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PROMOZIONI_CATEGORIAS] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PROMOZIONI_CATEGORIAS] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PROMOZIONI_CATEGORIAS] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PROMOZIONI_CATEGORIAS] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PROMOZIONI_CATEGORIAS] TO [Metodo98]
    AS [dbo];

