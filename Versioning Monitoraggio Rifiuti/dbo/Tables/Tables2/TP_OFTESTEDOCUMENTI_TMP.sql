﻿CREATE TABLE [dbo].[TP_OFTESTEDOCUMENTI_TMP] (
    [RIFPROGRESSIVO] DECIMAL (10)    NOT NULL,
    [NUMERODOC]      DECIMAL (10)    NOT NULL,
    [TIPODOC]        VARCHAR (5)     NOT NULL,
    [ESERCIZIO]      DECIMAL (5)     NOT NULL,
    [CODCLIFOR]      VARCHAR (7)     NOT NULL,
    [CODCFFATT]      VARCHAR (7)     NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [CODCAMBIO]      DECIMAL (5)     DEFAULT ((0)) NULL,
    [VALCAMBIO]      DECIMAL (13, 6) DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [NUMERODOC] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_OFTESTEDOCUMENTI_TMP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_OFTESTEDOCUMENTI_TMP] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_OFTESTEDOCUMENTI_TMP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_OFTESTEDOCUMENTI_TMP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_OFTESTEDOCUMENTI_TMP] TO [Metodo98]
    AS [dbo];

