﻿CREATE TABLE [dbo].[MB_PARAMETRIDEP] (
    [TIPODOC]        VARCHAR (3)  NOT NULL,
    [CODDEPOSITO]    VARCHAR (10) NOT NULL,
    [TIPO]           SMALLINT     NOT NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([TIPODOC] ASC, [CODDEPOSITO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[MB_PARAMETRIDEP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MB_PARAMETRIDEP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MB_PARAMETRIDEP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MB_PARAMETRIDEP] TO [Metodo98]
    AS [dbo];

