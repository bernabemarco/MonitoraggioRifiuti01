﻿CREATE TABLE [dbo].[PARAMETRIRIORDXDEPOSITO] (
    [ESERCIZIO]        SMALLINT        NOT NULL,
    [DEPOSITO]         VARCHAR (10)    NOT NULL,
    [CODART]           VARCHAR (50)    NOT NULL,
    [SCORTAMIN]        DECIMAL (16, 6) NULL,
    [TEMPOCOPERTURA]   SMALLINT        NULL,
    [LIVRIORDINO]      DECIMAL (16, 6) NULL,
    [LOTTORIORDINO]    DECIMAL (16, 6) NULL,
    [INTERVALLOPIANIF] SMALLINT        NULL,
    [DATAULTANALISI]   DATETIME        NULL,
    [QTAMINTRASF]      DECIMAL (16, 6) NULL,
    [ARROTONDA]        INT             NULL,
    [TEMPOMEDIOTRASF]  SMALLINT        NULL,
    [QTAMINCONS]       DECIMAL (16, 6) NULL,
    [UTENTEMODIFICA]   VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]     DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([ESERCIZIO] ASC, [DEPOSITO] ASC, [CODART] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PARAMETRIRIORDXDEPOSITO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PARAMETRIRIORDXDEPOSITO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PARAMETRIRIORDXDEPOSITO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PARAMETRIRIORDXDEPOSITO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PARAMETRIRIORDXDEPOSITO] TO [Metodo98]
    AS [dbo];

