﻿CREATE TABLE [dbo].[TP_TRASPORTODETTAGLIOACQ] (
    [RIFPROGRESSIVO]        DECIMAL (18)    NOT NULL,
    [ESERCIZIO]             DECIMAL (5)     NOT NULL,
    [TIPODOC]               VARCHAR (3)     NOT NULL,
    [NUMERODOC]             DECIMAL (10)    NOT NULL,
    [TOTALEKG]              DECIMAL (16, 6) NOT NULL,
    [PEDANENR]              DECIMAL (16, 6) CONSTRAINT [DF_TP_TRASPORTODETTAGLIOACQ_PEDANENR] DEFAULT ((0)) NOT NULL,
    [PEDANECOSTO]           DECIMAL (19, 6) NOT NULL,
    [PEDANECOSTOTOTALE]     DECIMAL (19, 6) NOT NULL,
    [PEDANECOSTOXFORNITORE] DECIMAL (19, 6) NOT NULL,
    [COSTOXKG]              DECIMAL (19, 6) NOT NULL,
    [UTENTEMODIFICA]        VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]          DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [ESERCIZIO] ASC, [TIPODOC] ASC, [NUMERODOC] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_TRASPORTODETTAGLIOACQ] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_TRASPORTODETTAGLIOACQ] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_TRASPORTODETTAGLIOACQ] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_TRASPORTODETTAGLIOACQ] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_TRASPORTODETTAGLIOACQ] TO [Metodo98]
    AS [dbo];

