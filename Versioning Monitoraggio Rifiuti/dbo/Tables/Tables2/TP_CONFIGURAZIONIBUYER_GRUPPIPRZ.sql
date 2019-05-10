﻿CREATE TABLE [dbo].[TP_CONFIGURAZIONIBUYER_GRUPPIPRZ] (
    [CODBUYER]         VARCHAR (7)  NOT NULL,
    [CODDEPOSITO]      VARCHAR (10) NOT NULL,
    [CODFORNITORE]     VARCHAR (7)  NOT NULL,
    [CODGRUPPOPRZPART] DECIMAL (5)  NOT NULL,
    [UTENTEMODIFICA]   VARCHAR (25) NOT NULL,
    [DATAMODIFICA]     DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([CODBUYER] ASC, [CODDEPOSITO] ASC, [CODFORNITORE] ASC, [CODGRUPPOPRZPART] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_CONFIGURAZIONIBUYER_GRUPPIPRZ] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_CONFIGURAZIONIBUYER_GRUPPIPRZ] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_CONFIGURAZIONIBUYER_GRUPPIPRZ] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_CONFIGURAZIONIBUYER_GRUPPIPRZ] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_CONFIGURAZIONIBUYER_GRUPPIPRZ] TO [Metodo98]
    AS [dbo];

