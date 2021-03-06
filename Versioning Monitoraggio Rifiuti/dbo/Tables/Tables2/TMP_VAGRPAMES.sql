﻿CREATE TABLE [dbo].[TMP_VAGRPAMES] (
    [IDSESSIONE]     DECIMAL (10)    NOT NULL,
    [CODARTICOLO]    VARCHAR (50)    NOT NULL,
    [TIPO]           SMALLINT        NOT NULL,
    [ESERCIZIO]      DECIMAL (5)     NOT NULL,
    [RAGGRUPPAMENTO] VARCHAR (80)    NOT NULL,
    [GENNAIO]        DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [FEBBRAIO]       DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [MARZO]          DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [APRILE]         DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [MAGGIO]         DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [GIUGNO]         DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [LUGLIO]         DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [AGOSTO]         DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [SETTEMBRE]      DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [OTTOBRE]        DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [NOVEMBRE]       DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [DICEMBRE]       DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [TOTALE]         DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [CODARTICOLO] ASC, [TIPO] ASC, [ESERCIZIO] ASC, [RAGGRUPPAMENTO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TMP_VAGRPAMES] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TMP_VAGRPAMES] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TMP_VAGRPAMES] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TMP_VAGRPAMES] TO [Metodo98]
    AS [dbo];

