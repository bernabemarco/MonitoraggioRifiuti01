﻿CREATE TABLE [dbo].[PARAMETRIGPREZZI] (
    [NRRECORD]       DECIMAL (5)  NOT NULL,
    [CFGPREZZI]      INT          NULL,
    [CFGPROVVIGIONI] INT          NULL,
    [CFGPREZZITRASF] INT          NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    [PROVVNOIVA]     SMALLINT     NULL,
    CONSTRAINT [PK_PARAMETRIGPREZZI] PRIMARY KEY CLUSTERED ([NRRECORD] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PARAMETRIGPREZZI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PARAMETRIGPREZZI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PARAMETRIGPREZZI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PARAMETRIGPREZZI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PARAMETRIGPREZZI] TO [Metodo98]
    AS [dbo];

