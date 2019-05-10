﻿CREATE TABLE [dbo].[CONTRATTI_CONSUNTIVATO] (
    [RIFPROGRESSIVO]     DECIMAL (10)    NOT NULL,
    [NRRIGA]             DECIMAL (10)    NOT NULL,
    [POSIZIONE]          INT             NULL,
    [FLAGRIGA]           SMALLINT        NULL,
    [UTENTEMODIFICA]     VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]       DATETIME        NOT NULL,
    [CONSUNTIVATOVALORE] DECIMAL (19, 6) DEFAULT (0) NULL,
    [CONSUNTIVATOQTA]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [CALCOLATO]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [BOLISGRPACQ]        SMALLINT        DEFAULT (0) NOT NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONTRATTI_CONSUNTIVATO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONTRATTI_CONSUNTIVATO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONTRATTI_CONSUNTIVATO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTI_CONSUNTIVATO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONTRATTI_CONSUNTIVATO] TO [Metodo98]
    AS [dbo];

