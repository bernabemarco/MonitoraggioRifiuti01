﻿CREATE TABLE [dbo].[CONTRATTI_RCFV_CATEGORIAS] (
    [RIFPROGRESSIVO] DECIMAL (10) NOT NULL,
    [NRRIGA]         INT          NOT NULL,
    [FLAGRIGA]       SMALLINT     NULL,
    [POSIZIONE]      INT          NULL,
    [CODICE]         DECIMAL (5)  NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONTRATTI_RCFV_CATEGORIAS] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONTRATTI_RCFV_CATEGORIAS] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONTRATTI_RCFV_CATEGORIAS] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTI_RCFV_CATEGORIAS] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONTRATTI_RCFV_CATEGORIAS] TO [Metodo98]
    AS [dbo];

