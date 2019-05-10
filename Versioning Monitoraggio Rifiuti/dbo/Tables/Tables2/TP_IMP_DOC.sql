﻿CREATE TABLE [dbo].[TP_IMP_DOC] (
    [PROGRESSIVO]    DECIMAL (10)    DEFAULT (0) NOT NULL,
    [IDSESSIONE]     DECIMAL (5)     DEFAULT (0) NOT NULL,
    [CODAGENTE]      VARCHAR (7)     NOT NULL,
    [DSCAGENTE]      VARCHAR (80)    NULL,
    [TIPODATI]       SMALLINT        NOT NULL,
    [CLIENTE]        VARCHAR (7)     NOT NULL,
    [DSCCLIENTE]     VARCHAR (80)    NULL,
    [PROGDOC]        DECIMAL (19, 6) DEFAULT (0) NOT NULL,
    [ESERCIZIO]      DECIMAL (5)     NOT NULL,
    [TIPODOC]        VARCHAR (3)     NOT NULL,
    [NUMERODOC]      DECIMAL (10)    NOT NULL,
    [DATADOC]        DATETIME        NOT NULL,
    [CODCAMBIO]      DECIMAL (5)     NULL,
    [CODPAGAMENTO]   VARCHAR (4)     NULL,
    [IMPORTO]        DECIMAL (19, 6) DEFAULT (0) NOT NULL,
    [IMPORTOEURO]    DECIMAL (19, 6) DEFAULT (0) NOT NULL,
    [SCONTOFINALE]   VARCHAR (50)    NULL,
    [ASCADERE]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [FIDOEURO]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [STATODOC]       SMALLINT        DEFAULT (0) NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [DESCSTATO]      VARCHAR (255)   CONSTRAINT [DF_TP_IMP_DOC_DESCSTATO] DEFAULT ('') NULL,
    [NUMRIFDOC]      VARCHAR (15)    CONSTRAINT [DF_TP_IMP_DOC_NUMRIFDOC] DEFAULT ('') NULL,
    CONSTRAINT [PK_TP_IMP_DOC] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_IMP_DOC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_IMP_DOC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_IMP_DOC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_IMP_DOC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_IMP_DOC] TO [Metodo98]
    AS [dbo];

