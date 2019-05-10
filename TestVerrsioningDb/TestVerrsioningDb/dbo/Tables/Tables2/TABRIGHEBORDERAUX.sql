﻿CREATE TABLE [dbo].[TABRIGHEBORDERAUX] (
    [RIFPROGRESSIVO]           DECIMAL (10)    NOT NULL,
    [NRRIGA]                   DECIMAL (5)     NOT NULL,
    [POSIZIONE]                INT             DEFAULT (0) NULL,
    [TIPODOC]                  VARCHAR (3)     DEFAULT ('') NULL,
    [PROGDOC]                  DECIMAL (10)    DEFAULT (0) NULL,
    [NUMDOC]                   DECIMAL (10)    DEFAULT (0) NULL,
    [CONSEGNATO]               SMALLINT        DEFAULT (0) NULL,
    [INCASSATO]                SMALLINT        DEFAULT (0) NULL,
    [VALORE_INCASSATO]         DECIMAL (16, 6) DEFAULT (0) NULL,
    [RIFPROGTESTECONT]         DECIMAL (10)    DEFAULT (0) NULL,
    [UTENTEMODIFICA]           VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]             DATETIME        NOT NULL,
    [RIFPROGTESTECONT_Abbuono] DECIMAL (10)    DEFAULT (0) NULL,
    CONSTRAINT [PK_TABRIGHEBORDERAUX] PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABRIGHEBORDERAUX] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABRIGHEBORDERAUX] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABRIGHEBORDERAUX] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABRIGHEBORDERAUX] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABRIGHEBORDERAUX] TO [Metodo98]
    AS [dbo];

