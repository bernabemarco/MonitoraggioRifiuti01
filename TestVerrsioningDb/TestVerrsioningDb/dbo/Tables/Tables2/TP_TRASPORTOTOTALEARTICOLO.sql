﻿CREATE TABLE [dbo].[TP_TRASPORTOTOTALEARTICOLO] (
    [RIFPROGRESSIVO]    DECIMAL (18)    NOT NULL,
    [ESERCIZIO]         DECIMAL (5)     NOT NULL,
    [TIPODOC]           VARCHAR (3)     NOT NULL,
    [NUMERODOC]         DECIMAL (10)    NOT NULL,
    [CODART]            VARCHAR (50)    NOT NULL,
    [CODDEPOSITO]       VARCHAR (10)    NOT NULL,
    [TOTALEPEZZI]       INT             NOT NULL,
    [TOTALEPESO]        DECIMAL (16, 6) NOT NULL,
    [TOTALEPEDANA]      DECIMAL (16, 6) NOT NULL,
    [COSTOPEDANA]       DECIMAL (19, 6) NOT NULL,
    [COSTOPEZZOXPEDANA] DECIMAL (19, 6) NOT NULL,
    [COSTOPEZZOXKG]     DECIMAL (19, 6) NOT NULL,
    [UTENTEMODIFICA]    VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]      DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [ESERCIZIO] ASC, [TIPODOC] ASC, [NUMERODOC] ASC, [CODART] ASC, [CODDEPOSITO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_TRASPORTOTOTALEARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_TRASPORTOTOTALEARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_TRASPORTOTOTALEARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_TRASPORTOTOTALEARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_TRASPORTOTOTALEARTICOLO] TO [Metodo98]
    AS [dbo];

