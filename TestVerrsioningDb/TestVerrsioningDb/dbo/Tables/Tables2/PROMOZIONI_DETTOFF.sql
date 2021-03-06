﻿CREATE TABLE [dbo].[PROMOZIONI_DETTOFF] (
    [RIFPROGRESSIVO] DECIMAL (10)    NOT NULL,
    [NRRIGA]         INT             NOT NULL,
    [NUMRIGA]        INT             NOT NULL,
    [TIPO]           INT             NOT NULL,
    [CODICE]         VARCHAR (50)    NOT NULL,
    [UM]             VARCHAR (3)     NOT NULL,
    [QTA]            DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [LISTINO]        DECIMAL (5)     NULL,
    [PREZZO]         DECIMAL (19, 6) NULL,
    [SCONTO]         VARCHAR (20)    NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [CONTROPARTITA]  VARCHAR (7)     NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [NRRIGA] ASC, [NUMRIGA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PROMOZIONI_DETTOFF] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PROMOZIONI_DETTOFF] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PROMOZIONI_DETTOFF] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PROMOZIONI_DETTOFF] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PROMOZIONI_DETTOFF] TO [Metodo98]
    AS [dbo];

