﻿CREATE TABLE [dbo].[MACCHINEALTERNATIVEFASEEST] (
    [CODOPERAZIONE]        VARCHAR (5)     NOT NULL,
    [NRRIGA]               SMALLINT        NOT NULL,
    [CODCDLAVORO]          VARCHAR (5)     NULL,
    [CODMACCHINA]          VARCHAR (5)     NULL,
    [FLAGPREFERENZIALE]    SMALLINT        NULL,
    [TEMPOATTRAVERSAMENTO] DECIMAL (16, 6) NULL,
    [LOTTOATTRAVERSAMENTO] DECIMAL (16, 6) NULL,
    [TIPOARROTONDAMENTO]   SMALLINT        NULL,
    [UTENTEMODIFICA]       VARCHAR (25)    NULL,
    [DATAMODIFICA]         DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([CODOPERAZIONE] ASC, [NRRIGA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[MACCHINEALTERNATIVEFASEEST] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MACCHINEALTERNATIVEFASEEST] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[MACCHINEALTERNATIVEFASEEST] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MACCHINEALTERNATIVEFASEEST] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MACCHINEALTERNATIVEFASEEST] TO [Metodo98]
    AS [dbo];

